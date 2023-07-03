#include "linux/err.h"
#include "linux/export.h"
#include <asm/io.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/errno.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kdev_t.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/uaccess.h>
#include <linux/wait.h>

/* led寄存器地址相关 */
// SW_MUX_CTL_PAD_SNVS_TAMPER3 地址：0x02290000 + 0x14
#define SW_MUX_CTL_PAD_SNVS_TAMPER3 0x02290000 + 0x14
// GPIO5_GDIR 地址：0x020AC004
#define GPIO5_GDIR 0x020AC004
// GPIO5_DR 地址：0x020AC000
#define GPIO5_DR 0x020AC000

// 在之前的基础上封装一个设备结构体
typedef struct
{
    int major;
    int minor;
    dev_t dev_num;
    char led_status;
    struct cdev led_cdev;
    struct class *led_class;
    struct device *led_device;
    volatile unsigned int *gpio_addr;
    volatile unsigned int *gpio_gdir;
    volatile unsigned int *gpio_dr;
} led_device_t, *ptr_led_device_t;

static led_device_t usr_dev;

static int cdev_led_open(struct inode *inode, struct file *file)
{
    // 利用file->private_data私有数据来注册一个设备结构体,实现数据隔离
    file->private_data = &usr_dev;
    /* 此处完成对led的基础配置
     * 使能GPIO5
     * 配置GPIO5_IO3功能为GPIO
     * GPIO5在SNVS域,所以GPIO5_3是SNVS_TAMPER3
     * SNVS是SNVS_TAMPER3Secure Non Volatile Stronge,该域IO一般只有GPIO功能
     * SW_MUX_CTL_PAD_SNVS_TAMPER3低四位配置为0101时为GPIO mode
     * 根据手册上可知第五位SION配置为1时IO模式固定为SNVS_TAMPER3功能
     * SION配置为0时IO功能可被复用,但SNVS域的IO通常只有gpio功能
     * GPIO5_3只有GPIO功能,所以SION无论设置0还是1均不影响配置
     * 配置GPIO5_IO3输出模式
     */
    // *SW_MUX_CTL_PAD_SNVS_TAMPER3 |= 1 << 5; // 将第五位置位
    *usr_dev.gpio_addr &= ~(1 << 5); // 将第五位复位
    *usr_dev.gpio_addr &= ~0xf;      // 清除低4位
    *usr_dev.gpio_addr |= 0x5;       // 配置为0101

    // *GPIO5_GDIR |= (1 << 3); // GDIR寄存器第三位置位,配置为OUTPUT mode
    printk("device led is open\n");

    return 0;
}

static ssize_t cdev_led_read(struct file *file, char __user *buf, size_t size, loff_t *off)
{
    // 从file->private_data中拿到设备结构体
    ptr_led_device_t usr_dev_p = (ptr_led_device_t)file->private_data;

    *usr_dev_p->gpio_gdir &= ~(1 << 3); // GDIR寄存器第三位复位,配置为INPUT mode
    usr_dev_p->led_status = -1;

    printk("cdev_led read\n");
    if (*usr_dev_p->gpio_dr & (1 << 3)) // DR第三位为1时,IO为高电位
    {
        usr_dev_p->led_status = 0; // 此时LED熄灭
    }
    else if (!(*usr_dev_p->gpio_dr & (1 << 3))) // DR第三位为0时,IO为低电位
    {
        usr_dev_p->led_status = 1; // 此时LED点亮
    }

    if (copy_to_user(buf, &usr_dev_p->led_status, sizeof(char)) != 0)
    {
        printk("copy to user fail\n");
        return -1;
    }

    return 0;
}

static ssize_t cdev_led_write(struct file *file, const char __user *buf, size_t size, loff_t *off)
{
    // 从file->private_data中拿到设备结构体
    ptr_led_device_t usr_dev_p = (ptr_led_device_t)file->private_data;

    *usr_dev_p->gpio_gdir |= (1 << 3); // GDIR寄存器第三位置位,配置为OUTPUT mode
    if (copy_from_user(&usr_dev_p->led_status, buf, size))
    {
        printk("copy from user fail\n");
        return -1;
    }

    if (usr_dev_p->led_status)
    {
        /* 复位GPIO5_3,点亮LED */
        *usr_dev_p->gpio_dr &= ~(1 << 3);
    }
    else
    {
        /* 置位GPIO5_3,关闭LED */
        *usr_dev_p->gpio_dr |= (1 << 3);
    }

    printk("led write %d\n", usr_dev_p->led_status);

    return 0;
}

static int cdev_led_release(struct inode *inode, struct file *file)
{
    printk("cdev led release\n");
    return 0;
}

static struct file_operations led_cdev_ops = {.owner = THIS_MODULE,
                                              .open = cdev_led_open,
                                              .read = cdev_led_read,
                                              .write = cdev_led_write,
                                              .release = cdev_led_release};

static int moudle_led_cdev_reg_init(void)
{
    int ret;

    // 动态申请设备号 [存放设备号的地址] [起始地址] [次设备数量] [设备名称]
    ret = alloc_chrdev_region(&usr_dev.dev_num, 0, 1, "led_chardev");
    if (ret < 0)
    {
        printk("register chrdev region fail\n");
        goto ERR_CHRDEV;
    }
    printk("register chrdev region ok\n");

    usr_dev.major = MAJOR(usr_dev.dev_num); // 获取主设备号
    usr_dev.minor = MINOR(usr_dev.dev_num); // 获取次设备号
    printk("major is %d\n", usr_dev.major);
    printk("minor is %d\n", usr_dev.minor);

    /* ioremap */
    // IOMUXC:SW_MUX_CTL_PAD_SNVS_TAMPER3 地址：0x02290000 + 0x14
    usr_dev.gpio_addr = ioremap(SW_MUX_CTL_PAD_SNVS_TAMPER3, 4);
    // GPIO5_GDIR 地址：0x020AC004
    usr_dev.gpio_gdir = ioremap(GPIO5_GDIR, 4);
    // GPIO5_DR 地址：0x020AC000
    usr_dev.gpio_dr = ioremap(GPIO5_DR, 4);

    usr_dev.led_cdev.owner = THIS_MODULE;
    // 初始化字符设备 [字符设备结构体] [文件操作函数集]
    cdev_init(&usr_dev.led_cdev, &led_cdev_ops);
    // 添加字符设备 [字符设备结构体] [设备号] [设备数量]
    ret = cdev_add(&usr_dev.led_cdev, usr_dev.dev_num, 1);
    if (ret < 0)
    {
        printk("cdev add fail\n");
        goto ERR_CDEV_ADD;
    }

    usr_dev.led_class =
        class_create(THIS_MODULE,
                     "led_cdev"); // 创建类,会在/sys/class路径下创建一个名为led_cdev的文件夹,里面带有一些信息
    if (IS_ERR(usr_dev.led_class)) // IS_ERR可以判断函数返回指针是否在错误范围内,返回值为1则代表返回了错误值
    {
        printk("class create fail\n");
        ret = PTR_ERR(usr_dev.led_class); // PTR_ERR可以将函数返回指针转换为错误代码数值
        goto ERR_CLASS_CRT;
    }

    usr_dev.led_device =
        device_create(usr_dev.led_class, NULL, usr_dev.dev_num, NULL, "led_cdev"); // 通过刚刚创建的类来创建设备节点
    if (IS_ERR(usr_dev.led_device)) // IS_ERR可以判断函数返回指针是否在错误范围内,返回值为1则代表返回了错误值
    {
        printk("device create fail\n");
        ret = PTR_ERR(usr_dev.led_device); // PTR_ERR可以将函数返回指针转换为错误代码数值
        goto ERR_DEV_CRT;
    }

    return 0;

    // 按加载顺序处理错误
ERR_DEV_CRT:
    class_destroy(usr_dev.led_class);
ERR_CLASS_CRT:
    cdev_del(&usr_dev.led_cdev); // 删除字符设备
ERR_CDEV_ADD:
    unregister_chrdev_region(usr_dev.dev_num, 1); // 删除设备号
    iounmap(usr_dev.gpio_addr);
    iounmap(usr_dev.gpio_gdir);
    iounmap(usr_dev.gpio_dr);
ERR_CHRDEV:
    return ret;
}

static void moudle_led_cdev_reg_exit(void)
{
    cdev_del(&usr_dev.led_cdev);                  // 删除字符设备
    unregister_chrdev_region(usr_dev.dev_num, 1); // 删除设备号
    iounmap(usr_dev.gpio_addr);
    iounmap(usr_dev.gpio_gdir);
    iounmap(usr_dev.gpio_dr);

    device_destroy(usr_dev.led_class, usr_dev.dev_num);
    class_destroy(usr_dev.led_class);

    printk("goodbye world");
}

module_init(moudle_led_cdev_reg_init);
module_exit(moudle_led_cdev_reg_exit);

MODULE_LICENSE("GPL");
