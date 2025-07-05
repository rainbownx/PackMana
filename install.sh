#!/bin/bash
# Install script for Packmana

TARGET_DIR="/opt/packmana"

# Clone the repo
sudo git clone https://github.com/rainbownx/PackMana.git "$TARGET_DIR"

# Link the main executable to /usr/bin
sudo ln -sf "$TARGET_DIR/packmana" /usr/bin/packmana
sudo chmod +x /usr/bin/packmana
echo "Packmana installed. You can run it by typing 'packmana'."
