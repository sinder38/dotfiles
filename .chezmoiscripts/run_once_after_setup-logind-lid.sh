#!/bin/bash

# Skip if already configured
if grep -q "HandleLidSwitch=lock" /etc/systemd/logind.conf.d/lid-switch.conf 2>/dev/null; then
    exit 0
fi

sudo mkdir -p /etc/systemd/logind.conf.d
printf '[Login]\nHandleLidSwitch=lock\nHandleLidSwitchDocked=lock\nHandleLidSwitchExternalPower=lock\n' | sudo tee /etc/systemd/logind.conf.d/lid-switch.conf > /dev/null
sudo systemctl restart systemd-logind
