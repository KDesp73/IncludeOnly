# ini.h

## Get started

```bash
wget https://raw.githubusercontent.com/IncludeOnly/ini.h/refs/heads/main/ini.h
```

> [!NOTE]
> This is NOT my library. Its a slightly modified version of [this](https://github.com/benhoyt/inih)
> library that i like to use

## If you really need to link

```bash
mv ini.h ini.c
cc -o libini.so ini.c -fPIC -DINI_IMPLEMENTATION -shared
mv ini.c ini.h
```

