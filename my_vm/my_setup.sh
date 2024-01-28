#!/bin/sh

INTRA="lfiorini"
SCRIPT_PATH="./install_docker.sh"

# Add execute permissions to install_docker.sh
chmod +x "$SCRIPT_PATH"

# 1. Run the install_docker.sh script
if sh "$SCRIPT_PATH"; then
  echo "Docker installation successful."
else
  echo "Docker installation failed."
fi

# 2. Create docker group
sudo groupadd docker

# 3. Add user to the docker group
sudo usermod -aG docker "$INTRA"

# 4. Restart VM (assuming it's a Linux VM)
sudo reboot
