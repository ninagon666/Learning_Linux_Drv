#include "linux/export.h"
#include <asm/atomic.h>
#include <linux/atomic.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kdev_t.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/uaccess.h>

// 在之前的基础上封装一个设备结构体
typedef struct
{
    int major;
    int minor;
    dev_t dev_num;
    char k_buf[32];
    struct cdev cdev_test;
    struct class *class;
    struct device *device;
} device_test_t, *ptr_device_test_t;

static device_test_t usr_dev;
static atomic_t v = ATOMIC_INIT(1); // 创建一个初值为1的原子变量v

static int cdev_test_open(struct inode *inode, struct file *file)
{
    if (!atomic_dec_and_test(&v)) // 将原子变量减1并判断是否为0,为0是返回为真
    {
        atomic_inc(&v); // 将原子变量+1
        printk("device is busy\n");
        return -EBUSY;
    }
    // 利用file->private_data私有数据来注册一个设备结构体,实现数据隔离
    file->private_data = &usr_dev;
    printk("cdev_test open\n");
    return 0;
}

static ssize_t cdev_test_read(struct file *file, char __user *buf, size_t size, loff_t *off)
{
    // 从file->private_data中拿到设备结构体
    ptr_device_test_t usr_dev_p = (ptr_device_test_t)file->private_data;
    memset(usr_dev_p->k_buf, 0, sizeof(usr_dev_p->k_buf));
    memcpy(usr_dev_p->k_buf, "This is a kernel data", sizeof("This is a kernel data") - 1);

    printk("cdev_test read\n");
    if (copy_to_user(buf, usr_dev_p->k_buf, strlen(usr_dev_p->k_buf)) != 0)
    {
        printk("copy to user fail\n");
        return -1;
    }

    return 0;
}

static ssize_t cdev_test_write(struct file *file, const char __user *buf, size_t size, loff_t *off)
{
    // 从file->private_data中拿到设备结构体
    ptr_device_test_t usr_dev_p = (ptr_device_test_t)file->private_data;
    memset(usr_dev_p->k_buf, 0, sizeof(usr_dev_p->k_buf));

    printk("cdev_test write\n");
    if (copy_from_user(usr_dev_p->k_buf, buf, size))
    {
        printk("copy from user fail\n");
        return -1;
    }

    printk("copy from user data is %s\n", usr_dev_p->k_buf);

    return 0;
}

static int cdev_test_release(struct inode *inode, struct file *file)
{
    printk("cdev_test release\n");
    atomic_inc(&v); // 将原子变量+1(关闭设备时调用,类似释放锁的操作)
    return 0;
}

static struct file_operations cdev_test_ops = {.owner = THIS_MODULE,
                                               .open = cdev_test_open,
                                               .read = cdev_test_read,
                                               .write = cdev_test_write,
                                               .release = cdev_test_release};

static int moudle_test_cdev_reg_init(void)
{
    // dev_t dev_num;
    int ret;

    // 动态申请设备号 [存放设备号的地址] [起始地址] [次设备数量] [设备名称]
    ret = alloc_chrdev_region(&usr_dev.dev_num, 0, 1, "test_chardev");
    if (ret < 0)
    {
        printk("register chrdev region fail\n");
    }
    printk("register chrdev region ok\n");

    usr_dev.major = MAJOR(usr_dev.dev_num); // 获取主设备号
    usr_dev.minor = MINOR(usr_dev.dev_num); // 获取次设备号
    printk("major is %d\n", usr_dev.major);
    printk("minor is %d\n", usr_dev.minor);

    usr_dev.cdev_test.owner = THIS_MODULE;
    // 初始化字符设备 [字符设备结构体] [文件操作函数集]
    cdev_init(&usr_dev.cdev_test, &cdev_test_ops);
    // 添加字符设备 [字符设备结构体] [设备号] [设备数量]
    cdev_add(&usr_dev.cdev_test, usr_dev.dev_num, 1);

    usr_dev.class =
        class_create(THIS_MODULE,
                     "test_cdev"); // 创建类,会在/sys/class路径下创建一个名为test_cdev的文件夹,里面带有一些信息
    usr_dev.device =
        device_create(usr_dev.class, NULL, usr_dev.dev_num, NULL, "test_cdev"); // 通过刚刚创建的类来创建设备节点

    return ret;
}

static void moudle_test_cdev_reg_exit(void)
{
    cdev_del(&usr_dev.cdev_test);                 // 删除字符设备
    unregister_chrdev_region(usr_dev.dev_num, 1); // 删除设备号

    device_destroy(usr_dev.class, usr_dev.dev_num);
    class_destroy(usr_dev.class);

    printk("goodbye world");
}

module_init(moudle_test_cdev_reg_init);
module_exit(moudle_test_cdev_reg_exit);

MODULE_LICENSE("GPL");
