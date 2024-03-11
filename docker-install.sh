#!/bin/bash

# Update package index
sudo apt update

# Install dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package index again
sudo apt update

# Install Docker CE
sudo apt install -y docker-ce

# Check Docker version
docker --version

# Download Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# Verify installation of Docker Compose
docker-compose --version

# Optional: Add your user to the Docker group
sudo usermod -aG docker $USER

# Reminder to log out and log back in for group membership changes to take effect
echo "Please log out and log back in for Docker group membership changes to take effect."

# Test Docker
docker run hello-world

echo "Docker and Docker Compose installation completed successfully."
