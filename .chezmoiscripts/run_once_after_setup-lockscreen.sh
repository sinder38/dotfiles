#!/bin/bash


# NOTE: retired script as lockscreen uses a popup now

# BG_SOURCE="/usr/share/sddm/themes/pixel-sakura/bg.mp4"
# BG_DEST="$HOME/.local/share/lockscreen/bg.png"

# if [ -f "$BG_DEST" ]; then
#     exit 0
# fi

# if [ ! -f "$BG_SOURCE" ]; then
#     echo "[INFO] SDDM theme not installed yet, skipping lockscreen background."
#     exit 0
# fi

# mkdir -p "$(dirname "$BG_DEST")"
# ffmpeg -i "$BG_SOURCE" -vframes 1 -q:v 2 -update 1 "$BG_DEST" -y
