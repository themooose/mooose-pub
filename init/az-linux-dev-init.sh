#!/usr/bin/bash
#exec &> az-linux-dev-init.log

# Az-CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azcopy for all
wget https://aka.ms/downloadazcopy-v10-linux
tar -xvf downloadazcopy-v10-linux
sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/
sudo rm -rf ./azcopy_linux_amd64_*
sudo chmod +x /usr/bin/azcopy
rm -f downloadazcopy-v10-linux

# Install Docker
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 777 /var/run/docker.sock

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Setup BlobFuse
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y blobfuse fuse
git clone https://github.com/Azure/azure-storage-fuse.git blobfuse --depth=1
sudo rm -f packages-microsoft-prod.deb

# Python Virtual Environment
sudo pip3 install virtualenv
# Genome Center Stuff
sudo pip3 install dxpy

# Update and Upgrade
sudo apt update && sudo apt upgrade && sudo apt full-upgrade -y
### END Provision Init
