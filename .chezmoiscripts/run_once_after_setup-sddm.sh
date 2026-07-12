#!/bin/bash

THEME_NAME="pixel-cyberpunk"
THEME_DEST="/usr/share/sddm/themes/$THEME_NAME"

# Skip if already installed
if [ -d "$THEME_DEST" ]; then
    exit 0
fi

if ! command -v sddm &>/dev/null; then
    echo "[INFO] sddm not found, skipping."
    exit 0
fi

TMPDIR=$(mktemp -d)
git clone --depth=1 https://github.com/Darkkal44/qylock "$TMPDIR/qylock"
sudo cp -r "$TMPDIR/qylock/themes/$THEME_NAME" "$THEME_DEST"
rm -rf "$TMPDIR"

sudo mkdir -p /etc/sddm.conf.d
printf '[Theme]\nCurrent=%s\n' "$THEME_NAME" | sudo tee /etc/sddm.conf.d/theme.conf > /dev/null

sudo systemctl enable sddm.service
