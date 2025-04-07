#define ANSI_IMPLEMENTATION
#include "ansi.h"

int main() {
    char color[64];
    ansi_color(color, 2, ANSI_FG);

    printf("%sHello in green%s\n", color, ANSI_RESET);

    char red_and_bold[64];
    ansi_combine(red_and_bold, ANSI_RED, ANSI_BOLD);

    int age = 14;
    ANSI_WRAP_AND_PRINT(red_and_bold, "Error: age < 18. Found %d", age);

    ansi_clear_screen();

    return 0;
}
