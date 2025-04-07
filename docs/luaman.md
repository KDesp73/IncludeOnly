# luaman.h

## Get started

1. Fetch luaman.h

```bash
wget https://raw.githubusercontent.com/IncludeOnly/luaman.h/refs/heads/main/luaman.h
```

2. Build lua library

```bash
git clone https://github.com/lua/lua
cd lua
make all
```

3. Add lua to your project

```bash
mkdir -p lib/lua/include
cp lua/liblua.a lib/lua
cp lua/*.h lib/lua/include
rm -rf lua # We don't need the lua source code anymore
```

4. Link and include

```make
CFLAGS  += -Ilib/lua/include
LDFLAGS += -Llib/lua -l:liblua.a -lm
```

## Example

```c
#include <stdlib.h>
#include <stdio.h>

#define LUAMAN_IMPLEMENTATION
#include "luaman.h"

int sub(lua_State* L)
{
    lua_Number arg_2 = lua_tonumber(L, -1);
    lua_Number arg_1 = lua_tonumber(L, -2); 

    lua_Number result = arg_1 - arg_2;  
    lua_pushnumber(L, result);

    return 1;
}

int main(){
    LuaMan lm = {0};
    LMInit(&lm);

    LMPushFunction(&lm, sub, "sub");
    LMPushNumber(&lm, 420, "bar");

    if (!LMRunFile(&lm, "script.lua")) {
        fprintf(stderr, "[ERRO] %s\n", lua_tostring(lm.state, -1));
        return 1;
    }

    // Get lua number variable 
    double foo = LMGetNumber(&lm, "foo");
    printf("foo = %lf\n", foo);

    // Get lua string variable
    const char* home = LMGetString(&lm, "home");
    printf("home = %s\n", home);


    // Run lua function
    LMCallFunctionBegin(&lm, "add", 2, 1)
        LMParamNumber(&lm, 35);
        LMParamNumber(&lm, 35);
    LMCallFunctionEnd(&lm)
    double result = LMGetNumber(&lm, NULL);
    printf("add(34, 35) = %.0lf\n", result);

    // Read lua table
    const char* table = "config";
    const char* root = LMGetTableFieldString(&lm, table, "root");
    const char* wm = LMGetTableFieldString(&lm, table, "wm");
    const char* terminal = LMGetTableFieldString(&lm, table, "terminal");
    const char* editor = LMGetTableFieldString(&lm, table, "editor");

    printf("Config {\n");
    printf("\troot: %s\n", root);
    printf("\twm: %s\n", wm);
    printf("\tterminal: %s\n", terminal);
    printf("\teditor: %s\n", editor);
    printf("}\n");
    
    LMClose(&lm);

    return 0;
}
```

## If you really need to link

```bash
mv luaman.h luaman.c
cc -o libluaman.so luaman.c -fPIC -DLUAMAN_IMPLEMENTATION -shared
mv luaman.c luaman.h
```

## License

[MIT](./LICENSE)

