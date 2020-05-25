#! /bin/bash
# Ask password for sudo
read -s -p "Enter Password for sudo: " sudoPW

echo $sudoPW | sudo -S apt install -y zsh

# Call dotbot install script
./install