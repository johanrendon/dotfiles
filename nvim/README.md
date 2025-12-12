# Neovim Configuration

**Note**: This configuration has been removed from the dotfiles repository. The following README provides documentation for a modern, feature-rich Neovim setup that you can implement.

## 🎨 Features (Recommended Setup)

A modern Neovim configuration focusing on productivity, aesthetics, and powerful development features:

### 🚀 Core Features
- **Lightweight & Fast**: Minimal startup time with lazy loading
- **Modern LSP**: Complete Language Server Protocol support
- **Fuzzy Finding**: Advanced file and content search with Telescope
- **Git Integration**: Comprehensive git workflow support
- **Tree-sitter**: Advanced syntax highlighting and code understanding
- **Auto-completion**: Intelligent code completion with Blink.cmp
- **Auto-formatting**: Code formatting on save with Conform
- **Session Management**: Persistent sessions and workspace management

### 🎯 Development Features
- **Multi-language Support**: Python, Rust, JavaScript, TypeScript, Lua, and more
- **Debugging**: Integrated debugging with nvim-dap
- **Testing**: Test runner integration with nvim-neotest
- **File Management**: Advanced file operations with oil.nvim
- **Markdown**: Enhanced markdown editing and preview
- **Note-taking**: Obsidian integration for personal wiki
- **Project Management**: Harpoon for quick file navigation

### 🎨 Visual Features
- **Beautiful UI**: Custom color scheme with transparent backgrounds
- **Status Line**: Comprehensive status information with lualine
- **Indent Guides**: Visual indentation levels
- **File Icons**: File type icons in various UI elements
- **Smooth Animations**: Polished transitions and effects
- **Minimal Design**: Clean, distraction-free interface

## ⚙️ Requirements

### Core Dependencies
```bash
# Neovim
neovim >= 0.9.0

# Essential build tools
base-devel
gcc
make
```

### Language Specific
```bash
# Python development
python
python-pip

# Rust development  
rust
cargo

# Node.js development
nodejs
npm

# Git (for git integration)
git
```

### Optional Dependencies
```bash
# Ripgrep for fast file searching
ripgrep

# FD for better find command
fd

# Tree-sitter for advanced syntax highlighting
tree-sitter

# Clipboard support (on X11)
xclip
# or on Wayland
wl-clipboard
```

## 🔧 Installation

### Method 1: Using Installer Script
```bash
# Run the installer
./installers/scripts/install-neovim.sh
```

### Method 2: Manual Installation
```bash
# Install Neovim
sudo pacman -S neovim

# Or from source for latest version
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
```

### Configuration Setup
```bash
# Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup

# Create new configuration structure
mkdir -p ~/.config/nvim/{lua,user,lua/plugins}
```

## 📁 Recommended Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── user/                   # User configurations
│   │   ├── init.lua           # User settings
│   │   ├── options.lua        # Editor options
│   │   ├── keymaps.lua        # Key mappings
│   │   └── utils.lua          # Utility functions
│   └── plugins/               # Plugin configurations
│       ├── completion.lua     # Auto-completion setup
│       ├── lsp.lua           # Language server configuration
│       ├── ui.lua            # User interface plugins
│       ├── git.lua           # Git integration
│       ├── tools.lua         # Development tools
│       └── markdown.lua      # Markdown support
└── lazy-lock.json            # Plugin lock file
```

## 🎯 Essential Plugins

### Package Manager
```lua
-- Lazy.nvim - Modern plugin manager
{
    "folke/lazy.nvim",
    version = "*",
    opts = {
        -- Configuration options
    }
}
```

### Language Support
```lua
-- LSP Configuration
{
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
}

-- Tree-sitter
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
}
```

### Auto-completion
```lua
-- Blink.cmp - Fast completion
{
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
}
```

### Fuzzy Finding
```lua
-- Telescope - Fuzzy finder
{
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
    }
}
```

### Git Integration
```lua
-- Gitsigns - Git signs in gutter
{
    "lewis6991/gitsigns.nvim",
    opts = {}
}

-- Fugitive - Git commands
{
    "tpope/vim-fugitive",
}
```

### UI Enhancements
```lua
-- Lualine - Status line
{
    "nvim-lualine/lualine.nvim",
    opts = {}
}

-- Which-key - Keybinding help
{
    "folke/which-key.nvim",
    opts = {}
}
```

## ⌨️ Keybindings

### Essential Mappings
```lua
-- Leader key
vim.g.mapleader = " "

-- Save and quit
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- File operations
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "File browser" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
```

### LSP Mappings
```lua
-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Find references
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Go to references" })

-- Code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
```

### Git Mappings
```lua
-- Git status
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })

-- Git blame
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })

-- Gitsigns
vim.keymap.set("n", "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
```

## 🎨 Recommended Themes

### Popular Choices
```lua
-- Rose Pine
{
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        vim.cmd("colorscheme rose-pine")
    end
}

-- Tokyo Night
{
    "folke/tokyonight.nvim",
    config = function()
        vim.cmd("colorscheme tokyonight")
    end
}

-- Catppuccin
{
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        vim.cmd("colorscheme catppuccin")
    end
}
```

## 🔧 Advanced Configuration

### LSP Setup
```lua
local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Example for Python
lspconfig.pyright.setup({
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
            },
        },
    },
})

-- Example for Rust
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})
```

### Auto-completion Configuration
```lua
return {
    "saghen/blink.cmp",
    opts = {
        keymap = { preset = "default" },
        signature = { enabled = true },
        completion = {
            documentation = { auto_show = false },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
```

### Treesitter Configuration
```lua
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "json", 
        "lua",
        "markdown",
        "python",
        "rust",
        "typescript",
        "javascript",
    },
    highlight = { enable = true },
    indent = { enable = true },
})
```

## 🚀 Usage Examples

### File Navigation
```vim
" Open file browser
:Oil

" Fuzzy find files
:Telescope find_files

" Live grep
:Telescope live_grep

" Find in current buffer
:Telescope current_buffer_fuzzy_find
```

### LSP Usage
```vim
" Go to definition
gd

" Show hover documentation
K

" Format buffer
<leader>f

" Show code actions
<leader>ca

" Rename symbol
<leader>rn
```

### Git Usage
```vim
" Git status
:Git

" Git blame
:Git blame

" Stage hunk
<leader>ghs

" Reset hunk  
<leader>ghr
```

## 🐛 Troubleshooting

### Common Issues
1. **Plugins not loading**: Check Lazy.nvim configuration
2. **LSP not working**: Verify language servers are installed
3. **Treesitter errors**: Run `:TSUpdate`
4. **Performance issues**: Disable unused plugins

### Debug Commands
```vim
" Check Lazy status
:Lazy

" Check LSP status
:LspInfo

" Check Treesitter status
:TSInstallInfo

" Check health
:checkhealth
```

### Plugin Issues
```vim
" Clean plugins
:Lazy clean

" Update plugins
:Lazy update

" Restore plugins
:Lazy restore
```

## 📝 Tips & Tricks

### Performance
1. **Use lazy loading** for heavy plugins
2. **Disable unused features** in LSP
3. **Limit Telescope sources** for faster searches
4. **Use native plugins** when available

### Productivity
1. **Master Telescope** for file navigation
2. **Use LSP effectively** for code intelligence
3. **Learn Git integration** for version control
4. **Customize keybindings** for your workflow

### Customization
1. **Start simple** and add features gradually
2. **Use plugin presets** for common configurations
3. **Create custom functions** for repetitive tasks
4. **Backup configurations** before major changes

## 🔧 Language-Specific Setup

### Python
```bash
# Install language server
pip install python-lsp-server

# Install debugger
pip install debugpy

# Install formatter
pip install black ruff
```

### Rust
```bash
# Install rust-analyzer
rustup component add rust-analyzer

# Rust tools are included with rustup
```

### JavaScript/TypeScript
```bash
# Install language servers
npm install -g typescript-language-server
npm install -g vscode-langservers-extracted

# Install formatter
npm install -g prettier
```

---

*This configuration has been removed but the documentation provides a comprehensive guide for setting up a modern, powerful Neovim environment.*