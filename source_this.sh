#!/bin/bash

for file in ~/dotfiles/zshrc/*; do
    if [ -f "$file" ]; then
        source "${file}"
    fi
done
