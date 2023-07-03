#include "linux/export.h"
#include <linux/module.h>
#include <linux/init.h>

extern int drv_a_addr(int a,int b);

int drv_a_addr(int a,int b)
{
  printk("drv_a get input1 is %d, input2 is %d", a, b);
  return a + b;
}

EXPORT_SYMBOL(drv_a_addr);

static int hello_init(void)
{
    printk("hello world");
    return 0;
}

static void hello_exit(void)
{
    printk("goodbye world");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
