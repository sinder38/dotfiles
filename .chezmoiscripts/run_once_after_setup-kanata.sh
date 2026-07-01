#!/bin/bash

# Skip if already configured
if systemctl list-unit-files kanata.service &>/dev/null 2>&1; then
  exit 0
fi

if ! command -v kanata &>/dev/null; then
  echo "[INFO] kanata not found, skipping setup."
  exit 0
fi

mkdir -p "$HOME/.config/kanata"
cp "$CHEZMOI_SOURCE_DIR/dot_config/kanata/kanata-config.kbd" "$HOME/.config/kanata/kanata-config.kbd"
sudo "$CHEZMOI_SOURCE_DIR/dot_config/scripts/install-kanata.sh"
