#include "linux/err.h"
#include "linux/export.h"
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kdev_t.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/uaccess.h>
#include <linux/errno.h>

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

static int cdev_test_open(struct inode *inode, struct file *file)
{
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
    return 0;
}

static struct file_operations cdev_test_ops = {.owner = THIS_MODULE,
                                               .open = cdev_test_open,
                                               .read = cdev_test_read,
                                               .write = cdev_test_write,
                                               .release = cdev_test_release};

static int moudle_test_cdev_reg_init(void)
{
    int ret;

    // 动态申请设备号 [存放设备号的地址] [起始地址] [次设备数量] [设备名称]
    ret = alloc_chrdev_region(&usr_dev.dev_num, 0, 1, "test_chardev");
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

    usr_dev.cdev_test.owner = THIS_MODULE;
    // 初始化字符设备 [字符设备结构体] [文件操作函数集]
    cdev_init(&usr_dev.cdev_test, &cdev_test_ops);
    // 添加字符设备 [字符设备结构体] [设备号] [设备数量]
    ret = cdev_add(&usr_dev.cdev_test, usr_dev.dev_num, 1);
    if (ret < 0)
    {
        printk("cdev add fail\n");
        goto ERR_CDEV_ADD;
    }

    usr_dev.class =
        class_create(THIS_MODULE,
                     "test_cdev"); // 创建类,会在/sys/class路径下创建一个名为test_cdev的文件夹,里面带有一些信息
    if (IS_ERR(usr_dev.class)) // IS_ERR可以判断函数返回指针是否在错误范围内,返回值为1则代表返回了错误值
    {
        printk("class create fail\n");
        ret = PTR_ERR(usr_dev.class); // PTR_ERR可以将函数返回指针转换为错误代码数值
        goto ERR_CLASS_CRT;
    }

    usr_dev.device =
        device_create(usr_dev.class, NULL, usr_dev.dev_num, NULL, "test_cdev"); // 通过刚刚创建的类来创建设备节点
    if (IS_ERR(usr_dev.device)) // IS_ERR可以判断函数返回指针是否在错误范围内,返回值为1则代表返回了错误值
    {
        printk("device create fail\n");
        ret = PTR_ERR(usr_dev.device); // PTR_ERR可以将函数返回指针转换为错误代码数值
        goto ERR_DEV_CRT;
    }

    return 0;

    // 按加载顺序处理错误
ERR_DEV_CRT:
    class_destroy(usr_dev.class);
ERR_CLASS_CRT:
    cdev_del(&usr_dev.cdev_test); // 删除字符设备
ERR_CDEV_ADD:
    unregister_chrdev_region(usr_dev.dev_num, 1); // 删除设备号
ERR_CHRDEV:
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
