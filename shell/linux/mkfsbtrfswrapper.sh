#!/bin/sh
set -eu

WRAPPER_URL="https://raw.githubusercontent.com/lutvzn/scripts/master/wrappers/mkfs.btrfs"
TARGET_BIN="/usr/local/sbin/mkfs.btrfs"

if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
else
    SUDO=""
fi

if [ "$(id -u)" -ne 0 ] && [ -z "$SUDO" ]; then
    echo "This script must be run as root or with sudo available." >&2
    exit 1
fi

echo "Installing mkfs.btrfs wrapper to $TARGET_BIN..."
$SUDO mkdir -p /usr/local/sbin
$SUDO curl -fsSL "$WRAPPER_URL" -o "$TARGET_BIN"
$SUDO chmod 755 "$TARGET_BIN"

if command -v mkfs.btrfs >/dev/null 2>&1; then
    echo "mkfs.btrfs now resolves to: $(command -v mkfs.btrfs)"
fi

echo "Done."
