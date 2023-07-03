#include "linux/export.h"
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

static device_test_t usr_dev1, usr_dev2;

static int cdev_test_open(struct inode *inode, struct file *file)
{
    // 设置两个设备的次设备号为0和1
    usr_dev1.minor = 0;
    usr_dev2.minor = 1;
    // 利用file->private_data私有数据来注册一个设备结构体,实现数据隔离
    // 通过inode里的cdev获取到设备,利用container_of计算地址偏移得到设备结构体的首地址
    // 因为次设备号不同的两个设备在初始化时创建用的设备号是连续的,所以通过cdev的偏移地址可以指向各自的设备结构体
    file->private_data = container_of(inode->i_cdev, device_test_t, cdev_test);
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

    if (usr_dev_p->minor == 0)
    {
        if (copy_from_user(usr_dev_p->k_buf, buf, size))
        {
            printk("copy from user fail\n");
            return -1;
        }
        memcpy(usr_dev_p->k_buf + size, " minor 0", sizeof(" minor 0"));
    }
    else if (usr_dev_p->minor == 1)
    {
        if (copy_from_user(usr_dev_p->k_buf, buf, size))
        {
            printk("copy from user fail\n");
            return -1;
        }
        memcpy(usr_dev_p->k_buf + size, " minor 1", sizeof(" minor 1"));
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
    ret = alloc_chrdev_region(&usr_dev1.dev_num, 0, 2, "test_chardev");
    if (ret < 0)
    {
        printk("register chrdev region fail\n");
    }
    printk("register chrdev region ok\n");

    usr_dev1.major = MAJOR(usr_dev1.dev_num); // 获取主设备号
    usr_dev1.minor = MINOR(usr_dev1.dev_num); // 获取次设备号
    printk("major is %d\n", usr_dev1.major);
    printk("minor is %d\n", usr_dev1.minor);

    usr_dev1.cdev_test.owner = THIS_MODULE;
    // 初始化字符设备 [字符设备结构体] [文件操作函数集]
    cdev_init(&usr_dev1.cdev_test, &cdev_test_ops);
    // 添加字符设备 [字符设备结构体] [设备号] [设备数量]
    cdev_add(&usr_dev1.cdev_test, usr_dev1.dev_num, 1);

    usr_dev1.class =
        class_create(THIS_MODULE,
                     "test_cdev1"); // 创建类,会在/sys/class路径下创建一个名为test_cdev的文件夹,里面带有一些信息
    usr_dev1.device =
        device_create(usr_dev1.class, NULL, usr_dev1.dev_num, NULL, "test_cdev1"); // 通过刚刚创建的类来创建设备节点

    usr_dev2.major = MAJOR(usr_dev1.dev_num + 1); // 获取主设备号
    usr_dev2.minor = MINOR(usr_dev1.dev_num + 1); // 获取次设备号
    printk("major is %d\n", usr_dev2.major);
    printk("minor is %d\n", usr_dev2.minor);

    usr_dev2.cdev_test.owner = THIS_MODULE;
    // 初始化字符设备 [字符设备结构体] [文件操作函数集]
    cdev_init(&usr_dev2.cdev_test, &cdev_test_ops);
    // 添加字符设备 [字符设备结构体] [设备号] [设备数量]
    cdev_add(&usr_dev2.cdev_test, usr_dev1.dev_num + 1, 1);

    usr_dev2.class =
        class_create(THIS_MODULE,
                     "test_cdev2"); // 创建类,会在/sys/class路径下创建一个名为test_cdev的文件夹,里面带有一些信息
    usr_dev2.device =
        device_create(usr_dev2.class, NULL, usr_dev1.dev_num + 1, NULL, "test_cdev2"); // 通过刚刚创建的类来创建设备节点

    return ret;
}

static void moudle_test_cdev_reg_exit(void)
{
    cdev_del(&usr_dev1.cdev_test);                     // 删除字符设备
    cdev_del(&usr_dev2.cdev_test);                     // 删除字符设备
    unregister_chrdev_region(usr_dev1.dev_num, 1);     // 删除设备号
    unregister_chrdev_region(usr_dev1.dev_num + 1, 1); // 删除设备号

    device_destroy(usr_dev1.class, usr_dev1.dev_num);
    device_destroy(usr_dev2.class, usr_dev1.dev_num + 1);
    class_destroy(usr_dev1.class);
    class_destroy(usr_dev2.class);

    printk("goodbye world");
}

module_init(moudle_test_cdev_reg_init);
module_exit(moudle_test_cdev_reg_exit);

MODULE_LICENSE("GPL");
