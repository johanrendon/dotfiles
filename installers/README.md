# Installation Scripts

A comprehensive collection of automated installation scripts for setting up a complete development environment. These scripts handle dependency management, configuration setup, and tool installation with minimal user intervention.

## 🎯 Features

- **Automated Installation**: One-command setup for all tools
- **Dependency Resolution**: Handles package manager interactions
- **Configuration Management**: Sets up proper configurations and paths
- **Multi-Platform Support**: Works with Arch Linux and AUR packages
- **Error Handling**: Robust error checking and reporting
- **Modular Design**: Each tool has its own dedicated script

## 📁 Script Categories

### 🛠️ Development Tools
| Script | Description | Dependencies |
|--------|-------------|-------------|
| `install-neovim.sh` | Install Neovim editor | `neovim`, `pip` |
| `install-git.sh` | Install Git version control | `git` |
| `install-lazygit.sh` | Install Git TUI | `lazygit` |

### 🎨 Terminal & Shell
| Script | Description | Dependencies |
|--------|-------------|-------------|
| `install-ghostty.sh` | Install Ghostty terminal | `ghostty` |
| `install-fisher.sh` | Install Fisher plugin manager | `fish`, `curl` |
| `install-rofi.sh` | Install Rofi launcher | `rofi` |

### 🎯 Productivity Tools
| Script | Description | Dependencies |
|--------|-------------|-------------|
| `install-fzf.sh` | Install fuzzy finder | `fzf` |
| `install-eza.sh` | Install modern `ls` | `eza` |
| `install-bat.sh` | Install modern `cat` | `bat` |
| `install-fd.sh` | Install modern `find` | `fd` |
| `install-ripgrep.sh` | Install fast grep | `ripgrep` |
| `install-zoxide.sh` | Install smart `cd` | `zoxide` |
| `install-startship.sh` | Install Starship prompt | `starship` |

### 🌐 Web Development
| Script | Description | Dependencies |
|--------|-------------|-------------|
| `install-node.sh` | Install Node.js runtime | `nodejs`, `npm` |
| `install-npm.sh` | Install NPM package manager | `npm` |

### 🖥️ Desktop Environment
| Script | Description | Dependencies |
|--------|-------------|-------------|
| `install-waybar.sh` | Install Wayland status bar | `waybar` |
| `install-swww.sh` | Install wallpaper daemon | `swww` |
| `install-swaync.sh` | Install notification center | `swaync` |
| `install-pipewire.sh` | Install audio stack | `pipewire` |
| `install-pavucontrol.sh` | Install audio control | `pavucontrol` |
| `install-hyprpaper.sh` | Install wallpaper tool | `hyprpaper` |
| `install-hyprshot.sh` | Install screenshot tool | `hyprshot` |

### 📱 Applications
| Script | Description | Dependencies |
|--------|-------------|-------------|
| `install-zen-browser.sh` | Install Zen browser | `zen-browser` |
| `install-nautilus.sh` | Install file manager | `nautilus` |
| `install-rust.sh` | Install Rust toolchain | `rust`, `cargo` |
| `install-typst.sh` | Install Typst compiler | `typst` |
| `install-zellij.sh` | Install terminal multiplexer | `zellij` |

### 🔧 Utilities
| Script | Description | Dependencies |
|--------|-------------|-------------|
| `install-stow.sh` | Install GNU Stow | `stow` |

## ⚙️ Requirements

### System Requirements
```bash
# Arch Linux (recommended)
sudo pacman -Syu

# AUR helper for additional packages
yay  # or paru, pikaur, etc.

# Essential build tools
sudo pacman -S base-devel
```

### Core Dependencies
```bash
# Package managers
pacman      # Arch Linux package manager
yay         # AUR helper (recommended)

# Build tools (if compiling from source)
base-devel  # Development tools
git         # Version control (for cloning)
curl        # HTTP client (for downloads)
wget        # Alternative HTTP client
```

### Optional Dependencies
```bash
# For some installation scripts
pip         # Python package manager
npm         # Node.js package manager
cargo       # Rust package manager
```

## 🚀 Usage

### Individual Script Installation
```bash
# Make script executable
chmod +x installers/scripts/install-neovim.sh

# Run installation
./installers/scripts/install-neovim.sh
```

### Bulk Installation
```bash
# Install all development tools
./installers/scripts/install-neovim.sh
./installers/scripts/install-git.sh
./installers/scripts/install-lazygit.sh

# Install terminal tools
./installers/scripts/install-ghostty.sh
./installers/scripts/install-fzf.sh
./installers/scripts/install-eza.sh
./installers/scripts/install-bat.sh
```

### Installation Sequence (Recommended)
```bash
# 1. Core utilities
./installers/scripts/install-git.sh
./installers/scripts/install-stow.sh

# 2. Terminal and shell
./installers/scripts/install-ghostty.sh
./installers/scripts/install-fisher.sh
./installers/scripts/install-startship.sh
./installers/scripts/install-fzf.sh
./installers/scripts/install-eza.sh
./installers/scripts/install-bat.sh

# 3. Development tools
./installers/scripts/install-neovim.sh
./installers/scripts/install-lazygit.sh
./installers/scripts/install-rust.sh

# 4. Desktop environment
./installers/scripts/install-rofi.sh
./installers/scripts/install-waybar.sh
./installers/scripts/install-swww.sh
```

## 🔧 Script Structure

### Standard Script Template
```bash
#!/bin/sh

# Description: Install [Tool Name]
# Author: [Author Name]
# Dependencies: [List of dependencies]

echo "Installing [Tool Name]..."

# Installation command
[installation_command]

# Verification (optional)
if command -v [tool_command] >/dev/null; then
    echo "[Tool Name] installed successfully!"
else
    echo "[Tool Name] installation failed!"
fi
```

### Example Scripts

#### Simple Package Installation
```bash
#!/bin/sh

echo "Installing eza"
yay -S --noconfirm --needed eza
```

#### Download and Install Script
```bash
#!/bin/sh

curl -sS https://starship.rs/install.sh | sh
```

#### Plugin Installation
```bash
#!/bin/sh

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

## 🎯 Script Details

### Package Manager Scripts
Most scripts use the following pattern:
```bash
# Install from official repositories
sudo pacman -S --noconfirm package_name

# Install from AUR
yay -S --noconfirm --needed package_name

# Install with specific options
yay -S --noconfirm --needed --asdeps package_name
```

### Download Scripts
Some tools require downloading installers:
```bash
# Download and execute installer
curl -sS https://example.com/install.sh | sh

# Download and make executable
curl -LO https://example.com/script.sh
chmod +x script.sh
sudo mv script.sh /usr/local/bin/
```

### Configuration Scripts
Some scripts handle configuration setup:
```bash
# Create configuration directory
mkdir -p ~/.config/tool

# Copy configuration files
cp config.file ~/.config/tool/

# Set permissions
chmod +x ~/.config/tool/script.sh
```

## 🔧 Customization

### Creating New Scripts
1. **Create script file**:
```bash
touch installers/scripts/install-tool.sh
chmod +x installers/scripts/install-tool.sh
```

2. **Add standard template**:
```bash
#!/bin/sh

echo "Installing Tool Name..."

# Add installation commands here

echo "Tool Name installed successfully!"
```

3. **Test the script**:
```bash
./installers/scripts/install-tool.sh
```

### Modifying Existing Scripts
- **Change package names**: Modify the package name in the installation command
- **Add dependencies**: Include additional package installations
- **Add configuration**: Set up default configurations after installation
- **Add verification**: Include checks to verify successful installation

### Environment-Specific Scripts
```bash
#!/bin/sh

# Check for specific conditions
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or with sudo"
    exit 1
fi

# Check for existing installation
if command -v tool_name >/dev/null; then
    echo "Tool already installed"
    exit 0
fi

# Installation logic
```

## 🐛 Troubleshooting

### Common Issues
1. **Permission Denied**: Run with `sudo` or fix permissions
2. **Package Not Found**: Check package name and repositories
3. **AUR Helper Not Found**: Install `yay` or alternative
4. **Network Issues**: Check internet connection
5. **GPG Key Issues**: Refresh package manager keys

### Debug Mode
Add debug output to scripts:
```bash
#!/bin/sh

set -x  # Enable debug mode

echo "Installing tool..."
[installation_command]
set +x  # Disable debug mode
```

### Error Handling
```bash
#!/bin/sh

# Check if command succeeded
if ! yay -S package_name; then
    echo "Installation failed"
    exit 1
fi

echo "Installation successful"
```

## 📝 Best Practices

### Script Development
1. **Use `#!/bin/sh`** for maximum compatibility
2. **Add error checking** for reliability
3. **Include verification** of successful installation
4. **Use appropriate package manager** (pacman vs yay)
5. **Handle dependencies** properly

### Security
1. **Verify downloads** from trusted sources
2. **Use HTTPS** for all downloads
3. **Check GPG signatures** when available
4. **Review scripts** before execution

### Performance
1. **Use `--noconfirm`** for unattended installation
2. **Install multiple packages** in single commands
3. **Use `--needed`** to skip already installed packages
4. **Avoid unnecessary reboots**

## 🔧 Maintenance

### Updating Scripts
```bash
# Update package lists
sudo pacman -Sy

# Update AUR packages
yay -Syu

# Update all installed tools
for script in installers/scripts/install-*.sh; do
    echo "Running $script"
    "$script"
done
```

### Backup and Restore
```bash
# Backup current installations
pacman -Qqe > backup-packages.txt

# Restore from backup
sudo pacman -S - < backup-packages.txt
```

## 📊 Installation Summary

### Quick Setup Commands
```bash
# Development environment
./installers/scripts/install-neovim.sh
./installers/scripts/install-git.sh
./installers/scripts/install-lazygit.sh
./installers/scripts/install-rust.sh

# Terminal experience
./installers/scripts/install-ghostty.sh
./installers/scripts/install-fisher.sh
./installers/scripts/install-startship.sh
./installers/scripts/install-fzf.sh
./installers/scripts/install-eza.sh
./installers/scripts/install-bat.sh

# Desktop environment
./installers/scripts/install-rofi.sh
./installers/scripts/install-waybar.sh
./installers/scripts/install-swww.sh
```

### Complete Development Setup
```bash
# Run all essential scripts for a complete setup
for script in \
    install-git.sh \
    install-neovim.sh \
    install-lazygit.sh \
    install-ghostty.sh \
    install-fisher.sh \
    install-startship.sh \
    install-fzf.sh \
    install-eza.sh \
    install-bat.sh \
    install-rofi.sh \
    install-waybar.sh; do
    echo "Installing with $script"
    ./installers/scripts/"$script"
done
```

---

*Collection designed for automated, reliable, and comprehensive development environment setup.*