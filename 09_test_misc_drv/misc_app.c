#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

int main(void)
{
    int fd;
    char r_buf[32] = {0};
    char w_buf[32];

    fd = open("/dev/misc_test", O_RDWR);
    if (fd < 0)
    {
        perror("open error \n");
        return fd;
    }

    read(fd, r_buf, sizeof(r_buf));
    printf("read data is %s\n", r_buf);
    strcpy(w_buf, "This is a user data");
    write(fd, w_buf, strlen(w_buf));

    close(fd);

    return 0;
}
