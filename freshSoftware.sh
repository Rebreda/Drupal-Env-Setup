# Enable sources, add PPAs and update sources: 
sudo sed 's/# deb/deb/' -i /etc/apt/sources.list

# VSCodium source
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 

# Insomnia source
# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list



## Update repos with new ones above
sudo apt-get update
sudo apt-get upgrade

# Adding software:
# Get Docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Get VSCodium
sudo apt-get install -y vscodium 

# Get Insomnia
sudo apt-get install insomnia
