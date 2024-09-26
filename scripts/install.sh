#!/bin/bash

# Ensure the script runs with superuser privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Update package repositories
echo "Updating package repositories..."
sudo pacman -Syu --noconfirm

# Install the necessary applications
echo "Installing applications..."
packages=("zsh" "stow" "ttf-jetbrains-mono-nerd" "ttf-jetbrains-mono" "npm" "rust" "unzip" "neovim" "fzf" "zoxide" "bat" "eza" "lazygit")

for package in "${packages[@]}"; do
    if ! sudo pacman -S --noconfirm "$package"; then
        echo "Error installing $package. Please check your connection or the package name."
        exit 1
    fi
done

# Install Starship
echo "Installing Starship..."
if ! curl -sS https://starship.rs/install.sh | sh; then
    echo "Error installing Starship."
    exit 1
fi

# Clone Zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"

echo "Cloning Zsh plugins..."
plugins=("zsh-autosuggestions" "zsh-syntax-highlighting")
for plugin in "${plugins[@]}"; do
    if ! git clone "https://github.com/zsh-users/${plugin}.git" "$ZSH_CUSTOM/plugins/${plugin}"; then
        echo "Error cloning $plugin."
        exit 1
    fi
done

echo "Installation completed successfully."

