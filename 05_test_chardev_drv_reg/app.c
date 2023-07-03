#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

int main(int argc, char *argv[])
{
    int fd;

    if (argc < 2)
    {
        printf("[Usage]: ./app /dev/test_chardev\n");
        return 0;
    }
    else
    {
        fd = open(argv[1], O_RDWR);
        if (fd < 0)
        {
            perror("open error \n");
            return fd;
        }
    }
    close(fd);

    return 0;
}