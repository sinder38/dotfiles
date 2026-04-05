#!/bin/sh
# Refresh kanata config, service, and input setup

set -e

REAL_USER="${SUDO_USER:-$USER}"
USER_CONFIG="/home/$REAL_USER/.config/kanata/kanata-config.kbd"
SYSTEM_CONFIG="/etc/kanata/kanata-config.kbd"
SERVICE_PATH="/etc/systemd/system/kanata.service"
UDEV_RULES="/etc/udev/rules.d/99-input.rules"

echo "Setting up groups and permissions..."
groupadd --system uinput || true
id -u kanata >/dev/null 2>&1 || useradd --system --no-create-home --group nogroup kanata || true
usermod -aG input kanata || true
usermod -aG uinput kanata || true

echo "Configuring udev rules..."
cat > "$UDEV_RULES" <<'EOF'
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF

udevadm control --reload-rules
udevadm trigger
modprobe uinput

if [ ! -f "$USER_CONFIG" ]; then
    echo "User config not found: $USER_CONFIG"
    exit 1
fi

echo "Copying config..."
install -Dm644 "$USER_CONFIG" "$SYSTEM_CONFIG"

echo "Recreating kanata.service..."
cat > "$SERVICE_PATH" <<'EOF'
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata
Wants=modprobe@uinput.service
After=modprobe@uinput.service

[Service]
Type=simple
CPUSchedulingPolicy=rr
CPUSchedulingPriority=99
IOSchedulingClass=realtime
Nice=-20
User=kanata
Group=kanata
ExecStart=/usr/bin/sh -c 'exec /usr/bin/kanata --quiet --cfg /etc/kanata/kanata-config.kbd'
Restart=no
# Security
CapabilityBoundingSet=
DeviceAllow=/dev/uinput rw
DeviceAllow=char-input
DeviceAllow=/dev/stdin
DevicePolicy=strict
PrivateDevices=false
BindPaths=/dev/uinput
BindReadOnlyPaths=/dev/stdin
BindReadOnlyPaths=/dev/input/
InaccessiblePaths=/dev/shm
LockPersonality=true
NoNewPrivileges=true
PrivateTmp=true
PrivateNetwork=true
PrivateUsers=true
#ProtectClock=true # Disabled as per original example notes
ProtectHome=true
ProtectHostname=true
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectKernelLogs=true
ProtectSystem=strict
ProtectControlGroups=true
RestrictAddressFamilies=AF_UNIX # Allow only Unix sockets, deny others like network
RestrictNamespaces=true
SystemCallArchitectures=native
SystemCallErrorNumber=EPERM
SystemCallFilter=@system-service
SystemCallFilter=~@privileged @resources
RemoveIPC=true
IPAddressDeny=any
RestrictSUIDSGID=true
RestrictRealtime=true
MemoryDenyWriteExecute=true
UMask=0077

[Install]
WantedBy=default.target
EOF

echo "Reloading systemd..."
systemctl daemon-reexec
systemctl daemon-reload

echo "Enabling and restarting kanata.service..."
systemctl enable kanata.service
systemctl restart kanata.service

echo "Done."

systemctl status kanata.service
