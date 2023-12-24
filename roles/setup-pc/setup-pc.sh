#!/bin/bash

# Script to setup my pc
# This will serve as a model for the related role
# This must be run as root
# winiciusallan @ UFCG
# github.com/winiciusallan
# Repository with my personal dotfiles is pinned

set -e

apt update -y

apt install node \
            maven \
            openjdk-17-jdk \
            neofetch tldr jq \
            gnupg \ 
            software-properties-common \ 
            zsh \
            gnome-tweaks


echo "----------------------------------"
echo "      CONFIGURING VIM"
echo "----------------------------------"
curl -fLO https://raw.githubusercontent.com/winiciusallan/dotfiles/main/dot_vimrc
mv dot_vimrc ~/.vimrc

echo "----------------------------------"
echo "      CONFIGURING ZSHELL"
echo "----------------------------------"
# Configuring Fonts
FONT_DIR=/usr/local/share/fonts
mkdir -p $FONT_DIR
cd $FONT_DIR && mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraMono/Regular/FiraMonoNerdFont-Regular.otf

# Making zsh as default shell
chsh -s $(which zsh)

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Install oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Get p10k dotfile from my dotfile repository
# -


# Install Terraform
echo "----------------------------------"
echo "      INSTALLING TERRAFORM"
echo "----------------------------------"
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
tee /etc/apt/sources.list.d/hashicorp.list

apt update
apt install terraform

echo "----------------------------------"
echo "      INSTALLING ANSIBLE"
echo "----------------------------------"
pip3 install --include-deps ansible

echo "----------------------------------"
echo "      INSTALLING GOLANG"
echo "----------------------------------"
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
sha256sum go1.25.5.linux-amd64.tar.gz
tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zprofile


# Install GUI Applications
# - Google Chrome
# - Discord
# - VSCode
# - Mattermost
# - Spotify

# Install some packages
# - maven [x]
# - JDK17 [x]
# - Neofetch [x]
# - Node [x]
# - Terraform [x]
# - Ansible [x]
# - TLDR [x]
# - JQ [x] 
# - Golang [x]

# Setup ZSH

# Setup Nvim and Lvim
