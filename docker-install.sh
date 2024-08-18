#!/bin/bash

# Update your existing list of packages
sudo apt update

# Install prerequisites
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository to apt sources
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package database with Docker packages from the newly added repository
sudo apt update

# Install Docker
sudo apt install -y docker-ce

# Verify Docker installation
sudo systemctl status docker

# Optional: Manage Docker as a non-root user
sudo usermod -aG docker ${USER}

echo "Docker installation completed. Please log out and log back in to apply the user group changes."
