#!/bin/bash
touch /etc/apt/sources.list
sudo apt-get -y upgrade
sudo apt-get -y update


#install gnome desktop
sudo apt-get install ubuntu-gnome-desktop -y

#install xrdp
sudo apt-get install xrdp -y

# change access from root only to all users
sudo sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config

#start remote desktop session
sudo service xrdp restart

#install Azure CLI
apt-get update && sudo apt-get install -y azure-cli
logger -t devvm "Azure-cli installed: $?"
sudo apt-get -y update

#install VSCode
logger -t devvm "Installing VSCode: $?"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code
logger -t devvm "VSCode Installed: $?"
logger -t devvm "Success"

sudo apt install -y default-jre
sudo apt install -y p7zip-full p7zip-rar

sudo snap install notepad-plus-plus
sudo snap install intellij-idea-community --classic

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

apt --fix-broken install -y
#restart remote desktop session
sudo service xrdp restart

exit 0
