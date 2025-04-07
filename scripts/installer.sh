#!/usr/bin/env bash

# IncludeOnly installer

LIBRARIES_FILE="https://raw.githubusercontent.com/IncludeOnly/.github/refs/heads/main/lib/libraries.txt"
LOCAL_FILE="links.txt"
TARGET_DIR="/usr/local/include/io/"

sudo rm -rf $TARGET_DIR
sudo mkdir -p "$TARGET_DIR"

if ! wget -q -O "$LOCAL_FILE" "$LIBRARIES_FILE"; then
    echo "Failed to download the file from $LIBRARIES_FILE"
    exit 1
fi

while IFS= read -r url; do
    if [ -n "$url" ]; then
        if ! sudo wget -qP "$TARGET_DIR" "$url"; then
            echo "Failed to download: $url"
        else
            echo "Downloaded: $url"
        fi
    fi
done < links.txt

rm "$LOCAL_FILE"
