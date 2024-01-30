#!/bin/sh

LOGIN_INTRA="lfiorini"
INSTALL_DOCKER_SCRIPT="./install_docker.sh"

# Add execute permissions to install_docker.sh
chmod +x "$INSTALL_DOCKER_SCRIPT"

# 1. Run the install_docker.sh script
if sh "$INSTALL_DOCKER_SCRIPT"; then
  echo "Docker installation successful."
else
  echo "Docker installation failed."
fi

# 2. Create docker group
sudo groupadd docker

# 3. Add user to the docker group
sudo usermod -aG docker "$LOGIN_INTRA"

# 4. Restart VM (assuming it's a Linux VM)
sudo reboot


# sudo usermod -aG docker lorenzo

