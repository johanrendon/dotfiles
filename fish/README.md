# Fish Shell Configuration

A beautifully configured Fish shell with modern utilities, productivity-enhancing plugins, and a curated set of aliases for an efficient terminal experience.

## 🎨 Features

- **Modern Aliases**: Enhanced `ls` with `eza`, `cat` with `bat`, `cd` with `zoxide`
- **Fish Plugins**: Fisher package manager with curated plugins
- **FZF Integration**: Advanced fuzzy finding capabilities
- **Starship Prompt**: Beautiful, informative prompt with git integration
- **Rose Pine Themes**: Beautiful color schemes for Fish
- **Smart Navigation**: Intelligent directory jumping and file browsing
- **Enhanced Completion**: Improved command completion and suggestions

## 📁 Configuration Structure

```
fish/.config/fish/
├── config.fish              # Main configuration file
├── fish_plugins             # Fisher plugin list
├── fish_variables           # Universal variables
├── conf.d/
│   └── fzf.fish            # FZF configuration
├── completions/
│   ├── fisher.fish         # Fisher completions
│   └── fzf_configure_bindings.fish  # FZF bindings
└── functions/
    ├── _fzf_*.fish         # FZF helper functions
    ├── fisher.fish         # Fisher plugin manager
    └── fzf_configure_bindings.fish  # FZF setup
└── themes/
    ├── Rosé Pine.theme     # Primary theme
    ├── Rosé Pine Dawn.theme  # Light variant
    └── Rosé Pine Moon.theme # Dark variant
```

## 🎯 Key Features

### Enhanced Aliases
| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `eza -al --color=always --group-directories-first --icons` | Enhanced file listing |
| `la` | `eza -a --color=always --group-directories-first --icons` | Show all files |
| `ll` | `eza -l --color=always --group-directories-first --icons` | Long format |
| `lt` | `eza -aT --color=always --group-directories-first --icons` | Tree view |
| `l.` | `eza -a | grep -e '^\.'` | Show only dotfiles |
| `cat` | `bat` | Modern cat with syntax highlighting |
| `cd` | `z` | Smart directory jumping |
| `update` | `sudo pacman -Syu` | System update |
| `cleanup` | `sudo pacman -Rns (pacman -Qtdq)` | Remove orphaned packages |

### System Management
| Alias | Command | Description |
|-------|---------|-------------|
| `mirror` | `sudo cachyos-rate-mirrors` | Get fastest mirrors |
| `fixpacman` | `sudo rm /var/lib/pacman/db.lck` | Fix pacman lock |
| `jctl` | `journalctl -p 3 -xb` | System error logs |
| `big` | `expac -H M '%m\t%n' | sort -h | nl` | Sort packages by size |
| `gitpkg` | `pacman -Q | grep -i "\-git" | wc -l` | Count git packages |
| `rip` | `expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl` | Recent packages |

### Directory Navigation
| Alias | Command | Description |
|-------|---------|-------------|
| `..` | `cd ..` | Up one directory |
| `...` | `cd ../..` | Up two directories |
| `....` | `cd ../../..` | Up three directories |
| `.....` | `cd ../../../..` | Up four directories |
| `......` | `cd ../../../../..` | Up five directories |

## 🚀 Plugins

### Fisher Plugin Manager
**Location**: `fish_plugins`
```fish
jorgebucaran/fisher          # Plugin manager
rose-pine/fish              # Rose Pine themes
patrickf1/fzf.fish           # FZF integration
```

### FZF Integration Features
- **Fuzzy file searching**: `Ctrl+T` in command mode
- **Directory navigation**: `Alt+C` 
- **Command history search**: `Ctrl+R`
- **Git integration**: Enhanced git commands
- **Process management**: Fuzzy process selection

### Rose Pine Themes
- **Rosé Pine**: Beautiful purple-based theme
- **Rosé Pine Dawn**: Light variant for daytime use
- **Rosé Pine Moon**: Dark variant for nighttime use

## ⚙️ Requirements

### Core Dependencies
```bash
# Fish shell
fish

# Essential utilities
eza          # Modern ls replacement
bat          # Modern cat replacement
fzf          # Fuzzy finder
zoxide       # Smart cd replacement
starship     # Custom prompt
```

### System Integration
```bash
# For Arch Linux users
pacman       # Package management
cachyos-rate-mirrors  # Mirror optimization

# Optional but recommended
exa          # If eza not available (legacy)
```

## 🔧 Installation

### Method 1: Using Installer Scripts
```bash
# Install Fish shell
sudo pacman -S fish

# Install plugins
./installers/scripts/install-fisher.sh

# Install utilities
./installers/scripts/install-eza.sh
./installers/scripts/install-fzf.sh
./installers/scripts/install-zoxide.sh
./installers/scripts/install-startship.sh
```

### Method 2: Manual Installation
```bash
# Install Fish shell
sudo pacman -S fish

# Set Fish as default shell
chsh -s /usr/bin/fish

# Install Fisher plugin manager
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install plugins
fisher install rose-pine/fish patrickf1/fzf.fish

# Install utilities
sudo pacman -S fzf
yay -S eza bat zoxide
curl -sS https://starship.rs/install.sh | sh
```

### Configuration Setup
```bash
# Backup existing config
mv ~/.config/fish ~/.config/fish.backup

# Copy new configuration
cp -r fish/.config/fish ~/.config/fish

# Set up universal variables
fish_config
```

## 🎨 Customization

### Adding New Aliases
Add to `~/.config/fish/config.fish`:
```fish
# Custom aliases
alias newalias='command --options'
alias project='cd ~/projects'
alias serve='python -m http.server 8000'
```

### Installing New Plugins
```bash
# Using Fisher
fisher install new-plugin

# Update plugins
fisher update

# List installed plugins
fisher list

# Remove plugin
fisher remove plugin-name
```

### Custom Functions
Create new function in `~/.config/fish/functions/`:
```fish
# Custom function example
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end
```

### Theme Customization
```fish
# Set theme
fish_config theme choose "Rosé Pine"

# Or set in config.fish
set -g theme_color_scheme dark
```

## 🔧 FZF Configuration

### Default FZF Bindings
- `Ctrl+T`: Fuzzy file selection
- `Ctrl+R`: Fuzzy history search  
- `Alt+C`: Fuzzy directory change
- `Ctrl+Alt+T`: Fuzzy process selection

### Custom FZF Functions
```bash
# Git file selector
_fzf_search_git_status

# Directory search
_fzf_search_directory

# Process manager
_fzf_search_processes

# Variable inspector
_fzf_search_variables
```

## 🎯 Usage Examples

### Enhanced File Operations
```fish
# Enhanced listing
ls                    # eza with icons and colors
la                    # All files with details
lt                    # Tree view of directory

# Modern file viewing
cat file.txt         # bat with syntax highlighting
bat file.md          # Markdown preview
```

### Smart Navigation
```fish
# Directory jumping
z project            # Jump to project directory
z Downloads          # Jump to Downloads
z -                  # Previous directory

# Enhanced cd
cd ..                # Up one directory
cd ...               # Up two directories
```

### Package Management
```fish
# System maintenance
update               # Update system
cleanup              # Remove orphaned packages
mirror               # Update mirrors

# Package information
big                  # Show largest packages
gitpkg               # Count git packages
rip                  # Recent installations
```

### FZF Integration
```fish
# File selection (Ctrl+T)
vim (Ctrl+T)        # Fuzzy file selection in vim

# History search (Ctrl+R)
command (Ctrl+R)    # Fuzzy history search

# Directory change (Alt+C)
cd (Alt+C)          # Fuzzy directory selection
```

## 🔧 Advanced Configuration

### Custom Prompt Integration
The configuration includes Starship prompt with Fish:
- Git status and branch information
- Directory context
- Command execution time
- Exit status indicators

### Environment Variables
```fish
# Set in config.fish
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PATH ~/.local/bin $PATH
```

### Conditional Aliases
```fish
# Platform-specific aliases
if test (uname) = "Linux"
    alias ls='eza --icons'
end

# Tool-specific aliases
if command -v nvim >/dev/null
    alias vi='nvim'
    alias vim='nvim'
end
```

## 🎨 Theme Configuration

### Using Rose Pine Themes
```fish
# Set theme interactively
fish_config theme choose "Rosé Pine"

# Or set in config.fish
set -g theme_color_scheme dark
```

### Custom Theme Colors
```fish
# Override theme colors
set -g fish_color_normal normal
set -g fish_color_command cyan
set -g fish_color_keyword yellow
set -g fish_color_quote brown
set -g fish_color_redirection brblue
set -g fish_color_end green
set -g fish_color_error brred
set -g fish_color_param blue
set -g fish_color_comment red
set -g fish_color_selection --background=brblack
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_history_current --bold
set -g fish_color_operator brgreen
set -g fish_color_escape brcyan
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_valid_path --underline
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_user brgreen
set -g fish_color_host normal
set -g fish_color_cancel -r
set -g fish_pager_color_completion normal
set -g fish_pager_color_description B3A06D yellow
set -g fish_pager_color_prefix white --bold --underline
set -g fish_pager_color_progress brwhite --background=cyan
```

## 🐛 Troubleshooting

### Common Issues
1. **Plugins not loading**: Check Fisher installation
2. **FZF not working**: Install fzf package
3. **Themes not applying**: Run `fish_config`
4. **Aliases not working**: Check syntax in config.fish

### Debug Mode
```fish
# Check Fish version
fish --version

# List all functions
functions

# Show all variables
set --names

# Check configuration
fish_config
```

### Plugin Issues
```bash
# Reinstall plugins
fisher update

# Reset configuration
fish_config reset

# Check plugin status
fisher list
```

## 📝 Tips & Tricks

### Productivity
1. **Use FZF extensively** for fuzzy finding
2. **Master zoxide** for directory navigation
3. **Customize aliases** for your workflow
4. **Use Starship prompt** for better context

### Performance
1. **Keep config clean** for faster startup
2. **Use conditional aliases** for cross-platform compatibility
3. **Optimize PATH** for faster command lookup

### Customization
1. **Add project-specific functions** for common tasks
2. **Create custom completions** for your tools
3. **Use universal variables** for persistent settings

---

*Configuration designed for speed, beauty, and an enhanced terminal experience.*