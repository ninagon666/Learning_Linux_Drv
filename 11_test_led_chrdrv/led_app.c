#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

int main(int argc, char *argv[])
{
    int fd;
    char led_status;

    if (argc != 2)
    {
        goto INPUT_ERR;
    }
    else
    {
        fd = open("/dev/led_cdev", O_RDWR);
        if (fd < 0)
        {
            perror("open error \n");
            return fd;
        }
        printf("open led is ok\n");
    }
    read(fd, &led_status, 1);
    printf("Before write, led status is %d\n", led_status);

    // write
    if (strcmp(argv[1], "on") == 0)
    {
        led_status = 1;
    }
    else if (strcmp(argv[1], "off") == 0)
    {
        led_status = 0;
    }
    else
    {
        goto INPUT_ERR;
    }
    write(fd, &led_status, 1);
    printf("write led done\n");

    read(fd, &led_status, 1);
    printf("After write, led status is %d\n", led_status);

    close(fd);

    return 0;

INPUT_ERR:
    printf("[Usage]: %s <on|off>\n", argv[0]);
    return 0;
}