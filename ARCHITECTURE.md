# Configuration Architecture

This document provides a deep dive into the internal architecture, data flow, and design patterns used in this Neovim configuration.

## 🏗️ Overview

```mermaid
graph TB
    A[init.lua] --> B[Core Settings]
    A --> C[Plugin Manager]
    A --> D[Autocmds]
    A --> E[Keymaps]

    C --> F[lua/plugins/]
    F --> G[Editor Plugins]
    F --> H[LSP & Completion]
    F --> I[Productivity Tools]
    F --> J[Theme & UI]

    H --> K[nvim-lspconfig]
    H --> L[nvim-cmp]
    K --> L
```

## 🔧 Bootstrapping Process

### 1. Initialization Sequence

The configuration follows a strict initialization order to ensure dependencies are loaded correctly:

```lua
-- init.lua
require("config.config")       -- 1. Set up Neovim environment
require("config.lazy-config")  -- 2. Bootstrap and load plugins
require("config.autocmds")     -- 3. Register automatic commands
require("keymaps.keymaps")     -- 4. Define keybindings
```

### 2. Lazy.nvim Bootstrap

When Neovim starts, the following process occurs:

```mermaid
sequenceDiagram
    participant NV as Neovim
    participant LC as lazy-config.lua
    participant LAZY as lazy.nvim
    participant GIT as Git
    participant PLUGINS as Plugin Directory

    NV->>LC: Load config/lazy-config.lua
    LC->>LAZY: Check if lazy.nvim exists
    alt Plugin not installed
        LC->>GIT: Clone from GitHub
        GIT->>LAZY: Install plugin
    end
    LAZY->>PLUGINS: Scan lua/plugins/ directory
    PLUGINS->>LAZY: Return plugin specs
    LAZY->>NV: Load plugins based on events/commands
```

**Key Points:**
- Lazy.nvim is installed automatically on first run
- Plugins are loaded on-demand (lazy loading) based on:
  - `event` - Triggers on Neovim events (e.g., `BufReadPre`, `InsertEnter`)
  - `cmd` - Triggers when command is called (e.g., `:Telescope`)
  - `keys` - Triggers when keybinding is used
  - `ft` - Filetype-specific loading (not used in this config)

## 📦 Plugin Configuration Pattern

### Standard Plugin Spec

All plugins follow a consistent specification pattern:

```lua
return {
  'author/plugin-name',        -- Plugin repository
  branch = 'stable',           -- Optional: Git branch
  version = '*',               -- Optional: Version constraint
  dependencies = {             -- Required plugins
    'dependency-1',
    'dependency-2',
  },
  event = { 'BufReadPre' },    -- Lazy load trigger
  keys = { '<leader>f' },      -- Keybinding trigger
  cmd = { 'PluginCommand' },   -- Command trigger
  config = function()          -- Configuration callback
    require('plugin').setup({
      -- Plugin options
    })
  end,
}
```

### Dependency Management

Plugins can depend on other plugins. Lazy.nvim ensures correct load order:

```mermaid
graph LR
    A[lualine.nvim] -->|depends on| B[nvim-web-devicons]
    C[nvim-cmp] -->|depends on| D[cmp-nvim-lsp]
    C -->|depends on| E[LuaSnip]
    F[nvim-tree] -->|depends on| B
```

**Example from config:**

```lua
-- lua/plugins/nvim-cmp.lua
dependencies = {
  'hrsh7th/cmp-nvim-lsp',      -- Must load before nvim-cmp
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets'
}
```

## 🌐 LSP Integration

### LSP Configuration Flow

```mermaid
sequenceDiagram
    participant NV as Neovim
    participant LSP as nvim-lspconfig
    participant CMP as nvim-cmp
    participant LSPS as LSP Server (pyright/tsserver)

    NV->>LSP: Load nvim-lspconfig.lua
    LSP->>CMP: Get enhanced capabilities
    CMP->>LSP: Return capabilities (completion, snippet support)
    LSP->>LSP: Register server configurations
    Note over LSP: pyright, tsserver
    NV->>LSP: Open Python file
    LSP->>LSPS: Start LSP server
    LSPS->>LSP: Server ready
    LSP->>NV: Attach LSP to buffer
    NV->>LSP: Request completion
    LSP->>CMP: Provide completion items
    CMP->>NV: Display in UI
```

### Capability Negotiation

LSP servers need to know what the editor supports. The configuration enhances default capabilities:

```lua
-- lua/plugins/nvim-lspconfig.lua

-- 1. Get Neovim's default LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- 2. Extend with nvim-cmp capabilities (adds snippet support)
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- 3. Pass to server configuration
vim.lsp.config("pyright", {
  capabilities = capabilities,  -- Server now knows we support snippets
})
```

### LSP Server Activation

Servers are enabled globally but attach only to relevant buffers:

```lua
-- Enable servers globally
vim.lsp.enable({ "pyright", "tsserver" })

-- Attach happens automatically based on:
-- - File extension (.py → pyright)
-- - Detected filetype
-- - Root directory markers (pyproject.toml, package.json, etc.)
```

## 🔍 Autocomplete System

### nvim-cmp Architecture

```mermaid
graph TB
    A[User Types] --> B[nvim-cmp]
    B --> C[Source 1: LSP]
    B --> D[Source 2: LuaSnip]
    B --> E[Source 3: Buffer]

    C -->|Code symbols| F[Completion Menu]
    D -->|Snippets| F
    E -->|Text in buffer| F

    F --> G[User Selects]
    G --> H[nvim-cmp.confirm]
    H --> I[Insert Text]
    H -->|if snippet| J[Expand Snippet]
    J --> K[LuaSnip.lsp_expand]
```

### Completion Source Configuration

```lua
sources = cmp.config.sources({
  { name = 'nvim_lsp' },  -- Priority 1: LSP completions
  { name = 'luasnip' },    -- Priority 2: Code snippets
}, {
  { name = 'buffer' },     -- Priority 3: Words in current buffer
})
```

### Snippet Engine Integration

The configuration uses **LuaSnip** with VS Code-compatible snippets:

```lua
-- Load VS Code style snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- Use with nvim-cmp
snippet = {
  expand = function(args)
    luasnip.lsp_expand(args.body)  -- Expand snippet placeholders
  end,
}
```

## 🌳 Tree-sitter Integration

### Syntax Highlighting Flow

```mermaid
sequenceDiagram
    participant NV as Neovim
    participant TS as nvim-treesitter
    participant PARSER as Language Parser
    participant HL as Highlighter

    NV->>TS: Load nvim-treesitter
    TS->>PARSER: Check installed parsers
    alt Parser not installed
        TS->>PARSER: Download & compile parser
    end
    NV->>TS: Open file
    TS->>PARSER: Parse file into syntax tree
    PARSER->>TS: Return AST
    TS->>HL: Generate highlight regions
    HL->>NV: Apply highlights
```

### Parser Installation

Parsers are installed automatically on first use:

```lua
-- lua/plugins/nvim-treesitter.lua

ensure_installed = {
  'c', 'lua', 'python', 'javascript', 'typescript'
}

-- Installation happens via:
-- :TSUpdate  or automatically on :TSInstall
```

**Installation Process:**
1. Tree-sitter downloads parser for language
2. Parser is compiled to shared library
3. Neovim loads parser at runtime
4. Files are parsed incrementally for performance

## 🔭 Telescope Integration

### Picker Configuration

```mermaid
graph LR
    A[User invokes Telescope] --> B{Which picker?}
    B -->|find_files| C[File picker]
    B -->|live_grep| D[Grep picker]
    B -->|buffers| E[Buffer picker]
    B -->|help_tags| F[Help picker]

    C --> G[Theme: dropdown]
    D --> G
    E --> H[Default theme]
    F --> H

    G --> I[Search interface]
    I --> J[User selects]
    J --> K[Open file/buffer]
```

### Custom Mappings

The configuration adds custom keybindings for Telescope's insert mode:

```lua
mappings = {
  i = {
    ["<C-j>"] = actions.move_selection_next,      -- Navigate down
    ["<C-k>"] = actions.move_selection_previous,  -- Navigate up
    ["<C-q>"] = function(prompt_bufnr)
      actions.send_selected_to_qflist(prompt_bufnr)
      actions.open_qflist()                       -- Send to quickfix
    end,
  },
}
```

**Why these mappings?**
- `<C-j>/<C-k>`: Consistent with window navigation
- `<C-q>`: Common Vim pattern for quickfix operations

## 🎨 Theme Integration

### Theme Loading Process

```mermaid
sequenceDiagram
    participant INIT as init.lua
    participant THEME as theme.lua
    participant CATPPUCCIN as catppuccin plugin
    participant NV as Neovim

    INIT->>THEME: Load theme.lua
    THEME->>CATPPUCCIN: Load catppuccin plugin
    CATPPUCCIN->>NV: Set up color scheme
    CATPPUCCIN->>NV: Apply mocha flavor
    NV->>THEME: Theme ready
```

### Plugin Priority

```lua
-- lua/plugins/theme.lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,  -- Ensure theme loads before other plugins
  config = function()
    vim.cmd('colorscheme catppuccin-mocha')
  end,
}
```

**Why priority 1000?**
- Ensures theme is available for other plugins that reference highlight groups
- Lualine, Telescope, etc., can inherit theme colors

## ⌨️ Keybinding Architecture

### Keymap Definition Pattern

```lua
-- lua/keymaps/keymaps.lua

local map = vim.keymap.set      -- Neovim 0.7+ API
local opts = { silent = true, noremap = true }

map('n', '<C-h>', '<C-w>h', opts)  -- Normal mode
map('v', '<C-c>', '"+y', opts)    -- Visual mode
map('i', '<C-s>', '<Esc>:w<CR>', opts)  -- Insert mode
```

**Parameters:**
- `silent`: Don't echo command output
- `noremap`: Don't remap again (prevent recursion)

### Keybinding Layers

```mermaid
graph TB
    A[Neovim Default] --> B[Global Keymaps]
    B --> C[Plugin Keymaps]
    C --> D[LSP Keymaps]
    D --> E[Filetype-specific]

    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#bfb,stroke:#333
    style D fill:#fbb,stroke:#333
```

### Keybinding Resolution Order

When a key is pressed, Neovim checks in this order:
1. **LSP keymaps** (buffer-local)
2. **Plugin keymaps** (buffer-local or global)
3. **Global keymaps** (lua/keymaps/)
4. **Vim default keymaps**

**Example: `<leader>e`**
- Defined in `nvim-tree.lua`: `{ '<leader>e', ':NvimTreeToggle<CR>' }`
- Lazy-nvim creates the mapping when `<leader>e` is pressed
- Plugin is loaded on-demand
- Command executes

## 🔄 Autocommand System

### Autocommand Architecture

```mermaid
graph TB
    A[Neovim Event] --> B[autocmds.lua]
    B --> C{Which event?}

    C -->|TextYankPost| D[Highlight yanked text]
    C -->|BufWritePre| E[Remove trailing whitespace]
    C -->|FocusGained/BufEnter| F[Check file changes]

    D --> G[vim.highlight.on_yank]
    E --> H[sed command]
    F --> I[checktime]
```

### Autocommand Implementation

```lua
-- lua/config/autocmds.lua

-- 1. TextYankPost - Highlight when yanking (copying)
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

-- 2. BufWritePre - Clean up before saving
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',              -- All file types
  command = [[%s/\s\+$//e]],  -- Remove trailing spaces
})

-- 3. FocusGained/BufEnter - Reload changed files
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  command = 'checktime',      -- Check for external changes
})
```

## 📊 Performance Optimization

### Lazy Loading Strategy

```mermaid
graph TB
    A[Plugin Load Triggers]

    A --> B[event based]
    B --> B1[BufReadPre - File opened]
    B --> B2[InsertEnter - Enter insert mode]
    B --> B3[VeryLazy - After startup]

    A --> C[command based]
    C --> C1[cmd='Telescope']
    C --> C2[cmd='NvimTreeToggle']

    A --> D[key based]
    D --> D1[keys='<leader>e']
    D --> D2[keys='<leader>ff']

    B1 -->|Load on-demand| E[Plugin Loaded]
    B2 -->|Load on-demand| E
    B3 -->|Load on-demand| E
    C1 -->|Load on-demand| E
    C2 -->|Load on-demand| E
    D1 -->|Load on-demand| E
    D2 -->|Load on-demand| E
```

### Load Triggers by Plugin

| Plugin | Trigger Type | Event/Command |
|--------|--------------|---------------|
| nvim-lspconfig | event | `BufReadPre`, `BufNewFile` |
| nvim-treesitter | event | `BufReadPost`, `BufNewFile` |
| gitsigns | event | `BufReadPre`, `BufNewFile` |
| nvim-tree | cmd/keys | `NvimTreeToggle`, `<leader>e` |
| telescope | cmd/keys | `Telescope`, `<leader>f*` |
| nvim-autopairs | event | `InsertEnter` |
| nvim-cmp | event | `InsertEnter` |
| lualine | event | `VeryLazy` |
| wakatime | lazy=false | Immediate load |
| catppuccin | priority=1000 | Load first |

## 🔧 Extension Points

### Adding a New Plugin

**Step 1**: Create plugin spec file
```bash
touch lua/plugins/my-plugin.lua
```

**Step 2**: Write configuration
```lua
return {
  'author/my-plugin',
  event = 'BufReadPre',  -- Choose appropriate trigger
  config = function()
    require('my-plugin').setup({
      -- Plugin options
    })
  end,
}
```

**Step 3**: Add keybindings (optional)
```lua
keys = {
  { '<leader>m', ':MyPluginCommand<CR>', desc = 'Run my plugin' },
},
```

### Adding a New Language Server

Edit `lua/plugins/nvim-lspconfig.lua`:

```lua
-- Add server configuration
vim.lsp.config("rust-analyzer", {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
})

-- Enable the server
vim.lsp.enable({ "pyright", "tsserver", "rust-analyzer" })
```

### Customizing the Theme

Create a custom theme by extending Catppuccin:

```lua
-- lua/plugins/theme.lua
return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#1e1e2e",  -- Custom background
          mantle = "#181825",
        },
      },
      integrations = {
        telescope = true,
        nvimtree = true,
      },
    })
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}
```

## 🐛 Debugging Architecture

### Enabling Debug Logs

```vim
" Enable verbose logging
:lua vim.lsp.set_log_level("debug")

" Open log file
:lua vim.cmd('e' .. vim.lsp.get_log_path())

" Check loaded plugins
:Lazy

" Check LSP status
:LspInfo

" Check Tree-sitter parsers
:TSModuleInfo
```

### Tracing Plugin Loading

```vim
" Profile startup time
nvim --startuptime startup.log

" Profile lazy.nvim
:Lazy profile

" Trace autocmds
:autocmd verbose
```

## 📈 Configuration Data Flow

```mermaid
graph LR
    A[User Action] --> B[Neovim]
    B --> C[Keymap Check]
    C -->|Mapped| D[Execute Command]
    C -->|Not mapped| E[Default Behavior]

    D --> F[Command triggers]
    F -->|Plugin command| G[Load Plugin]
    G --> H[Execute Plugin Function]

    H --> I[Side Effects]
    I --> J[UI Updates]
    I --> K[Buffer Changes]
    I --> L[LSP Server Calls]
```

## 🎯 Design Principles

1. **Lazy Loading**: Plugins load only when needed for fast startup
2. **Modular Structure**: Each plugin in separate file for maintainability
3. **Event-Driven**: Configuration responds to Neovim events, not hardcoded states
4. **Non-Intrusive**: Plugins respect Vim defaults unless explicitly overridden
5. **Declarative**: Plugin specs declare intent, not implementation details
6. **Type-Safe**: Lua provides better tooling compared to Vimscript

## 📚 Further Reading

- [Neovim Lua Development](https://neovim.io/doc/user/lua.html)
- [lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig Configuration](https://github.com/neovim/nvim-lspconfig)
- [Tree-sitter Internals](https://tree-sitter.github.io/tree-sitter/)
- [Neovim Autocommands](https://neovim.io/doc/user/autocmd.html)

---

*Last Updated: January 2026*
