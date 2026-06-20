#!/bin/bash

# Skip if already enabled
if systemctl is-enabled bluetooth.service &>/dev/null; then
    exit 0
fi

sudo systemctl enable --now bluetooth.service
