# Drupal/DrupalVM software setup for Debian Distros

This script is meant to help setup Drupal/DrupalVM development environment on a Debian-based OS with some opinionated software (like VSCodium). It will be written from a Debian Buster perspective but can be adapted to work with any Debian-like OS (such as Ubuntu) with some tweaks. The commands are all able to be run in terminal as is - but should be studied to ensure packages are correctly configured to your distro.

## Run The Script

If you just want to get running:

1. Clone the repo.
2. `cd devsoftware` into the new directory.
3. `chmod +x ./freshSoftware.sh` to make script executable.
4. `./freshSoftware` to run.

If you want to understand the script and what software it installs please continue reading.

## Install PHP and DrupalVM Software Dependencies

### Start in your home directory

```bash
cd ~
```

### Install PHP tools and required software

```bash
sudo apt install -y curl \
php-cli \
php-mbstring \
git \
unzip \
apt-transport-https \
ca-certificates \
curl \
gnupg2 \
software-properties-common \
dirmngr --install-recommends
```

### Download Composer with source installer

```bash
curl -sS https://getcomposer.org/installer -o composer-setup.php
```

### Install composer globally

```bash
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

## Install DrupalVM Software

*Pay specific attention to which OS/version is being pulled into source. Some packages build for Ubuntu and Debian in the same location. **Server Keys likely to change on version.***

### Add Ansible source to allow for updates

```bash
echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' | sudo tee -a /etc/apt/sources.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
```

```bash
echo 'deb http://download.virtualbox.org/virtualbox/debian bionic contrib' | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
```

### VSCodium source + keys

```bash
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | susdo tee -a /etc/apt/sources.list.d/vscodium.list
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
```

### Insomnia source + keys

```bash
echo "deb https://dl.bintray.com/getinsomnia/Insomnia/" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget -qO - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
```

### Clean repo list

```bash
sudo apt clean
```

### repos with new ones above

```bash
sudo apt update
```

### Upgrade any existing software

```bash
sudo apt -y upgrade
```

### Adding software from new sources:

```bash
sudo apt install -y ansible \
vscodium \
insomnia
```

### Pipe in common/useful extensions to VSCodium

```bash
cat extensions.list | xargs -L1 vscodium
```
