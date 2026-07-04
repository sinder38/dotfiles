#!/bin/bash

# Fast boot

if grep -q "^timeout 0$" /boot/loader/loader.conf 2>/dev/null; then
    exit 0
fi

sudo sed -i 's/^timeout .*/timeout 0/' /boot/loader/loader.conf
