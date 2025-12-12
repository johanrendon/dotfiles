#!/bin/bash

# LOGS

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

print_msg() {
  echo -e "${GREEN}[*] $1${RESET}"
}

print_error() {
  echo -e "${RED}[ERROR] $1${RESET}"
}

print_warn() {
  echo -e "${YELLOW}[!] $1${RESET}"
}

# Verify yay installation.

if ! command -v yay &>/dev/null; then
  print_warn "Yay not found. Installing yay-bin."

  print_msg "Installing dependencies"
  sudo pacman -S --needed --noconfirm git base-devel

  print_msg "Cloning yay..."
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin || exit
  makepkg -si --noconfirm
  cd ..
  rm -rf yay-bin
  print_msg "yay installed correctly"

else
  print_msg "yay is already installed"

fi

print_msg "Updating repositories"
yay -Syu --noconfirm

SCRIPTS_DIR="./scripts"

if [ -d "$SCRIPTS_DIR" ]; then
  print_msg "Installing  $SCRIPTS_DIR..."

  for script in "$SCRIPTS_DIR"/install-*.sh; do
    if [ -f "$script" ]; then
      script_name=$(basename "$script")
      print_msg "Executing: $script_name"

      chmod +x "$script"

      ./"$script"

      if [ $? -eq 0 ]; then
        print_msg "$script_name installed succesfully."
      else
        print_error "There was a problem installing $script_name."
      fi
      echo "---------------------------------------------------"
    fi
  done
else
  print_error " '$SCRIPTS_DIR'. Not found"
  exit 1
fi
