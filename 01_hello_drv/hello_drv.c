#include <linux/module.h>
#include <linux/init.h>

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
