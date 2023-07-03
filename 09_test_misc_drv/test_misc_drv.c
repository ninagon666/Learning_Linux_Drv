#include "linux/export.h"
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kdev_t.h>
#include <linux/miscdevice.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/uaccess.h>

static int misc_test_open(struct inode *inode, struct file *file)
{
    printk("misc_test open\n");
    return 0;
}

static ssize_t misc_test_read(struct file *file, char __user *buf, size_t size, loff_t *off)
{
    char k_buf[32] = "This is a kernel data";

    printk("misc_test read\n");
    if (copy_to_user(buf, k_buf, strlen(k_buf)) != 0)
    {
        printk("copy to user fail\n");
        return -1;
    }

    return 0;
}

static ssize_t misc_test_write(struct file *file, const char __user *buf, size_t size, loff_t *off)
{
    char k_buf[32] = {0};

    printk("misc_test write\n");
    if (copy_from_user(k_buf, buf, size))
    {
        printk("copy from user fail\n");
        return -1;
    }

    printk("copy from user data is %s\n", k_buf);

    return 0;
}

static int misc_test_release(struct inode *inode, struct file *file)
{
    printk("misc_test release\n");
    return 0;
}

static struct file_operations misc_test_ops = {.owner = THIS_MODULE,
                                               .open = misc_test_open,
                                               .read = misc_test_read,
                                               .write = misc_test_write,
                                               .release = misc_test_release};

// 创建一个杂项设备结构体,动态(自动分配)次设备号,实例化ops函数集
static struct miscdevice misc_dev = {.minor = MISC_DYNAMIC_MINOR, .name = "misc_test", .fops = &misc_test_ops};

static int moudle_test_misc_init(void)
{
    int ret;

    ret = misc_register(&misc_dev); // 注册杂项设备,杂项设备的特点为主设备号固定为10,其余和字符型设备类似

    if (ret < 0)
    {
        printk("misc reg fail\n");
        return -1;
    }

    return ret;
}

static void moudle_test_misc_exit(void)
{
    misc_deregister(&misc_dev);
    printk("goodbye world");
}

module_init(moudle_test_misc_init);
module_exit(moudle_test_misc_exit);

MODULE_LICENSE("GPL");
