#include <stdio.h>
#define STRING_IMPLEMENTATION
#include "string.h"

int main()
{
    ArenaInit(1024);

    char buffer[128];
    FILE* file = fopen("file.txt", "r");
    if(!file) {
        fprintf(stderr, "Could not open file");
        return 1;
    }
    fread(buffer, sizeof(buffer), 1, file);
    fclose(file);

    string_t str = String(buffer);
    string_array_t words = Split(str, '\n');
    for(size_t i = 0; i < words.count; i++){
        printf("> %s\n", words.strings[i].chars);
    }

    ArenaFree();

    return 0;
}
