#!/bin/bash

# Skip if already configured
if grep -q "HandlePowerKey=ignore" /etc/systemd/logind.conf.d/power-key.conf 2>/dev/null; then
    exit 0
fi

sudo mkdir -p /etc/systemd/logind.conf.d
printf '[Login]\nHandlePowerKey=ignore\n' | sudo tee /etc/systemd/logind.conf.d/power-key.conf > /dev/null
sudo systemctl restart systemd-logind
