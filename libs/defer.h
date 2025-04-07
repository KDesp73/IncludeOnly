#ifndef DEFER_H
#define DEFER_H

#define __DEFER__(func, var)\
    auto void func(int*); \
    int var __attribute__((__cleanup__(func))); \
    auto void func(int*)

#define DEFER_COUNT(N) __DEFER__(_DEFER_FUNC ## N, __DEFER_VAR ## N)
#define DEFER_CALLER(N) DEFER_COUNT(N)
#define defer DEFER_CALLER(__COUNTER__)
    

#endif // DEFER_H
