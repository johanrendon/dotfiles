# Ghostty Configuration

A modern, high-performance terminal emulator configured for optimal productivity with advanced features, beautiful themes, and seamless shell integration.

## 🎨 Features

- **Rose Pine Theme**: Beautiful, eye-friendly color scheme
- **Shell Integration**: Fish shell integration with proper session handling
- **Advanced Splits**: Easy window management with keyboard navigation
- **Clipboard Support**: Full clipboard read/write permissions
- **Session Persistence**: Window state saved between sessions
- **Modern Font**: FiraCode Nerd Font with ligatures
- **Background Blur**: Transparent background for visual appeal

## ⌨️ Keybindings

### Window Management
| Keybinding | Action |
|------------|--------|
| `Alt + J` | Create horizontal split (down) |
| `Alt + H` | Create vertical split (left) |
| `Alt + K` | Create horizontal split (up) |
| `Alt + L` | Create vertical split (right) |
| `Alt + F` | Toggle split zoom/focus |

### Navigation
| Keybinding | Action |
|------------|--------|
| `Ctrl + H` | Move to left split |
| `Ctrl + J` | Move to bottom split |
| `Ctrl + K` | Move to top split |
| `Ctrl + L` | Move to right split |

### Tab Management
| Keybinding | Action |
|------------|--------|
| `Alt + A, N` | Next tab |
| `Alt + A, P` | Previous tab |

### Terminal Control
| Keybinding | Action |
|------------|--------|
| `Ctrl + R` | Reload configuration |
| `Alt + Q` | Close current tab/split |

## 📁 Configuration Structure

```
ghostty/.config/ghostty/
└── config                  # Main configuration file
```

## ⚙️ Configuration Details

### Theme & Appearance
- **Theme**: Rose Pine (dark variant)
- **Background**: 80% opacity for blur effect
- **Font**: FiraCode Nerd Font at 14pt
- **Window Theme**: Dark mode

### Shell Integration
- **Shell**: Fish with login and interactive modes
- **Integration**: Full shell integration for better functionality
- **Environment**: Proper session handling

### Permissions & Features
- **Clipboard**: Full read/write access
- **Window State**: Automatic save/restore
- **Split Navigation**: Vim-style movement

## ⚙️ Requirements

### Core Dependencies
```bash
# Ghostty terminal
ghostty

# Font (required for proper rendering)
ttf-firacode-nerd

# Shell integration (Fish recommended)
fish
```

### Optional Dependencies
```bash
# For Fish integration
starship    # Custom prompt
fzf         # Fuzzy finder
```

## 🔧 Installation

### Method 1: Using the Installer Script
```bash
# Run the included installer
./installers/scripts/install-ghostty.sh
```

### Method 2: Manual Installation
```bash
# From AUR (Arch Linux)
yay -S ghostty

# From source (if available)
git clone https://github.com/mitchellh/ghostty
cd ghostty
make install
```

### Font Installation
```bash
# Install FiraCode Nerd Font
sudo pacman -S ttf-firacode-nerd

# Or from AUR
yay -S nerd-fonts-fira-code
```

## 🚀 Setup

1. **Copy Configuration**:
```bash
# Create config directory
mkdir -p ~/.config/ghostty

# Copy configuration
cp ghostty/.config/ghostty/config ~/.config/ghostty/config
```

2. **Set as Default Terminal**:
```bash
# For Hyprland (already configured)
# Terminal is set in apps.conf

# For system-wide default
# Set in your desktop environment settings
```

3. **Verify Shell Integration**:
```bash
# Launch ghostty
ghostty

# Check Fish integration
echo $SHELL  # Should output /usr/bin/fish
```

## 🎨 Customization

### Changing the Theme
Edit `~/.config/ghostty/config`:
```bash
# Change theme
theme = "Catppuccin"
# Or any other available theme

# Or create custom theme
theme = "/path/to/custom/theme"
```

### Font Customization
```bash
# Change font family
font-family = "JetBrains Mono Nerd Font"

# Change font size
font-size = 12

# Enable font ligatures
font-ligatures = true
```

### Background Effects
```bash
# Adjust transparency
background-opacity = 0.9

# Enable/disable blur
background-blur = true

# Solid background color
background-color = "#1a1a1a"
```

### Window Behavior
```bash
# Window size on startup
window-width = 120
window-height = 40

# Remember window position
window-save-state = always

# Window theme (light/dark)
window-theme = light
```

## 🔧 Advanced Configuration

### Custom Keybindings
Add to `~/.config/ghostty/config`:
```bash
# Custom keybindings
keybind = ctrl+shift+n=new_window
keybind = ctrl+shift+t=new_tab
keybind = ctrl+shift+w=close_surface
keybind = ctrl+shift+c=copy_to_clipboard
keybind = ctrl+shift+v=paste_from_clipboard
```

### Shell-Specific Configuration
```bash
# Different shell for specific profiles
keybind = ctrl+shift+f=spawn new "/usr/bin/fish"
keybind = ctrl+shift+b=spawn new "/usr/bin/bash"
```

### Performance Settings
```bash
# Adjust rendering performance
# Lower values for better performance on older hardware
resize-delay = 10
fps = 60
```

## 🎯 Usage Examples

### Basic Operations
```bash
# Launch with custom configuration
ghostty --config=/path/to/config

# Open in specific directory
ghostty --directory=/path/to/dir

# Execute command immediately
ghostty --command="htop"
```

### Multiple Windows
```bash
# Open multiple instances
ghostty &
ghostty --command="vim" &
ghostty --directory="~/projects" &
```

### Profile-Specific Launch
```bash
# Create aliases in your shell
alias ghost="ghostty"
alias ghost-dev="ghostty --directory=~/development"
alias ghost-sys="ghostty --command=htop"
```

## 🎨 Available Themes

Ghostty supports various built-in themes:
- **Rose Pine** (default)
- **Catppuccin**
- **Dracula**
- **Gruvbox**
- **Nord**
- **Material Design**

## 🐛 Troubleshooting

### Common Issues
1. **Font not rendering**: Install FiraCode Nerd Font
2. **Shell integration not working**: Verify Fish installation
3. **Keybindings not working**: Check for conflicts with system keybindings
4. **Transparency not working**: Ensure compositor is running

### Debug Mode
```bash
# Launch with debug output
ghostty --debug

# Check configuration
ghostty --config-check
```

### Performance Issues
```bash
# Reduce animation effects
# Add to config:
resize-delay = 5
fps = 30
```

## 🔧 Integration

### Hyprland Integration
Already configured in the Hyprland setup:
- `Super + Return`: Launch Ghostty
- Proper window rules and sizing

### Shell Integration
With Fish shell and Starship:
- Custom prompt with git integration
- Enhanced command completion
- Fuzzy finder integration

### Editor Integration
```bash
# Set as default terminal for editors
# For Neovim (in init.lua)
vim.opt.shell = "ghostty"
```

## 📝 Tips & Tricks

### Productivity
1. **Use splits effectively** for multitasking
2. **Master keyboard navigation** to avoid mouse usage
3. **Customize keybindings** for your workflow
4. **Use multiple tabs** for different projects

### Visual Customization
1. **Adjust opacity** for better visibility
2. **Experiment with themes** for comfort
3. **Choose fonts** that work for you
4. **Consider blur effects** for aesthetics

### Performance
1. **Keep font size reasonable** for performance
2. **Limit background transparency** on older hardware
3. **Use appropriate frame rates** for your system

## 🔄 Updates

### Updating Configuration
```bash
# Backup current config
cp ~/.config/ghostty/config ~/.config/ghostty/config.backup

# Update with new configuration
cp /path/to/new/config ~/.config/ghostty/config

# Reload configuration
# Press Ctrl+R in Ghostty or restart
```

### Updating Ghostty
```bash
# From AUR
yay -S ghostty

# Check version
ghostty --version
```

---

*Configuration optimized for productivity, visual comfort, and seamless workflow integration.*