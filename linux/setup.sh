#!/usr/bin/env bash

# all warnings: on
set -euo pipefail


# root (sudo check)
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Please run with sudo."
    exit 1
fi


source /etc/os-release #sets the source so that we can use the variables in said file


#-----------OS DETECTION------------
PKG_MANAGER=""

if [[ $ID == "arch" || $ID == "manjaro" || $ID == "endeavouros" || $ID == "cachyos" ]]; then
    PKG_MANAGER="pacman"
    echo "Arch based system detected"
elif [[ $ID == "ubuntu" || $ID == "debian" || $ID == "mint" ]]; then
    PKG_MANAGER="apt"
    echo "Ubuntu/Debian based system detected"
else
    echo "Unsupported OS detected. Exiting."
    exit 1
fi

#----------DEPENDENCY CHECKING---------

for item in curl jq tmux; do
    if ! command -v "$item" &> /dev/null; then
       if [[ $PKG_MANAGER == "pacman" ]]; then
            echo "$item is not installed. Installing with pacman..."
            pacman -S --noconfirm "$item"
        elif [[ $PKG_MANAGER == "apt" ]]; then
            echo "$item is not installed. Installing with apt..."
            apt update && apt install -y "$item"
       
        fi
     else
        echo "dependencies already installed, proceeding..."
    fi
done

#----------INSTALL DIRECTORY------------
read -rp "Enter installation directory (def: /home/$USER): " INSTALL_DIR
INSTALL_DIR=${INSTALL_DIR:-/home/$USER}

if [[ -d "$INSTALL_DIR" ]]; then
    echo "Installation directory exists: $INSTALL_DIR"
    read -rp "Directory already exists. Continue anyway? [y/N]: " cont
    if [[ ! "$cont" =~ ^[Yy]$ ]]; then
        echo "Exiting..."
        exit 1
    fi
else
    echo "Creating installation directory: $INSTALL_DIR"
    mkdir -p "$INSTALL_DIR"
fi





