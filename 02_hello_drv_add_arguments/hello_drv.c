#include <linux/init.h>
#include <linux/module.h>
#include "linux/moduleparam.h"

static int a;
static int array[5];
static int array_size;
static char str1[10];

module_param(a, int, S_IRUGO); // 给驱动传入一个int参数, S_IRUGO表示所有用户(User/Guide/Other)只读
MODULE_PARM_DESC(a, "e.g:insmod xxx.ko a=1"); //描述参数信息, 在insmod xxx.ko时后跟上a=xx

module_param_array(array, int, &array_size, S_IRUGO); //给驱动传入一个数组型参数
MODULE_PARM_DESC(array, "e.g:insmod xxx.ko array=1,2,3"); // 描述参数信息

module_param_string(str, str1, sizeof(str1), S_IRUGO); //给驱动传入一个字符串型参数
MODULE_PARM_DESC(str, "e.g:insmod xxx.ko str=hello"); // 描述参数信息

static int hello_init(void)
{
    int i;

    // printk("hello world");
    printk("a is %d\n", a);

    for(i = 0; i < array_size; ++i)
        printk("array[%d] is %d\n", i, array[i]);

    printk("array_size is %d\n", array_size);

    printk("str1 is %s\n", str1);
    
    return 0;
}

static void hello_exit(void)
{
    printk("goodbye world");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
