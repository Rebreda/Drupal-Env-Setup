# Enable sources, add PPAs and update sources: 
cd ~

#Install PHP Dev tools
sudo apt install -y curl php-cli php-mbstring git unzip #PHP Deps

## Download Composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
### Install Globally
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer


# Dep to install remote packages
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    dirmngr --install-recommends


# Ansible source
echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' | sudo tee -a /etc/apt/sources.list.d/ansible.list 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367


# VSCodium source
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee -a /etc/apt/sources.list.d/vscodium.list 
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 

# Insomnia source
# Add public key used to verify code signature
echo "deb https://dl.bintray.com/getinsomnia/Insomnia/" | sudo tee -a /etc/apt/sources.list.d/insomnia.list 
wget -qO - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add - 



## Update repos with new ones above
sudo apt-get clean
sudo apt-get update
sudo apt-get -y upgrade

# Adding software:

sudo apt-get install -y ansible
# Get VSCodium
sudo apt-get install -y vscodium
cat extensions.list | xargs -L1 vscodium 

# Get Insomnia
sudo apt-get install insomnia
