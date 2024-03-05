#notes
curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash

sudo pacman -S neovim alacritty fish starship tmux stow

# Stow
stow alacritty/
stow fish/
stow git 
stow notes/
stow nvim/
stow starship
stow tmux/
