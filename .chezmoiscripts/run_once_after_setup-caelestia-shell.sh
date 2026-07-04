#!/bin/bash
# Build and install caelestia-shell (quickshell config) from source.
# caelestia-shell's AUR package hard-depends on quickshell-git, which would
# conflict with the quickshell package we install from the extra repo, so we
# build it manually instead. See https://github.com/caelestia-dots/shell
set -e

CAELESTIA_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/quickshell/caelestia"

if [ ! -d "$CAELESTIA_DIR/.git" ]; then
    mkdir -p "$(dirname "$CAELESTIA_DIR")"
    git clone https://github.com/caelestia-dots/shell.git "$CAELESTIA_DIR"
fi

cmake -B "$CAELESTIA_DIR/build" -S "$CAELESTIA_DIR" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/
cmake --build "$CAELESTIA_DIR/build"
sudo cmake --install "$CAELESTIA_DIR/build"
