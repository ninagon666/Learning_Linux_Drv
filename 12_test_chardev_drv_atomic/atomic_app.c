#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

int main(int argc, char *argv[])
{
    int fd;

    fd = open("/dev/test_cdev", O_RDWR);
    if (fd < 0)
    {
        perror("open error \n");
        return fd;
    }

    sleep(5);//睡眠5s,因为原子操作保护了设备,在这段时间内运行第二个app会打印busy

    close(fd);

    return 0;
}