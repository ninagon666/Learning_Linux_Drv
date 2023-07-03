#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kdev_t.h>
#include <linux/module.h>
#include <linux/moduleparam.h>

static int major = 0;
static int minor = 0;

// 给驱动传入一个int参数, S_IRUGO表示所有用户(User/Guide/Other)只读
module_param(major, int, S_IRUGO); // 用于存放主设备号的参数
module_param(minor, int, S_IRUGO); // 用于存放次设备号的参数

static dev_t dev_num;

static int moudle_test_chardev_init(void) {
  // dev_t dev_num;
  int ret;
  // 如果输入了设备号,采用静态申请方法
  if (major) {
    printk("major is %d\n", major);
    printk("minor is %d\n", minor);
    dev_num = MKDEV(major, minor); // 通过主设备号和次设备号得到具体的设备号

    // 静态申请设备号 [设备号] [次设备数量] [设备名称]
    ret = register_chrdev_region(dev_num, 1, "test_chardev");

    if (ret < 0) {
      printk("register chrdev region fail\n");
    }
    printk("register chrdev region ok\n");
  }
  // 如果没有输入,采用动态申请方法
  else {
    // 动态申请设备号 [存放设备号的地址] [起始地址] [次设备数量] [设备名称]
    ret = alloc_chrdev_region(&dev_num, 0, 1, "test_chardev");
    if (ret < 0) {
      printk("register chrdev region fail\n");
    }
    printk("register chrdev region ok\n");

    major = MAJOR(dev_num); // 获取主设备号
    minor = MINOR(dev_num); // 获取次设备号
    printk("major is %d\n", major);
    printk("minor is %d\n", minor);
  }

  return ret;
}

static void moudle_test_chardev_exit(void) {
  unregister_chrdev_region(dev_num, 1);
  printk("goodbye world");
}

module_init(moudle_test_chardev_init);
module_exit(moudle_test_chardev_exit);

MODULE_LICENSE("GPL");
