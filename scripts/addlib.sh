#!/usr/bin/env bash

NAME="$1"

HEADER="libs/$NAME.h"
EXAMPLE="examples/$NAME.c"
DOC="docs/$NAME.md"

touch "$HEADER"
touch "$EXAMPLE"
touch "$DOC"

echo "#ifndef IO_${NAME^^}_H" >> "$HEADER"
echo "#define IO_${NAME^^}_H" >> "$HEADER"
echo "" >> "$HEADER"
echo "// $NAME module" >> "$HEADER"
echo "" >> "$HEADER"
echo "#endif // IO_${NAME^^}" >> "$HEADER"

echo "#include \"$NAME.h\"" >> "$EXAMPLE"
echo "" >> "$EXAMPLE"
echo "" >> "$EXAMPLE"
echo "int main(int argc, char** argv)" >> "$EXAMPLE"
echo "{" >> "$EXAMPLE"
echo "" >> "$EXAMPLE"
echo "    return 0;" >> "$EXAMPLE"
echo "}" >> "$EXAMPLE"

echo "# $NAME.h" >> "$DOC"

echo "https://raw.githubusercontent.com/KDesp73/IncludeOnly/refs/heads/main/libs/$NAME.h" >> libs.list
