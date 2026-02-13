#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // You can use print statements as follows for debugging, they'll be visible when running tests.
    fprintf(stderr, "Logs from your program will appear here!\n");

    printf("$ ");
    fflush(stdout);

    return 0;
}
