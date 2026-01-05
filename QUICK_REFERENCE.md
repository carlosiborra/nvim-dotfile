# Quick Reference Guide

A cheat sheet for the most commonly used keybindings and commands in this Neovim configuration.

**Tip:** Print this or keep it open while learning the configuration!

---

## 🚀 Essential Commands

| Command | Action |
|---------|--------|
| `<Space>` | Leader key - used for all custom commands |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:e filename` | Open file |
| `:bd` | Close buffer |

---

## 📁 File Navigation

### File Explorer
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer (NvimTree) |
| `o` | Open file/folder |
| `a` | Create new file/folder |
| `d` | Delete file/folder |
| `r` | Rename file/folder |
| `s` | Open file in horizontal split |
| `v` | Open file in vertical split |
| `u` | Go up one directory |

### File Search (Telescope)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files in project |
| `<leader>fg` | Search text in files (live grep) |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Search help tags |

### Telescope Navigation
| Key | Action |
|-----|--------|
| `<C-j>` | Move selection down |
| `<C-k>` | Move selection up |
| `<Enter>` | Open selected item |
| `<C-q>` | Send to quickfix list |
| `<Esc>` | Close telescope |

---

## 🪟 Window Management

| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-l>` | Move to right window |
| `<C-w>s` | Split window horizontally |
| `<C-w>v` | Split window vertically |
| `<C-w>c` | Close current window |
| `<C-w>o` | Close all other windows |

---

## ✏️ Editing

### Basic Movement
| Key | Action |
|-----|--------|
| `h`, `j`, `k`, `l` | Move left, down, up, right |
| `w` / `b` | Move forward/backward by word |
| `0` / `$` | Go to start/end of line |
| `gg` / `G` | Go to start/end of file |
| `}` / `{` | Go to next/previous paragraph |

### Editing Commands
| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Append after cursor |
| `o` | New line below |
| `O` | New line above |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `<C-r>` | Redo |
| `.` | Repeat last command |

### Auto-Pairs
When you type an opening bracket, quote, or parenthesis, the closing one is automatically added.

### Commenting
| Key | Action |
|-----|--------|
| `<C-/>` | Toggle line comment (Normal/Visual) |
| `<C-M-/>` | Toggle block comment (Normal/Visual) |

**Usage:**
- Normal mode: Comments current line
- Visual mode: Comments selected lines

---

## 🔍 Code Intelligence (LSP)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `K` | Show hover documentation |
| `<leader>rn` | Rename symbol (requires keybinding setup) |
| `<leader>ca` | Code actions (requires keybinding setup) |

### Autocomplete (nvim-cmp)
| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion |
| `<C-n>` | Select next item |
| `<C-p>` | Select previous item |
| `<Enter>` | Confirm selection |
| `<C-e>` | Close completion menu |
| `<C-b>` / `<C-f>` | Scroll documentation up/down |

---

## 🔎 Search & Replace

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |
| `#` | Search word under cursor (backward) |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |

---

## 📑 Buffers

| Key | Action |
|-----|--------|
| `<leader>fb` | Find buffers (Telescope) |
| `:bnext` | Next buffer |
| `:bprevious` | Previous buffer |
| `:b#` | Alternate buffer |

---

## 🌳 Git Integration (Gitsigns)

**Visual Indicators in Sign Column:**
- `~` - Line modified
- `+` - Line added
- `-` - Line removed

### Common Git Commands (Terminal)
| Command | Action |
|----------|--------|
| `:Git` | Run git commands (Fugitive, not installed) |
| `:Git status` | Check git status |
| `:Git diff` | Show diff |
| `:Git commit` | Commit changes |

---

## 🎨 Theme

| Command | Action |
|---------|--------|
| `:colorscheme catppuccin-latte` | Switch to light theme |
| `:colorscheme catppuccin-frappe` | Switch to dark theme (lighter) |
| `:colorscheme catppuccin-macchiato` | Switch to dark theme (medium) |
| `:colorscheme catppuccin-mocha` | Switch to dark theme (darker) |

---

## 🔧 Plugin Management (Lazy.nvim)

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager UI |
| `:Lazy sync` | Sync plugins (install, update, clean) |
| `:Lazy update` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy log` | View plugin logs |

---

## 📝 Tree-sitter Commands

| Command | Action |
|---------|--------|
| `:TSUpdate` | Update all parsers |
| `:TSInstall <language>` | Install language parser |
| `:TSUninstall <language>` | Uninstall language parser |
| `:TSModuleInfo` | View installed modules |

---

## 🤖 GitHub Copilot

| Command | Action |
|---------|--------|
| `:Copilot panel` | Open suggestions panel |
| `:Copilot status` | Check Copilot status |
| `:Copilot enable` | Enable Copilot |
| `:Copilot disable` | Disable Copilot |

### Inline Suggestions
| Key | Action |
|-----|--------|
| `<Tab>` | Accept suggestion |
| `<C-]>` | Dismiss suggestion |
| `<C-]>` | Next suggestion |
| `<C-[>` | Previous suggestion |

---

## 👁️ Visual Mode

| Key | Action |
|-----|--------|
| `v` | Enter visual mode (character) |
| `V` | Enter visual mode (line) |
| `<C-v>` | Enter visual block mode |
| `o` | Move to other end of selection |
| `aw` | Select a word |
| `ab` | Select a block with () |
| `aB` | Select a block with {} |
| `> / <` | Indent/unindent selection |

---

## 🔮 Multi-Cursor (vim-visual-multi)

| Key | Action |
|-----|--------|
| `<C-n>` | Add cursor to next word occurrence |
| `<C-x>` | Skip current occurrence |
| `<C-p>` | Remove last cursor |
| `ESC` | Exit multi-cursor mode |

**Workflow:**
1. Place cursor on word
2. Press `<C-n>` to add cursor to next occurrence
3. Keep pressing `<C-n>` for more occurrences
4. Edit text to change all occurrences simultaneously

---

## 📊 Diagnostics

| Key | Action |
|-----|--------|
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `[e` | Go to previous error |
| `]e` | Go to next error |

---

## 🎯 Quick Tips

### Faster Navigation
- Use `%` to jump between matching brackets, parentheses, etc.
- Use `f{char}` to jump to next `{char}` in line
- Use `t{char}` to jump till before `{char}` in line

### Efficient Editing
- Use `ciw` to change inner word
- Use `ci"` to change text in quotes
- Use `ci(` to change text in parentheses
- Use `cit` to change entire HTML/XML tag

### Search & Replace
- Use `*` to quickly search for word under cursor
- Use `:%s/<C-r>//g` to replace with content from register (paste in search)

### Macros
- `qa` - Start recording macro to register `a`
- `q` - Stop recording
- `@a` - Replay macro `a`
- `10@a` - Replay macro `a` 10 times

---

## 🚑 Troubleshooting

| Problem | Solution |
|---------|----------|
| Plugin not working | Run `:Lazy` and check status |
| LSP not attaching | Run `:LspInfo` |
| Syntax highlighting broken | Run `:TSUpdate` |
| Slow startup | Run `nvim --startuptime startup.log` |
| Keybinding not working | Check `:verbose map <key>` |

---

## 📚 Help Commands

| Command | Action |
|---------|--------|
| `:help` | Open Neovim help |
| `:help topic` | Get help on specific topic |
| `:helpgrep keyword` | Search help files |
| `:help <key>` | Find help for keybinding |
| `:K` | Show documentation for word under cursor |

---

## ⌨️ Mode Reference

| Mode | Name | Description |
|------|------|-------------|
| `n` | Normal | Navigation, commands |
| `i` | Insert | Inserting text |
| `v` | Visual | Character-wise selection |
| `V` | Visual Line | Line-wise selection |
| `c` | Command | Command-line mode |
| `t` | Terminal | Terminal mode |
| `o` | Operator-pending | Waiting for motion |

---

## 🎓 Learning Resources

1. **`:vimtutor`** - Interactive Vim tutorial
2. **`:help user-manual`** - Comprehensive manual
3. **`:help pattern`** - Search patterns
4. **`:help usr_02.txt`** - First steps in Vim

---

**Memorize the basics first, then learn advanced features gradually!**
