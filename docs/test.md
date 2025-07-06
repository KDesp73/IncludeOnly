# test.h

## Get started

```bash
wget https://raw.githubusercontent.com/IncludeOnly/test.h/refs/heads/main/test.h
```

## Example

`test/main.c`
```c
#define CLI_IMPLEMENTATION
#include "IncludeOnly/cli.h"
#define TEST_IMPLEMENTATION
#include "IncludeOnly/test.h"

char* TEST_DIRECTORY = "test";

void load()
{
    LOAD_TEST("test_piece_at");
    LOAD_TEST("test_name_to_square");
    LOAD_TEST("test_square_to_name");

    LOAD_TEST("test_perft");
    LOAD_TEST("test_perft_2");
    LOAD_TEST("test_perft_3");
    LOAD_TEST("test_perft_4");
    LOAD_TEST("test_perft_5");
    LOAD_TEST("test_perft_6");

    LOAD_TEST("test_pawn_moves");
    LOAD_TEST("test_knight_moves");
    LOAD_TEST("test_bishop_moves");
    LOAD_TEST("test_rook_moves");
    LOAD_TEST("test_queen_moves");
    LOAD_TEST("test_king_moves");

    LOAD_TEST("test_pawn_pseudo");
    LOAD_TEST("test_knight_pseudo");
    LOAD_TEST("test_bishop_pseudo");
    LOAD_TEST("test_rook_pseudo");
    LOAD_TEST("test_queen_pseudo");
    LOAD_TEST("test_king_pseudo");

    LOAD_TEST("test_is_in_check");
    LOAD_TEST("test_undo");
}

int _1() {
    START_TESTS
        RUN_TEST(test_perft),
        RUN_TEST(test_perft_2),
        RUN_TEST(test_perft_3),
        RUN_TEST(test_perft_4),
        RUN_TEST(test_perft_5),
        RUN_TEST(test_perft_6)
    END_TESTS
}
int _2() {}
int _3() {}
int _4() {}


int main(int argc, char** argv)
{
    InitMasks();

    TEST_ARGS(argc, argv);

    START_TESTS
        RUN_TEST(test_piece_at),
        RUN_TEST(test_name_to_square),
        RUN_TEST(test_square_to_name),

        RUN_TEST(test_pawn_moves),
        RUN_TEST(test_knight_moves),
        RUN_TEST(test_bishop_moves),
        RUN_TEST(test_rook_moves),
        RUN_TEST(test_queen_moves),
        RUN_TEST(test_king_moves),

        RUN_TEST(test_pawn_pseudo),
        RUN_TEST(test_knight_pseudo),
        RUN_TEST(test_bishop_pseudo),
        RUN_TEST(test_rook_pseudo),
        RUN_TEST(test_queen_pseudo),
        RUN_TEST(test_king_pseudo),

        RUN_TEST(test_is_in_check),
        RUN_TEST(test_undo)
    END_TESTS
}
```

`test/test_checkmate.c`
```c
#include "test.h"

int test_checkmate(const char* fen, bool expected){
    Board board;
    BoardLoadFen(&board, fen);

    if(IsCheckmate(board) != expected){
        FAIL("Expected %s for fen %s", (expected) ? "true" : "false", fen);
        return 0;
    }

    SUCC("Passed for fen %s", fen);
    return 1;
}
```

`test/test_checkmate.ctd`
```text
"fen1", true
"fen2", false
# "fen3", true
```

## If you really need to link

```bash
mv test.h test.c
cc -o libtest.so test.c -fPIC -DTEST_IMPLEMENTATION -shared
mv test.c test.h
```

## License

[MIT](./LICENSE)

