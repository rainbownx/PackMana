#!/bin/bash

set -e

REPO_URL="https://github.com/rainbownx/PackMana.git"
INSTALL_DIR="/usr/local/share/packmana"
BIN_LINK="/usr/bin/packmana"

if [[ $EUID -ne 0 ]]; then
   echo "Please run this script with sudo or as root."
   exit 1
fi

echo "Installing PackMana..."

# Clone or update repo
if [ -d "$INSTALL_DIR" ]; then
    echo "PackMana directory already exists, pulling latest changes..."
    git -C "$INSTALL_DIR" pull
else
    echo "Cloning PackMana repository into $INSTALL_DIR..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Create required directories if missing
mkdir -p "$INSTALL_DIR/cache"
mkdir -p "$INSTALL_DIR/installed"

# Create empty repos.list if not exists
touch "$INSTALL_DIR/repos.list"

# Create symlink in /usr/bin
if [ -L "$BIN_LINK" ] || [ -f "$BIN_LINK" ]; then
    echo "Removing existing $BIN_LINK"
    rm -f "$BIN_LINK"
fi
ln -s "$INSTALL_DIR/packmana" "$BIN_LINK"
chmod +x "$INSTALL_DIR/packmana"

echo "PackMana installed successfully!"
echo "You can now run 'packmana' from the terminal."
