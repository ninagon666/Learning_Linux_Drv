#include <linux/module.h>
#include <linux/init.h>

extern int drv_a_addr(int a, int b);

static int hello_init(void)
{
    int out;

    out = drv_a_addr(1, 2);
    printk("drv_b get output is %d", out);
    return 0;
}

static void hello_exit(void)
{
    printk("goodbye world");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
