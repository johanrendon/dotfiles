# Hyprland Configuration

A highly customized and performant Wayland compositor configuration focused on productivity, aesthetics, and efficient workflow management.

## 🎨 Features

- **Modular Configuration**: Split into logical sections for easy management
- **Dwindle Layout**: Efficient tiling with pseudotiling support
- **Smooth Animations**: Custom bezier curves and transitions
- **Advanced Window Management**: Groups, centering, and dynamic workspaces
- **Multiple Monitor Support**: Configured for dual-monitor setup
- **Game Mode**: Performance optimization toggle for gaming
- **Beautiful Visuals**: Rounded corners, blur effects, and custom borders

## ⌨️ Keybindings

### Application Launchers
| Keybinding | Action |
|------------|--------|
| `Super + Return` | Launch Terminal (Ghostty) |
| `Super + D` | Application Launcher (Rofi) |
| `Super + F` | File Manager (Nautilus) |
| `Super + W` | Web Browser (Zen Browser) |
| `Super + S` | Spotify |
| `Super + O` | Obsidian |
| `Print` | Screenshot (Hyprshot) |
| `Super + Escape` | Power Menu |

### Window Management
| Keybinding | Action |
|------------|--------|
| `Super + Q` | Close Active Window |
| `Super + V` | Toggle Floating Mode |
| `Super + M` | Toggle Fullscreen |
| `Super + P` | Toggle Pseudotile |
| `Super + C` | Center Window |
| `Super + G` | Toggle Window Group |
| `Super + Ctrl + G` | Lock Active Group |
| `Alt + Tab` | Cycle Through Group Windows |

### Navigation & Focus
| Keybinding | Action |
|------------|--------|
| `Super + H/J/K/L` | Move Focus (Vim-style) |
| `Super + Ctrl + H/L` | Swap Windows Left/Right |
| `Super + ,/.` | Focus Previous/Next Monitor |

### Workspace Management
| Keybinding | Action |
|------------|--------|
| `Super + 1-9` | Switch to Workspace 1-9 |
| `Super + Shift + 1-9` | Move Window to Workspace |
| `Super + Alt + 1-9` | Move Window to Workspace (Silent) |

### Window Resizing
| Keybinding | Action |
|------------|--------|
| `Super + R` | Enter Resize Mode |
| `Arrow Keys / HJKL` | Resize Active Window |
| `Escape` | Exit Resize Mode |

### System Controls
| Keybinding | Action |
|------------|--------|
| `Super + Shift + M` | Exit Hyprland |
| `Super + Ctrl + R` | Restart Waybar |
| `Super + Ctrl + T` | Refresh Waybar |
| `Super + F1` | Toggle Game Mode |
| `XF86Audio*` | Volume Controls |

### Mouse Controls
| Keybinding | Action |
|------------|--------|
| `Super + Left Click` | Move Window |
| `Super + Right Click` | Resize Window |

## 📁 Configuration Structure

```
hyprland/.config/hypr/
├── configs/
│   ├── apps.conf      # Application variables and paths
│   ├── envs.conf      # Environment variables
│   ├── input.conf     # Input devices and settings
│   ├── keys.conf      # All keybindings
│   ├── misc.conf      # General settings and decorations
│   ├── monitors.conf  # Monitor configuration
│   ├── rules.conf     # Window rules
│   └── startup.conf   # Autostart applications
├── gamemode.sh        # Game mode toggle script
└── hyprland.conf      # Main configuration file
```

## 🚀 Performance Features

### Game Mode
- **Toggle**: `Super + F1`
- **Effects**: Disables animations, blur, and gaps
- **Purpose**: Maximum performance for gaming

### Animations
- Custom bezier curves for smooth transitions
- Material Design inspired animations
- Optimized for 60+ FPS performance

### Window Management
- **Dwindle Layout**: Dynamic tiling with smart splits
- **Pseudotiling**: Floating windows within tiled layout
- **Window Groups**: Tab-like window organization
- **Smart Gaps**: Dynamic gap management

## 🎨 Visual Features

### Decorations
- **Rounded Corners**: 20px radius
- **Blur Effects**: Multi-pass blur with popups
- **Active Border**: Cyan highlight (`#0DB7D4`)
- **Inactive Border**: Transparent with subtle gray

### Colors
- **Active**: Cyan accent colors
- **Inactive**: Minimal, clean borders
- **Background**: Transparent with blur

## ⚙️ Requirements

### Core Dependencies
```bash
# Wayland compositor
hyprland

# Essential utilities
hyprshot          # Screenshots
rofi              # Application launcher
waybar            # Status bar
```

### Input & Graphics
```bash
# Input handling
libinput
wlopm

# Graphics and display
hyprland-protocols
hyprlang
```

### Audio & System
```bash
# Audio control
pulseaudio
pamixer
```

### Recommended Applications
```bash
# Terminal and shell
ghostty
fish

# File management
nautilus

# Browser
zen-browser

# Media
spotify

# Notes
obsidian
```

## 🔧 Installation

1. **Install Core Dependencies**:
```bash
# Arch Linux
sudo pacman -S hyprland hyprshot

# AUR packages
yay -S hyprland-git
```

2. **Copy Configuration**:
```bash
# Backup existing config
mv ~/.config/hypr ~/.config/hypr.backup

# Copy new configuration
cp -r hyprland/.config/hypr ~/.config/hypr
```

3. **Install Required Applications**:
```bash
# Install essential apps
./installers/scripts/install-ghostty.sh
./installers/scripts/install-rofi.sh
./installers/scripts/install-waybar.sh
```

4. **Set Up Display Manager**:
```bash
# For SDDM (recommended)
sudo pacman -S sddm
sudo systemctl enable sddm

# Or configure your preferred display manager
```

## 🎮 Game Mode

The included `gamemode.sh` script provides one-click performance optimization:

### Features
- Disables all animations
- Removes window decorations
- Eliminates gaps and borders
- Optimizes for minimal input lag

### Usage
```bash
# Toggle game mode
Super + F1

# Or manually
~/.config/hypr/gamemode.sh
```

## 🖥️ Monitor Configuration

Pre-configured for dual-monitor setup:
- **Primary**: HDMI-A-1 (1920x1080@100Hz)
- **Secondary**: DVI-D-1 (1280x1024@75Hz)

Adjust paths in `configs/monitors.conf` for your setup.

## 🔧 Customization

### Adding New Keybindings
Edit `configs/keys.conf`:
```bash
# Add your keybinding
bind = $mainMod, KEY, ACTION, PARAMETERS
```

### Changing Applications
Edit `configs/apps.conf`:
```bash
# Modify application variables
$terminal = your_terminal
$browser = your_browser
```

### Adjusting Visuals
Edit `configs/misc.conf`:
```bash
# Modify appearance
general {
    gaps_in = 4
    border_size = 1
    col.active_border = rgba(YOUR_COLOR)
}
```

## 🐛 Troubleshooting

### Common Issues
1. **Waybar not showing**: Check `configs/startup.conf`
2. **Keybindings not working**: Verify syntax in `configs/keys.conf`
3. **Animations laggy**: Reduce complexity in `configs/misc.conf`

### Logs
```bash
# Check Hyprland logs
journalctl -b -u hyprland

# Debug configuration
hyprctl config errors
```

## 📝 License

This configuration follows the MIT License. Feel free to use, modify, and distribute according to your needs.

---

*Configuration optimized for productivity and visual appeal on Wayland systems.*