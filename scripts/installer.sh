#!/usr/bin/env bash

# IncludeOnly installer

LIBRARIES_FILE="https://raw.githubusercontent.com/KDeps73/IncludeOnly/refs/heads/main/libs.list"
LOCAL_FILE="libs.list"
TARGET_DIR="/usr/local/include/io/"

install_headers() {
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
    done < "$LOCAL_FILE"

    rm "$LOCAL_FILE"
}

install_headers()
