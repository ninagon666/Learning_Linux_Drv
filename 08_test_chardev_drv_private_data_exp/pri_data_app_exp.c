#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

int main(int argc, char *argv[])
{
    int fd1, fd2;
    char w_buf1[32] = "This is /dev/test_cdev1";
    char w_buf2[32] = "This is /dev/test_cdev2";

    fd1 = open("/dev/test_cdev1", O_RDWR);
    if (fd1 < 0)
    {
        perror("open error \n");
        return fd1;
    }

    fd2 = open("/dev/test_cdev2", O_RDWR);
    if (fd2 < 0)
    {
        perror("open error \n");
        return fd2;
    }

    write(fd1, w_buf1, strlen(w_buf1));
    write(fd2, w_buf2, strlen(w_buf2));

    close(fd1);
    close(fd2);

    return 0;
}