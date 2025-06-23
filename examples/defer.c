#include "../libs/defer.h"
#include <stdio.h>

int main() {
    defer {
        printf(" World\n");
    }

    printf("Hello");

    return 0;
}
