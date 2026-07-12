#!/bin/bash
# Bootstrap yay AUR helper on Arch Linux
if ! command -v pacman &>/dev/null; then
    exit 0
fi

if command -v yay &>/dev/null; then
    exit 0
fi

sudo pacman -Syu --needed --noconfirm git base-devel
tmpdir=$(mktemp -d)
git clone https://aur.archlinux.org/yay.git "$tmpdir"
(cd "$tmpdir" && makepkg -si --noconfirm)
rm -rf "$tmpdir"
