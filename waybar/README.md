Waybar Configuration

A highly customized status bar for Hyprland with elegant modules, system monitoring, and seamless desktop integration. Features custom scripts for enhanced functionality and a clean, modern design.

## 🎨 Features

- **Workspace Management**: Visual workspace indicators with click navigation
- **System Monitoring**: Real-time network, audio, and time display
- **Custom Modules**: Application launcher, Spotify controls, power menu
- **Network Manager**: Rofi-based network selection interface
- **Media Controls**: Spotify integration with playback controls
- **Power Management**: Quick access to system power options
- **Language Display**: Active keyboard layout indicator
- **System Tray**: Tray icon support for background applications

## 📁 Configuration Structure

```
waybar/.config/waybar/
├── config                    # Main configuration file
├── style.css                # CSS styling
└── scripts/
    ├── mediaplayer.py       # Spotify/media player controls
    └── network/
        ├── rofi-network-manager.sh  # Network selection UI
        ├── rofi-network-manager.rasi # Network theme
        ├── rofi-network-manager.conf # Network config
        └── colors.rasi      # Network color definitions
    └── power-menu/
        ├── powermenu.sh      # Power menu script
        ├── style.rasi        # Power menu theme
        ├── shared/
        │   ├── colors.rasi   # Shared color definitions
        │   └── fonts.rasi    # Font configurations
    ├── rofi-bluetooth       # Bluetooth controls
    └── spotify.sh           # Spotify controls
```

## 🎯 Modules Configuration

### Left Side Modules
1. **Custom Launcher** (`custom/launcher`)
   - Icon: `󱎯`
   - Action: Launch Rofi application launcher
   - Click: Opens app launcher

2. **Language Layout** (`hyprland/language`)
   - Display: Active keyboard layout (en, es, etc.)
   - Format: Short language code

3. **Spotify Player** (`custom/spotify`)
   - Icon: ``
   - Display: Current track information
   - Controls: Play/pause, next, previous

### Center Module
1. **Workspaces** (`hyprland/workspaces`)
   - Active: `` (filled square)
   - Inactive: `` (hollow square)
   - Action: Click to switch workspace

### Right Side Modules
1. **System Tray** (`tray`)
   - Display: Background application icons
   - Function: System tray integration

2. **Network** (`network`)
   - Ethernet: `` icon
   - Action: Click to open network manager
   - Tooltips: Connection information

3. **Audio** (`pulseaudio`)
   - Volume levels with icons
   - Bluetooth device support
   - Click: Open pavucontrol

4. **Clock** (`clock`)
   - Format: `HH:MM` (primary)
   - Alt Format: `Month Day Year` (on hover)
   - Double-click: Open gnome-clocks

5. **Power Menu** (`custom/power-menu`)
   - Icon: `⏻`
   - Action: Open Rofi power menu
   - Options: Lock, suspend, logout, reboot, shutdown

## ⚙️ Requirements

### Core Dependencies
```bash
# Waybar status bar
waybar

# For Hyprland integration
hyprland

# System utilities
pavucontrol          # Audio control
gnome-clocks          # Clock application
```

### Network Dependencies
```bash
# Network management
networkmanager
networkmanager-applet

# Optional: For network scripts
rofi                  # Network selection UI
```

### Audio Dependencies
```bash
# PulseAudio
pulseaudio
pulseaudio-utils

# Audio controls
pamixer              # CLI volume control
```

### Media Dependencies
```bash
# For Spotify controls
playerctl           # Media player controller
spotify             # Spotify client
```

### Python Dependencies
```bash
# For media player script
python              # Python runtime
python-psutil       # System utilities (optional)
```

## 🔧 Installation

### Method 1: Using Installer Script
```bash
# Run the included installer
./installers/scripts/install-waybar.sh
```

### Method 2: Manual Installation
```bash
# Install Waybar
sudo pacman -S waybar

# Install dependencies
sudo pacman -S networkmanager pavucontrol pulseaudio playerctl
```

### Configuration Setup
```bash
# Backup existing config
mv ~/.config/waybar ~/.config/waybar.backup

# Copy new configuration
cp -r waybar/.config/waybar ~/.config/waybar

# Make scripts executable
chmod +x ~/.config/waybar/scripts/network/rofi-network-manager.sh
chmod +x ~/.config/waybar/scripts/power-menu/powermenu.sh
chmod +x ~/.config/waybar/scripts/mediaplayer.py
```

## 🎨 Styling & Themes

### CSS Structure
The `style.css` file defines:
- **Window styling**: Transparency, borders, rounded corners
- **Module styling**: Colors, fonts, spacing
- **Hover effects**: Interactive feedback
- **Animations**: Smooth transitions

### Key Styling Features
- **Background**: Transparent with blur effects
- **Borders**: Subtle rounded corners
- **Colors**: Custom color palette matching system theme
- **Fonts**: Consistent typography across modules

### Custom Colors
```css
/* Primary colors */
@define-color primary #0DB7D4;
@define-color background #1a1a1a;
@define-color text #ffffff;
@define-color inactive #666666;
```

## 🔧 Module Configuration

### Custom Launcher Module
```json
"custom/launcher": {
    "format": "󱎯",
    "on-click": "~/.config/rofi/scripts/launcher/launcher.sh",
    "tooltip": "Application Launcher"
}
```

### Spotify Module
```json
"custom/spotify": {
    "exec": "python3 ~/.config/waybar/scripts/mediaplayer.py --player spotify",
    "format": " {}",
    "return-type": "json",
    "on-click": "playerctl play-pause",
    "on-double-click-right": "playerctl next",
    "on-scroll-down": "playerctl previous",
    "interval": 1
}
```

### Network Module
```json
"network": {
    "format-ethernet": "",
    "tooltip-format": "{essid}",
    "on-click": "~/.config/waybar/scripts/network/rofi-network-manager.sh"
}
```

## 🎯 Usage Examples

### Workspace Navigation
- **Click workspace icon**: Switch to that workspace
- **Visual feedback**: Active workspace highlighted
- **Dynamic updates**: Real-time workspace changes

### Media Controls
- **Single click**: Play/pause
- **Double click**: Next track
- **Scroll down**: Previous track
- **Display**: Current track information

### Network Management
- **Click network icon**: Open network selection
- **Rofi interface**: Choose WiFi/ethernet connection
- **Visual feedback**: Connection status display

### Audio Control
- **Click audio icon**: Open pavucontrol
- **Scroll**: Adjust volume (if configured)
- **Visual indicators**: Volume level, device type

## 🔧 Customization

### Adding New Modules
Add to `config.json`:
```json
{
    "custom/mymodule": {
        "format": "󰀻",
        "on-click": "my-command",
        "interval": 5
    }
}
```

### Styling Changes
Edit `style.css`:
```css
#custom-mymodule {
    color: #0DB7D4;
    padding: 0 10px;
    margin: 0 5px;
}

#custom-mymodule:hover {
    background: rgba(13, 183, 212, 0.2);
    border-radius: 10px;
}
```

### Module Positioning
Edit `modules-left`, `modules-center`, `modules-right`:
```json
"modules-left": ["custom/launcher", "hyprland/language", "custom/mymodule"],
```

## 🎨 Advanced Configuration

### Conditional Modules
```json
{
    "custom/battery": {
        "exec": "cat /sys/class/power_supply/BAT0/capacity",
        "format": " {}%",
        "if": "cat /sys/class/power_supply/BAT0/status"
    }
}
```

### Custom Scripts
Create custom module script:
```python
#!/usr/bin/env python3
import json
import subprocess

def get_module_info():
    # Your custom logic here
    return {
        "text": "Custom Info",
        "tooltip": "Detailed information",
        "class": "custom-class"
    }

if __name__ == "__main__":
    print(json.dumps(get_module_info()))
```

### Multiple Monitor Support
Configure for multiple monitors:
```bash
# Launch on specific monitor
waybar -b bar-0 -c ~/.config/waybar/config
waybar -b bar-1 -c ~/.config/waybar/config-secondary
```

## 🎨 Network Manager Integration

The network module includes a Rofi-based network manager:
- **WiFi selection**: Choose from available networks
- **Ethernet control**: Enable/disable wired connections
- **Visual feedback**: Connection status and signal strength

### Network Script Features
- **Automatic detection**: Find available networks
- **Security indicators**: Show locked/unlocked networks
- **Connection management**: Connect/disconnect functionality
- **Status updates**: Real-time connection status

## 🔧 Power Menu Integration

Seamlessly integrates with Rofi power menu:
- **Lock screen**: Screen locker integration
- **Suspend system**: Sleep functionality
- **Logout**: Exit Hyprland session
- **Reboot**: System restart
- **Shutdown**: Power off system

### Power Menu Features
- **Confirmation dialogs**: Safety prompts
- **Visual indicators**: Clear icons and labels
- **System integration**: Proper system commands

## 🐛 Troubleshooting

### Common Issues
1. **Waybar not starting**: Check dependencies and configuration
2. **Modules not showing**: Verify script permissions and syntax
3. **Styling not applying**: Check CSS syntax and paths
4. **Scripts not working**: Check Python dependencies

### Debug Mode
```bash
# Run with debug output
waybar -d

# Check configuration syntax
waybar -c ~/.config/waybar/config --check

# Test individual modules
waybar --log-level trace
```

### Module-Specific Issues
```bash
# Test media player script
python3 ~/.config/waybar/scripts/mediaplayer.py

# Test network script
~/.config/waybar/scripts/network/rofi-network-manager.sh

# Check dependencies
playerctl --list-all
pactl info
```

## 📝 Tips & Tricks

### Performance
1. **Limit update intervals** for better performance
2. **Use lightweight icons** and minimize animations
3. **Optimize scripts** for efficiency

### Customization
1. **Match system theme** for consistency
2. **Use appropriate spacing** for readability
3. **Add hover effects** for better interactivity

### Functionality
1. **Add custom modules** for your specific needs
2. **Integrate with system tools** for enhanced functionality
3. **Use tooltips** for additional information

---

*Configuration designed for functionality, aesthetics, and seamless desktop integration.*
