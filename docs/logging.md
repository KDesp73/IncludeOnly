# logging.h

## Get started

```bash
wget https://raw.githubusercontent.com/IncludeOnly/logging.h/refs/heads/main/logging.h
```

## Example

```c
#define LOG_LEVEL LOG_LEVEL_ERROR
#define LOGGING_IMPLEMENTATION
#include "logging.h"

int main(){
    INFO("Hello World from logging.h!");
    
    logging_log(LOG_LEVEL_INFO, "This should not print");
    
    return 0;
}
```

## If you really need to link

```bash
mv logging.h logging.c
cc -o liblogging.so logging.c -fPIC -DLOGGING_IMPLEMENTATION -shared
mv logging.c logging.h
```

## License

[MIT](./LICENSE)

