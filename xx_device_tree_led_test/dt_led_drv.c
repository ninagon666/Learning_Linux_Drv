/* 编写要点
 1. 完成平台驱动(platform_driver_register())的注册，probe, remove函数的实现
 2. 完成驱动(driver_register())的注册,增加设备节点，实现file_operation结构体的相关函数
*/

#include <asm/io.h>
#include <asm/mach/map.h>
#include <linux/device.h>
#include <linux/errno.h>
#include <linux/fs.h>
#include <linux/gfp.h>
#include <linux/gpio.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/kmod.h>
#include <linux/major.h>
#include <linux/miscdevice.h>
#include <linux/module.h>
#include <linux/mutex.h>
#include <linux/of.h>
#include <linux/of_gpio.h>
#include <linux/platform_device.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/stat.h>
#include <linux/tty.h>

static int major = 0; // 主设备号
static struct class *led_class;

static int usr_led;

static int led_drv_open(struct inode *node, struct file *file)
{
    printk("usr_led is open\n");
    printk("===============%s===============\n", __FUNCTION__);
    return 0;
}
static int led_drv_close(struct inode *node, struct file *file)
{

    printk("%s\n", __FUNCTION__);
    return 0;
}

static ssize_t led_drv_read(struct file *file, char __user *buf, size_t size, loff_t *offset)
{

    printk("%s\n", __FUNCTION__);
    return 0;
}

static ssize_t led_drv_write(struct file *file, const char __user *buf, size_t size, loff_t *offset)
{
    char status;

    if (copy_from_user(&status, buf, 1))
    {
        printk("copy from user fail\n");
        return -1;
    }

    if (status)
    {
        // 开灯
        gpio_direction_output(usr_led, 0);
    }
    else
    {
        // 关灯
        gpio_direction_output(usr_led, 1);
    }
    printk("%s\n", __FUNCTION__);
    return 0;
}

static struct file_operations led_drv = {
    .owner = THIS_MODULE, // gcc用法
    .open = led_drv_open,
    .read = led_drv_read,
    .write = led_drv_write,
    .release = led_drv_close,
};

static int usr_led_probe(struct platform_device *pdev)
{
    int err;
    // 获取资源
    struct device_node *led_device_node = NULL;

    // led节点的父节点
    led_device_node = of_find_node_by_path("/usr_led");
    if (led_device_node == NULL)
    {
        printk("%s,%s,%d error: not find /usr_led\n", __FILE__, __FUNCTION__, __LINE__);
        return -1;
    }

    // 获取引脚编号
    usr_led = of_get_named_gpio(led_device_node, "usr_led", 0);

    printk("========usr_led: %d=========\n", usr_led);

    gpio_direction_output(usr_led, 1);

    // 完成字符设备的注册
    major = register_chrdev(0, "usr_led", &led_drv);

    // 注册设备类
    led_class = class_create(THIS_MODULE, "usrled_class");
    err = PTR_ERR(led_class);
    if (IS_ERR(led_class))
    {
        unregister_chrdev(major, "usr_led");
        return -1;
    }

    // 注册设备节点，/dev/usr_led
    device_create(led_class, NULL, MKDEV(major, 0), NULL, "usr_led");

    printk("=======================%s========================\n", __FUNCTION__);
    return 0;
}

static int usr_led_remove(struct platform_device *dev)
{
    // 释放设备节点
    device_destroy(led_class, MKDEV(major, 0));

    // 释放设备类
    class_destroy(led_class);

    // 释放注册字符设备
    unregister_chrdev(major, "usr_led");

    printk("%s\n", __FUNCTION__);
    return 0;
}

static const struct of_device_id usr_led_table[] = {
    {.compatible = "test-usr-led"},
};

static struct platform_driver usr_led_platform_driver = {
    .probe = usr_led_probe,
    .remove = usr_led_remove,
    .driver = {
        .name = "usr-led-device-tree",
        .owner = THIS_MODULE,
        .of_match_table = usr_led_table, // match匹配的时候会用到这个列表里面的compatible和设备树里面的compatible对比
    }};

// 平台驱动入口函数
static int __init platform_usr_led_init(void)
{

    int ret = 0;
    // 完成平台驱动的注册
    ret = platform_driver_register(&usr_led_platform_driver);

    printk("%s\n", __FUNCTION__);
    return 0;
}

// 平台驱动出口函数
static void __exit platform_usr_led_exit(void)
{
    // 完成平台驱动的移除
    platform_driver_unregister(&usr_led_platform_driver);

    printk("%s\n", __FUNCTION__);
    return;
}

module_init(platform_usr_led_init);
module_exit(platform_usr_led_exit);
MODULE_LICENSE("GPL");
