#include "linux/export.h"
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kdev_t.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/uaccess.h>
// #include <linux/include/asm-arm/uaccess.h>

static int major = 0;
static int minor = 0;

static dev_t dev_num;

static struct cdev cdev_test;

static struct class *class;
static struct device *device;

static int cdev_test_open(struct inode *inode, struct file *file)
{
    printk("cdev_test open\n");
    return 0;
}

static ssize_t cdev_test_read(struct file *file, char __user *buf, size_t size, loff_t *off)
{
    char k_buf[32] = "This is a kernel data";

    printk("cdev_test read\n");
    if (copy_to_user(buf, k_buf, strlen(k_buf)) != 0)
    {
        printk("copy to user fail\n");
        return -1;
    }

    return 0;
}

static ssize_t cdev_test_write(struct file *file, const char __user *buf, size_t size, loff_t *off)
{
    char k_buf[32];

    printk("cdev_test write\n");
    if (copy_from_user(k_buf, buf, size))
    {
        printk("copy from user fail\n");
        return -1;
    }

    printk("copy from user data is %s\n", k_buf);

    return 0;
}

static int cdev_test_release(struct inode *inode, struct file *file)
{
    printk("cdev_test release\n");
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
    ret = alloc_chrdev_region(&dev_num, 0, 1, "test_chardev");
    if (ret < 0)
    {
        printk("register chrdev region fail\n");
    }
    printk("register chrdev region ok\n");

    major = MAJOR(dev_num); // 获取主设备号
    minor = MINOR(dev_num); // 获取次设备号
    printk("major is %d\n", major);
    printk("minor is %d\n", minor);

    cdev_test.owner = THIS_MODULE;
    // 初始化字符设备 [字符设备结构体] [文件操作函数集]
    cdev_init(&cdev_test, &cdev_test_ops);
    // 添加字符设备 [字符设备结构体] [设备号] [设备数量]
    cdev_add(&cdev_test, dev_num, 1);

    class = class_create(THIS_MODULE,
                         "test_cdev"); // 创建类,会在/sys/class路径下创建一个名为test_cdev的文件夹,里面带有一些信息
    device = device_create(class, NULL, dev_num, NULL, "test_cdev"); // 通过刚刚创建的类来创建设备节点

    return ret;
}

static void moudle_test_cdev_reg_exit(void)
{
    cdev_del(&cdev_test);                 // 删除字符设备
    unregister_chrdev_region(dev_num, 1); // 删除设备号

    device_destroy(class, dev_num);
    class_destroy(class);

    printk("goodbye world");
}

module_init(moudle_test_cdev_reg_init);
module_exit(moudle_test_cdev_reg_exit);

MODULE_LICENSE("GPL");
