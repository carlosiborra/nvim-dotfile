# Neovim Configuration

A clean, performant Neovim configuration focused on productivity and modern development workflows. Built on Neovim 0.9+ with lazy.nvim plugin manager.

## 📋 Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Plugin Overview](#plugin-overview)
- [Keybindings](#keybindings)
- [Configuration Structure](#configuration-structure)
- [Language Support](#language-support)
- [Custom Behaviors](#custom-behaviors)

---

## ✨ Features

- **Modern Plugin Management**: Fast, lazy-loading with [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Intelligent Code Completion**: LSP-powered autocomplete with snippets
- **Fuzzy Finding**: Super-fast file search and grep with Telescope
- **Git Integration**: Real-time git status in the editor
- **Syntax Highlighting**: Tree-sitter powered syntax highlighting
- **Productivity Boosters**: Multi-cursor editing, auto-pairs, smart commenting
- **Beautiful UI**: Catppuccin theme with clean status line
- **Coding Assistant**: GitHub Copilot integration
- **Time Tracking**: WakaTime for coding analytics

---

## 📦 Prerequisites

- **Neovim** >= 0.9.0
  ```bash
  # macOS (Homebrew)
  brew install neovim

  # Linux (Ubuntu/Debian)
  sudo apt install neovim
  ```
- **Node.js** (for some LSP servers, optional but recommended)
  ```bash
  brew install node  # macOS
  ```
- **Python** and **pip** (for Python LSP)
- **Git**

---

## 🚀 Installation

1. **Backup your existing config** (if you have one):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Launch Neovim** - lazy.nvim will automatically install all plugins:
   ```bash
   nvim
   ```

4. **Install Language Servers** (optional, recommended for full LSP features):

   For Python:
   ```bash
   pip install pyright
   ```

   For TypeScript/JavaScript:
   ```bash
   npm install -g typescript typescript-language-server
   ```

5. **Install Tree-sitter parsers** (automatic on first run):
   ```vim
   :TSUpdate
   ```

---

## 🔌 Plugin Overview

### Editor Experience

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| **catppuccin** | Color scheme | Beautiful dark theme, multiple variants |
| **lualine.nvim** | Status line | File info, git branch, location |
| **nvim-tree.lua** | File explorer | Sidebar file browser, git status icons |
| **gitsigns.nvim** | Git diff | Blame lines, stage hunks, preview changes |

### Code Intelligence

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| **nvim-lspconfig** | LSP support | Code completion, diagnostics, hover docs |
| **nvim-cmp** | Autocomplete | LSP, snippet, and buffer completions |
| **nvim-treesitter** | Syntax parsing | Enhanced highlighting and indentation |
| **LuaSnip** | Snippets | VS Code-style snippet engine |
| **friendly-snippets** | Snippet collection | Rich snippet library for many languages |

### Productivity

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| **telescope.nvim** | Fuzzy finder | Search files, grep, buffers, help tags |
| **nvim-autopairs** | Auto brackets | Auto-close pairs (), [], {}, "", '' |
| **Comment.nvim** | Commenting | Smart line and block comments |
| **vim-visual-multi** | Multi-cursor | Multiple cursors editing |
| **copilot.vim** | AI assistant | GitHub Copilot suggestions |

### Utilities

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| **wakatime/vim-wakatime** | Time tracking | Automatic coding time metrics |
| **nvim-web-devicons** | Icons | File type icons in various plugins |

---

## ⌨️ Keybindings

### Leader Key
- **Space** (` `) is set as the leader key
- Replaces the default backslash (`\`)

### File Navigation

| Keybinding | Action | Mode |
|------------|--------|------|
| `<leader>e` | Toggle file explorer | Normal |
| `<leader>ff` | Find files | Normal |
| `<leader>fg` | Live grep (search content) | Normal |
| `<leader>fb` | Find open buffers | Normal |
| `<leader>fh` | Find help tags | Normal |

### Window/Buffer Navigation

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-h>` | Move to left window | Normal |
| `<C-j>` | Move to lower window | Normal |
| `<C-k>` | Move to upper window | Normal |
| `<C-l>` | Move to right window | Normal |

### Code Editing

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-/>` | Toggle line comment | Normal/Visual |
| `<C-M-/>` | Toggle block comment | Normal/Visual |

### Autocomplete Menu

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-Space>` | Trigger completion | Insert |
| `<C-e>` | Close completion menu | Insert |
| `<CR>` (Enter) | Confirm selection | Insert |
| `<C-b>` | Scroll documentation up | Insert |
| `<C-f>` | Scroll documentation down | Insert |

### Telescope Mappings (Inside Telescope)

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-j>` | Move to next item | Insert |
| `<C-k>` | Move to previous item | Insert |
| `<C-q>` | Send to quickfix list | Insert |

### Multi-Cursor (vim-visual-multi)

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-n>` | Add cursor to word below | Normal/Visual |
| `<C-x>` | Skip cursor | Normal/Visual |
| `<C-p>` | Select previous cursor | Normal |

*Note: vim-visual-multi has many more mappings. See `:help vim-visual-multi` for full documentation.*

---

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lazy-lock.json              # Plugin versions lockfile
│
├── lua/
│   ├── config/                 # Core configuration
│   │   ├── config.lua          # General Neovim settings
│   │   ├── autocmds.lua        # Automatic commands
│   │   └── lazy-config.lua     # Plugin manager setup
│   │
│   ├── keymaps/                # Keybindings
│   │   └── keymaps.lua         # Custom keybindings
│   │
│   └── plugins/                # Plugin configurations
│       ├── comment.lua         # Comment.nvim
│       ├── copilot.lua         # GitHub Copilot
│       ├── gitsigns.lua        # Git integration
│       ├── lualine.lua         # Status line
│       ├── nvim-autopairs.lua  # Auto bracket pairing
│       ├── nvim-cmp.lua        # Autocomplete
│       ├── nvim-lspconfig.lua  # LSP servers
│       ├── nvim-tree.lua       # File explorer
│       ├── nvim-treesitter.lua # Syntax highlighting
│       ├── telescope.lua       # Fuzzy finder
│       ├── theme.lua           # Color scheme
│       ├── vim-visual-multi.lua # Multi-cursor editing
│       └── wakatime.lua        # Time tracking
```

### File Descriptions

#### `init.lua`
Main configuration entry point that loads all modules in order:
1. Core settings (`config.config`)
2. Plugin manager (`config.lazy-config`)
3. Autocommands (`config.autocmds`)
4. Keybindings (`keymaps.keymaps`)

#### `lua/config/config.lua`
Core Neovim settings including:
- Line numbers
- Indentation (4 spaces)
- Smart case searching
- Mouse support
- System clipboard integration
- Sign column for git markers

#### `lua/config/autocmds.lua`
Automatic behaviors:
- **Highlight yanked text**: Briefly highlights text when copying
- **Trim whitespace**: Removes trailing whitespace on save
- **Auto-reload**: Reloads file when changed externally

#### `lua/config/lazy-config.lua`
Plugin manager setup:
- Bootsrap lazy.nvim if not installed
- Loads all plugins from `lua/plugins/` directory

---

## 🌐 Language Support

### Configured Language Servers

The following LSP servers are configured and will be automatically attached when opening supported file types:

#### Python
- **Server**: `pyright`
- **Features**: Type checking, completion, hover, diagnostics
- **Install**: `pip install pyright`

#### TypeScript/JavaScript
- **Server**: `tsserver`
- **Features**: Type checking, completion, refactoring, diagnostics
- **Install**: `npm install -g typescript typescript-language-server`

### Supported Languages (Tree-sitter)

Syntax highlighting and indentation are enabled for:
- **C**
- **Lua**
- **Python**
- **JavaScript**
- **TypeScript**

To add more languages, edit `lua/plugins/nvim-treesitter.lua`:

```lua
ensure_installed = {
  'c', 'lua', 'python', 'javascript', 'typescript',
  'rust', 'go', 'html', 'css', 'json'  -- Add more here
}
```

### Adding New LSP Servers

To add a new language server, edit `lua/plugins/nvim-lspconfig.lua`:

```lua
vim.lsp.config("your-language-server", {
  capabilities = capabilities,
})

vim.lsp.enable({ "pyright", "tsserver", "your-language-server" })
```

---

## 🛠️ Custom Behaviors

### Editor Settings

| Setting | Value | Description |
|---------|-------|-------------|
| Line Numbers | `true` | Always show line numbers |
| Relative Numbers | `false` | (commented out) Disabled by default |
| Line Wrap | `false` | Disable line wrapping |
| Tab Size | 4 | 4 spaces per tab |
| Expand Tabs | `true` | Use spaces instead of tabs |
| Cursor Line | `true` | Highlight current line |
| 24-bit Colors | `true` | Enable RGB color support |
| Mouse Support | `a` | Enable all mouse features |
| Clipboard | `unnamedplus` | Use system clipboard |
| Search Case | `ignorecase` + `smartcase` | Smart case-insensitive search |
| Sign Column | `yes` | Always show git markers column |

### Automatic Commands

#### 1. Highlight on Yank
When you copy text (yank), it will briefly flash to confirm the action.

#### 2. Trim Trailing Whitespace
Automatically removes trailing whitespace from all lines before saving any file.

#### 3. Auto Reload File
If a file changes outside Neovim (e.g., by another program), Neovim will automatically reload it when you focus the window.

---

## 🎨 Theme

**Current Theme**: Catppuccin Mocha

To switch themes, edit `lua/plugins/theme.lua`:

```lua
-- Available Catppuccin flavors:
vim.cmd('colorscheme catppuccin-latte')   -- Light
vim.cmd('colorscheme catppuccin-frappe')  -- Dark (lighter)
vim.cmd('colorscheme catppuccin-macchiato') -- Dark (medium)
vim.cmd('colorscheme catppuccin-mocha')   -- Dark (darker) - current
```

To use a different theme entirely, replace the plugin specification in `lua/plugins/theme.lua`.

---

## 💡 Tips & Tricks

### Working with LSP

1. **Hover Documentation**: Place cursor on a symbol and press `K` (vim default)
2. **Go to Definition**: `gd` (vim default)
3. **Go to References**: `gr` (vim default)
4. **Code Actions**: `<leader>ca` (requires setting up, not currently mapped)
5. **List Diagnostics**: `:Telescope diagnostics` (requires setup)

### File Operations

1. **Create new file**: Use Telescope (`<leader>ff`) and type a new filename
2. **Save file**: `:w` or `<leader>w` (standard vim)
3. **Close buffer**: `:bd` or `<leader>q` (standard vim)
4. **Switch buffers**: `:b` followed by buffer number

### Git Workflow

1. **View git status**: Gitsigns shows diff indicators in the sign column
   - `~` - Modified line
   - `+` - Added line
   - `-` - Removed line
2. **Stage hunk**: `<leader>hs` (requires gitsigns keymaps, not currently set)
3. **Reset hunk**: `<leader>hr` (requires gitsigns keymaps, not currently set)
4. **Preview hunk**: `<leader>hp` (requires gitsigns keymaps, not currently set)

### Telescope Power-User Tips

1. **Search in specific directory**: `:Telescope find_files cwd=/path/to/dir`
2. **Search git files only**: `:Telescope git_files`
3. **Search recently used files**: `:Telescope oldfiles`
4. **Resume last search**: `:Telescope resume`

---

## 🔄 Updating Plugins

Update all plugins:
```vim
:Lazy update
```

Check for plugin updates:
```vim
:Lazy sync
```

Clean unused plugins:
```vim
:Lazy clean
```

---

## 🐛 Troubleshooting

### Plugin Not Working
1. Check if plugin is loaded: `:Lazy`
2. Read plugin logs: `:Lazy log`
3. Try reinstalling: `:Lazy clean` then `:Lazy sync`

### LSP Not Attaching
1. Check installed language servers: `:LspInfo`
2. Verify language server is installed: `which pyright`
3. Check LSP logs: `:lua vim.cmd('e' .. vim.lsp.get_log_path())`

### Tree-sitter Issues
1. Update parsers: `:TSUpdate`
2. Check installed parsers: `:TSInstallInfo`
3. Reinstall language: `:TSUninstall <language>` then `:TSInstall <language>`

### Performance Issues
1. Check startup time: `nvim --startuptime startup.log`
2. Review lazy-loaded plugins: `:Lazy profile`
3. Disable unused plugins temporarily

---

## 📚 Resources & Documentation

- **Neovim Docs**: `:help` or [neovim.io](https://neovim.io/doc/)
- **Lazy.nvim**: [GitHub Repository](https://github.com/folke/lazy.nvim)
- **Telescope**: [GitHub Repository](https://github.com/nvim-telescope/telescope.nvim)
- **Tree-sitter**: [GitHub Repository](https://github.com/nvim-treesitter/nvim-treesitter)
- **LSP Configuration**: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

---

## 📝 License

This configuration is provided as-is for personal and educational use.

---

## 🤝 Contributing

Feel free to fork, customize, and improve this configuration for your own workflow!

---

**Happy Coding! 🎉**
