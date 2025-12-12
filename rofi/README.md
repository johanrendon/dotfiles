# Rofi Configuration

A beautifully customized Rofi setup with multiple themes, application launcher, power menu, and seamless integration with the Hyprland desktop environment.

## 🎨 Features

- **Application Launcher**: Quick app search and launch
- **Power Menu**: Elegant system control interface
- **Multiple Themes**: 17+ color schemes included
- **Smooth Animations**: Polished transitions and effects
- **Icon Support**: Visual enhancement for applications
- **Script Integration**: Custom scripts for enhanced functionality

## 🎯 Main Scripts

### Application Launcher
- **Location**: `scripts/launcher/launcher.sh`
- **Theme**: `scripts/launcher/style.rasi`
- **Trigger**: `Super + D` (from Hyprland)

### Power Menu
- **Location**: `scripts/powermenu/powermenu.sh`
- **Theme**: `scripts/powermenu/style.rasi`
- **Trigger**: `Super + Escape` (from Hyprland)

## 🎨 Available Themes

### Dark Themes
| Theme | Description |
|-------|-------------|
| **Dracula** | Classic dark purple theme |
| **Nord** | Nordic blue palette |
| **Gruvbox** | Warm retro colors |
| **Catppuccin** | Modern pastel dark |
| **Tokyo Night** | Dark purple/blue |
| **Onedark** | VS Code inspired |

### Light Themes
| Theme | Description |
|-------|-------------|
| **Paper** | Clean light theme |
| **Solarized** | Eye-friendly light |
| **Adapta** | Material Design light |

### Special Themes
| Theme | Description |
|-------|-------------|
| **Cyberpunk** | Neon futuristic |
| **Navy** | Dark blue professional |
| **Black** | Minimal pure black |
| **Arc** | GTK-inspired |

## ⌨️ Power Menu Controls

The power menu provides system control options:

| Option | Key | Action |
|--------|-----|--------|
| **Lock** | Click/Enter | Lock screen (betterlockscreen/i3lock) |
| **Suspend** | Click/Enter | Sleep system |
| **Logout** | Click/Enter | Exit Hyprland |
| **Reboot** | Click/Enter | Restart system |
| **Shutdown** | Click/Enter | Power off system |

### Confirmation Dialog
- **Yes**: Execute selected action
- **No**: Cancel operation

## 📁 Configuration Structure

```
rofi/.config/rofi/
├── colors/                 # Color theme files
│   ├── dracula.rasi       # Dracula theme
│   ├── nord.rasi          # Nord theme
│   ├── catppuccin.rasi    # Catppuccin theme
│   └── ...                # Other themes
├── scripts/
│   ├── launcher/          # Application launcher
│   │   ├── launcher.sh    # Launcher script
│   │   └── style.rasi     # Launcher theme
│   ├── powermenu/         # Power management
│   │   ├── powermenu.sh   # Power menu script
│   │   └── style.rasi     # Power menu theme
│   └── shared/            # Shared resources
│       ├── colors.rasi    # Common color definitions
│       └── fonts.rasi     # Font configurations
```

## 🚀 Features

### Application Launcher
- **Fuzzy Search**: Intelligent app discovery
- **Icon Support**: Visual app identification
- **Category Support**: Organized app display
- **Quick Execution**: Enter to launch selected app

### Power Menu
- **System Uptime**: Display current uptime
- **Hostname**: Show system name
- **Confirmation**: Safety prompts for destructive actions
- **Visual Feedback**: Clear icons and labels

### Visual Design
- **Rounded Corners**: Modern aesthetics
- **Blur Effects**: Glass morphism background
- **Smooth Transitions**: Animated interactions
- **Custom Fonts**: Optimized typography

## ⚙️ Requirements

### Core Dependencies
```bash
# Rofi application
rofi

# For icons (optional but recommended)
papirus-icon-theme  # or other icon theme
```

### Power Menu Dependencies
```bash
# Screen locking
betterlockscreen    # or i3lock
```

### Integration Dependencies
```bash
# For Hyprland integration
hyprland            # Wayland compositor
```

## 🔧 Installation

1. **Install Rofi**:
```bash
# Arch Linux
sudo pacman -S rofi

# Optional: Icon theme
sudo pacman -S papirus-icon-theme
```

2. **Copy Configuration**:
```bash
# Backup existing config
mv ~/.config/rofi ~/.config/rofi.backup

# Copy new configuration
cp -r rofi/.config/rofi ~/.config/rofi
```

3. **Set Up Scripts**:
```bash
# Make scripts executable
chmod +x ~/.config/rofi/scripts/launcher/launcher.sh
chmod +x ~/.config/rofi/scripts/powermenu/powermenu.sh
```

4. **Install Screen Locker**:
```bash
# For lock screen functionality
sudo pacman -S betterlockscreen
# or
sudo pacman -S i3lock
```

## 🎨 Customization

### Changing Themes
1. **Edit Launcher Theme**:
```bash
# Modify the launcher script
nano ~/.config/rofi/scripts/launcher/launcher.sh

# Change theme line to use different color
theme='dracula'  # or any theme from colors/
```

2. **Custom Colors**:
```bash
# Create custom theme in colors/mytheme.rasi
# Use existing themes as template
```

### Modifying Launcher
Edit `scripts/launcher/launcher.sh`:
```bash
#!/bin/bash

# Change to different Rofi mode
rofi -show run         # Command run mode
rofi -show window      # Window switcher
rofi -show filebrowser # File browser
```

### Custom Power Menu Actions
Edit `scripts/powermenu/powermenu.sh`:
```bash
# Add custom actions
custom=' Custom'
# Add to options list
echo -e "$lock\n$suspend\n$custom\n$logout\n$reboot\n$shutdown"

# Add action handler
$custom)
  # Your custom action here
  ;;
```

## 🎯 Usage Examples

### Running Application Launcher
```bash
# From terminal
~/.config/rofi/scripts/launcher/launcher.sh

# Or with custom theme
rofi -show drun -theme ~/.config/rofi/colors/dracula.rasi
```

### Running Power Menu
```bash
# From terminal
~/.config/rofi/scripts/powermenu/powermenu.sh
```

### Testing Different Themes
```bash
# Test a specific theme
rofi -show drun -theme ~/.config/rofi/colors/nord.rasi

# List available themes
ls ~/.config/rofi/colors/
```

## 🔧 Advanced Configuration

### Custom Keybindings
Add to `~/.config/rofi/config.rasi`:
```bash
configuration {
    /* Key bindings */
    kb-primary-paste: "Control+V,Shift+Insert";
    kb-secondary-paste: "Control+v,Insert";
    kb-clear-line: "Control+U";
    kb-move-front: "Control+A";
    kb-move-end: "Control+E";
    kb-move-word-back: "Alt+B,Control+Left";
    kb-move-word-forward: "Alt+F,Control+Right";
}
```

### Window-specific Themes
Create per-application themes:
```bash
# Create app-specific configuration
~/.config/rofi/terminal.rasi
~/.config/rofi/browser.rasi
```

### Performance Optimization
```bash
# For faster searches, limit application list
rofi -show drun -drun-categories "Development;Utility;Game"
```

## 🐛 Troubleshooting

### Common Issues
1. **Icons not showing**: Install icon theme
2. **Scripts not executable**: Run `chmod +x scripts/*.sh`
3. **Theme not loading**: Check file paths and syntax
4. **Power menu not working**: Install screen locker

### Debug Mode
```bash
# Run with debug output
rofi -show drun -debug

# Check configuration syntax
rofi -config ~/.config/rofi/config.rasi -show drun -dump-config
```

## 📝 Integration

### Hyprland Integration
Already configured in the Hyprland keybinds:
- `Super + D`: Application launcher
- `Super + Escape`: Power menu

### Other Window Managers
Add to your window manager config:
```bash
# For i3/Sway
bindsym $mod+d exec ~/.config/rofi/scripts/launcher/launcher.sh
bindsym $mod+Escape exec ~/.config/rofi/scripts/powermenu/powermenu.sh
```

## 🎨 Creating Custom Themes

1. **Copy Existing Theme**:
```bash
cp ~/.config/rofi/colors/dracula.rasi ~/.config/rofi/colors/mytheme.rasi
```

2. **Edit Colors**:
```css
* {
    background: #1a1a1a;
    foreground: #ffffff;
    selected-normal-foreground: #000000;
    selected-normal-background: #bd93f9;
    /* Add more color definitions */
}
```

3. **Test Theme**:
```bash
rofi -show drun -theme ~/.config/rofi/colors/mytheme.rasi
```

---

*Configuration designed for speed, beauty, and seamless desktop integration.*