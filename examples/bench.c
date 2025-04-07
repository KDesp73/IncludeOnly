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
