# Starship Configuration

A beautifully customized Starship prompt featuring the elegant Rose Pine color palette, minimal design, and intelligent context awareness for an enhanced terminal experience.

## 🎨 Features

- **Rose Pine Theme**: Beautiful, eye-friendly color scheme
- **Minimal Design**: Clean, uncluttered prompt display
- **Git Integration**: Advanced git status and branch information
- **Smart Path**: Intelligent directory path truncation
- **Context Awareness**: Environment-specific information
- **Fast Performance**: Optimized for quick rendering

## 🎨 Color Palette

### Rose Pine Colors
| Color | Hex | Usage |
|-------|-----|-------|
| **Base** | `#191724` | Background |
| **Surface** | `#1f1d2e` | Elevated surfaces |
| **Overlay** | `#26233a` | Interactive elements |
| **Muted** | `#6e6a86` | Disabled text |
| **Subtle** | `#908caa` | Secondary text |
| **Text** | `#e0def4` | Primary text |
| **Love** | `#eb6f92` | Error indicators |
| **Gold** | `#f6c177` | Warning indicators |
| **Rose** | `#ebbcba` | Accent color |
| **Pine** | `#31748f` | Primary accent |
| **Foam** | `#9ccfd8` | Directory color |
| **Iris** | `#c4a7e7` | Git information |

## 📁 Configuration Structure

```
starship/.config/starship.toml    # Main configuration file
```

## 🎯 Prompt Format

### Default Format
```
[directory][git_branch][git_status]character
```

### Example Output
```
~/projects/dotfiles  main ≡ ✗ ❯
```

## ⚙️ Configuration Details

### General Settings
```toml
add_newline = true          # Add blank line before prompt
command_timeout = 200       # Command execution timeout
format = "$directory$git_branch$git_status$character"
palette = "rose-pine"       # Use Rose Pine color palette
```

### Character Indicator
```toml
[character]
error_symbol = "[✗](bold love)"      # Red X for error
success_symbol = "[❯](bold pine)"    # Green arrow for success
```

### Directory Display
```toml
[directory]
truncation_length = 2                 # Truncate to 2 levels
truncation_symbol = "…/"              # Truncation indicator
repo_root_style = "bold pine"         # Bold for repo root
repo_root_format = "[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) "
style = "foam"                        # Foam color for directories
```

### Git Branch
```toml
[git_branch]
format = "[$branch]($style) "         # Branch name with space
style = "italic iris"                 # Italic iris color
```

### Git Status
```toml
[git_status]
format = '[$all_status]($style)'
style = "iris"
ahead = "⇡${count} "                  # Ahead commits
diverged = "⇕⇡${ahead_count}⇣${behind_count} "  # Diverged branches
behind = "⇣${count} "                 # Behind commits
conflicted = " "                    # Conflicts
up_to_date = " "                    # Up to date
untracked = "? "                     # Untracked files
modified = " "                     # Modified files
staged = ""                          # Empty for cleaner look
renamed = ""                         # Empty for cleaner look
deleted = ""                         # Empty for cleaner look
```

## ⚙️ Requirements

### Core Dependencies
```bash
# Starship prompt
starship

# Shell integration (Fish recommended)
fish
```

### Optional Dependencies
```bash
# For enhanced git functionality
git

# For directory awareness
# (Works with any shell)
```

## 🔧 Installation

### Method 1: Using Installer Script
```bash
# Run the included installer
./installers/scripts/install-startship.sh
```

### Method 2: Manual Installation
```bash
# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Or using package manager
sudo pacman -S starship
```

### Shell Integration Setup

#### For Fish (Recommended)
Add to `~/.config/fish/config.fish`:
```fish
starship init fish | source
```

#### For Bash
Add to `~/.bashrc`:
```bash
eval "$(starship init bash)"
```

#### For Zsh
Add to `~/.zshrc`:
```bash
eval "$(starship init zsh)"
```

### Configuration Setup
```bash
# Create config directory
mkdir -p ~/.config/starship

# Copy configuration
cp starship/.config/starship.toml ~/.config/starship.toml
```

## 🎨 Customization

### Changing Themes
Edit `~/.config/starship.toml`:

#### Rose Pine Variants
```toml
# Original Rose Pine
palette = "rose-pine"

# Light variant
palette = "rose-pine-dawn"

# Dark variant  
palette = "rose-pine-moon"
```

#### Custom Color Palette
```toml
[palettes.custom]
base = "#1a1a1a"
surface = "#2a2a2a"
overlay = "#3a3a3a"
muted = "#888888"
subtle = "#aaaaaa"
text = "#ffffff"
love = "#ff5555"
gold = "#ffaa00"
rose = "#ffcccc"
pine = "#00ff00"
foam = "#00ffff"
iris = "#aa00ff"
```

### Module Customization
```toml
# Add custom modules
format = """
$directory\
$git_branch\
$git_status\
$nodejs\
$python\
$character"""

[python]
symbol = "🐍 "
style = "green"

[nodejs]
symbol = "📦 "
style = "yellow"
```

### Advanced Formatting
```toml
# Complex format with multiple sections
format = """
[┌───────────────────>](bold fg:subtle)
[$directory](style)
[└─>](bold fg:subtle) $all
$character"""
```

## 🔧 Advanced Configuration

### Conditional Modules
```toml
# Only show in specific directories
[python]
detect_files = ["requirements.txt", "setup.py", "pyproject.toml"]
style = "bold green"

[docker_context]
detect_files = ["Dockerfile", "docker-compose.yml"]
symbol = "🐳 "
```

### Custom Commands
```toml
[custom.time]
command = "date '+%H:%M:%S'"
style = "bold dimmed white"
format = "[$output]($style) "

[custom.weather]
command = "curl wttr.in/?format=3"
style = "bold yellow"
format = "[$output]($style) "
when = true
```

### Performance Optimization
```toml
# Increase timeout for slow commands
command_timeout = 1000

# Disable slow modules
disabled = ["azure", "dart", "elixir", "elm"]

# Cache duration
[gcloud]
detect_folders = [".config"]
disabled = true
```

## 🎨 Module Reference

### Available Modules
- **directory**: Current directory path
- **git_branch**: Git branch name
- **git_status**: Git working directory status
- **git_commit**: Git commit hash
- **git_state**: Git operation state
- **character**: Prompt character
- **line_break**: Line break
- **jobs**: Background jobs
- **status**: Exit status
- **python**: Python version
- **nodejs**: Node.js version
- **rust**: Rust version
- **go**: Go version
- **docker_context**: Docker context
- **package**: Package version
- **memory_usage**: Memory usage
- **battery**: Battery status

### Module Options
```toml
[module_name]
format = "format string"
style = "color style"
symbol = "symbol"
disabled = false
detect_files = ["file1", "file2"]
detect_folders = ["folder1"]
detect_extensions = ["ext1", "ext2"]
```

## 🎯 Usage Examples

### Basic Prompt
```
~/projects/my-app  main ≡ ✗ ❯
```

### With Custom Modules
```
~/projects/my-app on main ≡ +2 ~1 -1 ! ? via 🐍 v3.9.0 ❯
```

### Git Status Indicators
| Symbol | Meaning |
|--------|---------|
| `⇡` | Ahead of remote |
| `⇣` | Behind remote |
| `⇕` | Diverged from remote |
| `≡` | Up to date |
| `✗` | Unstaged changes |
| `✚` | Staged changes |
| `?` | Untracked files |
| `!` | Modified files |
| `` | Merge conflicts |

## 🔧 Custom Presets

### Minimal Preset
```toml
format = "$character"
right_format = "$directory"
add_newline = false
```

### Development Preset
```toml
format = """
$directory\
$git_branch\
$git_status\
$python\
$nodejs\
$character"""
```

### System Admin Preset
```toml
format = """
$username\
$hostname\
$directory\
$git_branch\
$git_status\
$character"""
```

## 🐛 Troubleshooting

### Common Issues
1. **Prompt not showing**: Check shell integration
2. **Colors not applying**: Verify terminal color support
3. **Git status not working**: Check git installation
4. **Performance issues**: Disable slow modules

### Debug Mode
```bash
# Debug prompt rendering
starship explain

# Check configuration
starship config

# Test specific modules
starship module directory
starship module git_branch
```

### Performance Issues
```toml
# Increase timeout for slow commands
command_timeout = 2000

# Disable problematic modules
[azure]
disabled = true

# Reduce update frequency
[battery]
update_interval = 60
```

## 📝 Tips & Tricks

### Performance
1. **Disable unused modules** for faster rendering
2. **Use appropriate timeouts** for external commands
3. **Limit conditional checks** for better performance

### Customization
1. **Match your theme** for visual consistency
2. **Use meaningful symbols** for better readability
3. **Keep it simple** for optimal performance

### Productivity
1. **Show relevant context** for your workflow
2. **Use color coding** for quick status recognition
3. **Optimize for your shell** environment

## 🔧 Integration

### With Fish Shell
Already integrated with Fish configuration:
- Proper initialization
- Environment variable handling
- Custom function support

### With Terminal Emulators
Works with all modern terminals:
- Ghostty (recommended)
- Alacritty
- Kitty
- GNOME Terminal

### With Editors
Can be integrated with editor terminals:
- Neovim terminal
- VS Code terminal
- Jetbrains IDE terminals

---

*Configuration designed for beauty, functionality, and minimal visual noise.*