#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    int fd;
    char status;
    if (argc != 2)
    {
        printf("[Usage]: %s <on/off>\n", argv[0]);
        return -1;
    }

    fd = open("/dev/usr_led", O_RDWR);
    if (fd < 0)
    {
        perror("open error");
        return -1;
    }

    if (strcmp(argv[1], "on") == 0)
    {
        // 开灯
        status = 1;
        write(fd, &status, 1);
    }
    else if (strcmp(argv[1], "off") == 0)
    {
        // 关灯
        status = 0;
        write(fd, &status, 1);
    }
    else
    {
        printf("[Usage]: %s <on/off>\n", argv[0]);
        return -1;
    }

    close(fd);
    return 0;
}
