#!/usr/bin/env bash

rm libs.list

directory_path="libs"
find "$directory_path" -type f | while IFS= read -r file; do
    echo "https://raw.githubusercontent.com/KDesp73/IncludeOnly/refs/heads/main/$file" >> libs.list
done
