#!/bin/bash

# Update package list and upgrade all packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Python3.11 and pip3 if not already installed
if ! command -v python3.11 &>/dev/null; then
    sudo apt-get install -y python3.11
fi

if ! command -v pip3 &>/dev/null; then
    sudo apt-get install -y python3-pip
fi

# Install Docker
if ! command -v docker &>/dev/null; then
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo usermod -aG docker $USER
fi

# Install Docker Compose
if ! command -v docker-compose &>/dev/null; then
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Verify installation
python3.11 -m pip list | grep -E 'Flask|SQLAlchemy|psycopg2-binary|Flask-SQLAlchemy'
docker --version
docker-compose --version

echo "Dependencies installed successfully."
