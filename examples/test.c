#define TEST_IMPLEMENTATION
#include "test.h"


int test_test(const char* str, int index)
{
    return 1;
}


int main()
{
    LOAD_TEST("test_test");

    START_TESTS
        // RUN_TEST(test_test)
        1
    END_TESTS
}
