#!/bin/bash
# Install hyprexpo (workspace overview plugin) via hyprpm.
# The official hyprwm/hyprland-plugins hyprexpo was retired
# (https://github.com/hyprwm/hyprland-plugins/pull/663), so this uses the
# maintained community continuation instead. See dot_config/hypr/hyprland.lua
# for the plugin config and the SUPER+W keybind.
set -e

if ! command -v hyprpm &>/dev/null; then
  echo "[INFO] hyprpm not found, skipping hyprexpo setup."
  exit 0
fi

if hyprpm list 2>/dev/null | grep -q "Plugin hyprexpo"; then
  exit 0
fi

sudo hyprpm update
hyprpm add https://github.com/sandwichfarm/hyprexpo
hyprpm enable hyprexpo
