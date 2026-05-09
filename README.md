# Neovim Configuration

Modern, lazy-loaded Neovim setup tuned for TypeScript / React Native / Expo,
Lua, and Python work. Built on **Neovim 0.11+** with **lazy.nvim** as the
plugin manager.

## Prerequisites

- **Neovim ≥ 0.11** (config uses `vim.lsp.config` / `vim.lsp.enable` /
  `vim.diagnostic.jump`, all 0.11 APIs).
- A **Nerd Font** for icons (e.g. JetBrainsMono Nerd Font).
- `git`, `node` (≥ 18), `python3`, `ripgrep`, `fd` on `$PATH`.
- macOS / Linux. The config is developed on macOS (Darwin) but should work on
  Linux with no changes.

LSP servers, formatters, linters and DAP adapters are auto-installed on first
launch via Mason — no manual `npm i -g` / `pip install` needed.

## Install

```bash
# Back up an existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

git clone <this-repo> ~/.config/nvim
nvim    # lazy.nvim bootstraps; Mason installs the toolchain on first run.
```

## Layout

```
~/.config/nvim
├── init.lua                 # Entrypoint — sets leader, vim.loader, dispatches modules
├── lazy-lock.json           # Pinned plugin versions
└── lua/
    ├── config/
    │   ├── config.lua       # vim.opt + diagnostics core config
    │   ├── lazy-config.lua  # lazy.nvim bootstrap
    │   └── autocmds.lua     # yank-highlight, big-file guard, trim trailing ws
    ├── keymaps/
    │   └── keymaps.lua      # Non-plugin keymaps (window nav, buffer nav, resize)
    └── plugins/             # One file per plugin spec — auto-loaded by lazy
```

## Plugin set

### UI

| Plugin | Role |
|---|---|
| `catppuccin/nvim` | Default theme (Mocha). Tokyonight, Kanagawa, Rose Pine lazy-loaded as alternates |
| `nvim-lualine/lualine.nvim` | Statusline |
| `akinsho/bufferline.nvim` | Buffer tabs |
| `b0o/incline.nvim` | Floating per-window filename label |
| `Bekaboo/dropbar.nvim` | Symbol breadcrumb winbar |
| `mawkler/modicator.nvim` | Mode-colored line numbers |
| `goolord/alpha-nvim` | Startup dashboard |
| `folke/which-key.nvim` | Live keymap hints |
| `folke/noice.nvim` | Cmdline + messages UI |
| `folke/tiny-inline-diagnostic.nvim` | Inline LSP diagnostic display |
| `MeanderingProgrammer/render-markdown.nvim` | In-buffer markdown rendering |
| `lukas-reineke/colorizer.nvim` (catgoose fork) | Color preview |
| `HiPhish/rainbow-delimiters.nvim` | Bracket pair coloring |
| `karb94/neoscroll.nvim` | Smooth scroll |

### Navigation & search

| Plugin | Role |
|---|---|
| `ibhagwan/fzf-lua` | Fuzzy finder (replaces telescope) |
| `nvim-neo-tree/neo-tree.nvim` | File explorer |
| `ThePrimeagen/harpoon` (v2) | Pin/jump 4 files (`<leader>m*` and `<leader>1..4`) |
| `folke/flash.nvim` | s/S motion + remote ops |
| `folke/todo-comments.nvim` | TODO highlighting |

### Code intelligence

| Plugin | Role |
|---|---|
| `neovim/nvim-lspconfig` + `mason-org/mason*` | LSP via 0.11 native API |
| `hrsh7th/nvim-cmp` + LuaSnip + lspkind | Completion |
| `nvim-treesitter/nvim-treesitter` (master branch) | Syntax/indent + textobjects |
| `folke/lazydev.nvim` | Faster lua_ls + nvim API completion |
| `stevearc/conform.nvim` | Formatting (biome / ruff / stylua) |
| `mfussenegger/nvim-lint` | Linting |
| `windwp/nvim-autopairs` | Auto-close, integrates with cmp |
| `windwp/nvim-ts-autotag` | JSX/TSX/HTML tag autoclose & rename |
| `kylechui/nvim-surround` | Add/change/delete surrounds |
| `numToStr/Comment.nvim` + `JoosepAlviste/nvim-ts-context-commentstring` | Smart comment |
| `Wansmer/treesj` | Join / split (`<leader>j*`) |
| `mawkler/modicator.nvim` | Mode-aware line number coloring |
| `stevearc/aerial.nvim` | Symbol outline |
| `kevinhwang91/nvim-ufo` | Folding (LSP-aware) |
| `nvim-treesitter/nvim-treesitter-context` | Sticky context lines |
| `ThePrimeagen/refactoring.nvim` | Refactoring helpers |
| `smjonas/inc-rename.nvim` | Live preview rename |

### Git

| Plugin | Role |
|---|---|
| `lewis6991/gitsigns.nvim` | Hunks (`<leader>h*`) |
| `kdheepak/lazygit.nvim` | LazyGit panel |
| `sindrets/diffview.nvim` | Diff/merge view |
| `linrongbin16/gitlinker.nvim` | Yank/open permalinks |

### Tasks, tests, debug

| Plugin | Role |
|---|---|
| `mfussenegger/nvim-dap` (+ ui + virtual-text) | Debug Adapter Protocol |
| `nvim-neotest/neotest` (+ jest adapter) | Test runner (`<leader>T*`) |
| `stevearc/overseer.nvim` | Run npm scripts (`<leader>o*`) |
| `vuki656/package-info.nvim` | Inline npm version info on `package.json` |
| `akinsho/toggleterm.nvim` | Floating terminal (`<C-\>`) |

### AI

| Plugin | Role |
|---|---|
| `zbirenbaum/copilot.lua` | GitHub Copilot inline ghost text |
| `folke/sidekick.nvim` | Hub for Claude Code / Codex / OpenCode / Copilot CLI + Copilot Next-Edit Suggestions |
| `olimorris/codecompanion.nvim` | Chat panel + inline edits + 7-prompt slash-command library (`<leader>n*`) |

### Misc

| Plugin | Role |
|---|---|
| `wakatime/vim-wakatime` | Time tracking |
| `olimorris/persisted.nvim` | Session save/load |
| `ahmedkhalf/project.nvim` | Project root detection |
| `mg979/vim-visual-multi` | Multi-cursor |
| `nvim-pack/nvim-spectre` | Project-wide find/replace |
| `folke/trouble.nvim` | Diagnostics list |
| `zeioth/garbage-day.nvim` | Idle-LSP shutdown |

## Keymaps

`<leader>` is **Space**.

### Non-plugin (`lua/keymaps/keymaps.lua`)

| Keys | Action |
|---|---|
| `<C-h/j/k/l>` | Window navigation |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<C-Up/Down/Left/Right>` | Resize window |
| `<leader>/` | Clear search highlight |
| `p` (visual) | Paste without yanking selection |

### Leader groups

| Prefix | Group |
|---|---|
| `<leader>a` | AI: Sidekick (Claude / Codex / OpenCode / Copilot CLI) |
| `<leader>b` | Buffers (`bd`/`bD` delete via mini.bufremove) |
| `<leader>d` | Debug (DAP) |
| `<leader>f` | Find / files (fzf-lua) |
| `<leader>g` | Git (lazygit, diffview, gitlinker) |
| `<leader>h` | Hunks (gitsigns) |
| `<leader>j` | Join / split (treesj) |
| `<leader>l` | LSP / Lint / Format (`la` code action, `lf` format, `le` line diag) |
| `<leader>m` | Marks (Harpoon) |
| `<leader>n` | AI Companion (CodeCompanion) / Noice |
| `<leader>o` | Overseer (npm scripts) |
| `<leader>p` | package.json info |
| `<leader>r` | Refactor / rename |
| `<leader>s` | Search / Sessions / Spectre |
| `<leader>T` | Tests (neotest / Jest) |
| `<leader>u` | UI toggles |
| `<leader>v` | Multi-cursor (vim-visual-multi: `<C-n>`, `<M-↑/↓>`) |
| `<leader>x` | Trouble / diagnostics |
| `<leader>1..4` | Harpoon slot select |

LSP buffer-local maps (set on `LspAttach`): `gd`, `gD`, `gr`, `gi`, `gy`,
`K`, insert-mode `<C-k>` for signature help, `[d` / `]d` (uses
`vim.diagnostic.jump`), `<leader>rN`, `<leader>la`, `<leader>le`.

## Notes & defaults

- `vim.loader.enable()` is on (Lua bytecode cache).
- 13 unused vim built-ins are disabled in `init.lua`.
- Files ≥ 2 MiB switch to a "big file" mode (no swap/undo, syntax off,
  TS highlight disabled) — see `lua/config/autocmds.lua`.
- LSP servers attach via the 0.11 native API; mason-lspconfig's
  `automatic_enable` is **false** to prevent double-attach via the legacy
  framework.
- Diagnostics: virtual_text is rendered by `tiny-inline-diagnostic.nvim`,
  not by core. Signs use Nerd Font glyphs.
- Folding is LSP-aware via `nvim-ufo` (`foldlevel=99` so files open expanded).

## Updating

```vim
:Lazy update     " update plugins
:Lazy sync       " update + clean
:Mason           " manage LSP / DAP / formatter binaries
:checkhealth     " diagnose toolchain issues
```

## Troubleshooting

- **LSP not attaching** → `:LspInfo`, then `:Mason` to verify install.
- **Slow startup** → `:Lazy profile` shows per-plugin load time.
- **Treesitter parse errors** → `:TSUpdate`.
- **Which-key not showing a group** → confirm a plugin actually binds keys
  under that prefix; group labels in `which-key.lua` are advisory only.
