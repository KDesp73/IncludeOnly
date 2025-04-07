# bench.h

## Get started

```bash
wget https://raw.githubusercontent.com/IncludeOnly/bench.h/refs/heads/main/bench.h
```

## Example

```c
#define BENCH_IMPLEMENTATION
#include <io/bench.h>

int func(){ ... }

int main(){
    BENCH_START();
        func();
    BENCH_END();
    BENCH_LOG();

    return 0;
}
```

## If you really need to link

```bash
mv bench.h bench.c
cc -o libbench.so bench.c -fPIC -DBENCH_IMPLEMENTATION -shared
mv bench.c bench.h
```

## License

[MIT](./LICENSE)

