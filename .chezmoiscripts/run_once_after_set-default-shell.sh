#!/bin/bash
# Set fish as the default shell
fish_path=$(command -v fish 2>/dev/null) || exit 0

if [ "$SHELL" = "$fish_path" ]; then
    exit 0
fi

if ! grep -qF "$fish_path" /etc/shells; then
    echo "$fish_path" | sudo tee -a /etc/shells
fi

chsh -s "$fish_path"
