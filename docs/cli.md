# cli.h

## Get started

```bash
wget https://raw.githubusercontent.com/IncludeOnly/cli.h/refs/heads/main/cli.h
```

## Example

```c
#include <stdio.h>
#define CLI_IMPLEMENTATION
#include "cli.h"

int main(int argc, char** argv){
    cli_args_t args = cli_args_make(
        cli_arg_new('h', "help", "Prints this message", no_argument),
        cli_arg_new('v', "version", "Prints the version of the program", no_argument),
        cli_arg_new('g', "greet", "Say hello", required_argument),
        NULL
    );

    int opt;
    LOOP_ARGS(opt, args){
        switch (opt) {
        case 'h':
            cli_help(args, "./main [OPTIONS...]", "Made by KDesp73");
            exit(0);
        case 'v':
            printf("cli.h v%s\n", CLI_VERSION);
            exit(0);
        case 'g':
            printf("Hello %s\n", optarg);
            break;
        default:
            fprintf(stderr, "Unknown option: %c\n", opt);
            exit(1);
        }
    }

    return 0;
}
```

## If you really need to link

```bash
mv cli.h cli.c
cc -o libcli.so cli.c -fPIC -DCLI_IMPLEMENTATION -shared
mv cli.c cli.h
```

## License

[MIT](./LICENSE)

