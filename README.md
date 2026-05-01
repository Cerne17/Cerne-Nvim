# mcerne/neovim

Personal Neovim configuration built on [LazyVim](https://lazyvim.github.io) v8 and [lazy.nvim](https://github.com/folke/lazy.nvim).

---

## Features

### Editor
- **Completion** — [blink.cmp](https://github.com/saghen/blink.cmp) with ghost text, signature help, and auto-show documentation
- **Syntax highlighting** — [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) with text objects and incremental selection
- **Scroll centering** — `<C-d>` / `<C-u>` keep the cursor centered after scrolling

### Navigation
- **Fuzzy finder** — [Telescope](https://github.com/nvim-telescope/telescope.nvim) with fzf-native for files, grep, buffers, diagnostics, and keymaps
- **File explorer** — [oil.nvim](https://github.com/stevearc/oil.nvim): edit the filesystem like a buffer
- **Quick marks** — [Harpoon 2](https://github.com/ThePrimeagen/harpoon) for instant jumping between marked files

### LSP & Tooling
- **Language servers** — pyright, ruff, lua-language-server, typescript-language-server, eslint (auto-installed via Mason)
- **Formatting** — [conform.nvim](https://github.com/stevearc/conform.nvim): prettier (JS/TS/CSS/HTML), stylua (Lua), ruff (Python)
- **Linting** — [nvim-lint](https://github.com/mfussenegger/nvim-lint): ruff for Python; eslint diagnostics via LSP
- **Inlay hints** — enabled globally

### Git
- **LazyGit** — [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) floating terminal on `<leader>gg`
- **Gitsigns** — gutter indicators and current-line blame

### UI
- **Colorschemes** — [catppuccin-mocha](https://github.com/catppuccin/nvim) (default) and [rose-pine](https://github.com/rose-pine/neovim); switch with `<leader>uC`
- **Status line** — minimal [lualine](https://github.com/nvim-lualine/lualine.nvim) (no powerline symbols)
- **which-key** — keymap hints on leader press; scroll with `<C-f>` / `<C-b>`
- **noice.nvim disabled** — plain cmdline, no popup command palette
- **bufferline disabled** — buffer navigation via Harpoon
- **Dashboard disabled** — opens to an empty buffer

### Tools
- **Code screenshots** — [codesnap.nvim](https://github.com/mistricky/codesnap.nvim): select code in visual mode, `<leader>tc` copies a styled image to clipboard

---

## Keymaps

See **[KEYMAPS.md](./KEYMAPS.md)** for the full reference table covering all custom keymaps, plugins, LSP servers, and setup steps.

---

## Installation

### Requirements

| Dependency | Purpose | Install |
|-----------|---------|---------|
| Neovim 0.10+ | — | [neovim.io](https://neovim.io) |
| `git` | Plugin cloning | `sudo apt install git` |
| `ripgrep` | Telescope live grep | `sudo apt install ripgrep` |
| `make` / `build-essential` | Build fzf native + codesnap | `sudo apt install build-essential` |
| `lazygit` | Git TUI | [Install guide](https://github.com/jesseduffield/lazygit#installation) |

### Steps

```sh
# Back up existing config if needed
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://gitlab.com/mcerne/neovim.git ~/.config/nvim

# Open Neovim — lazy.nvim bootstraps itself and installs all plugins
nvim
```

On first launch:
1. lazy.nvim installs all plugins automatically
2. Mason installs all LSP servers and formatters on first file open
3. Run `:TSUpdate` to install Treesitter parsers

---

## Structure

```
~/.config/nvim/
├── KEYMAPS.md                  # Full keymap and plugin reference
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # Plugin manager bootstrap
│   │   ├── options.lua         # Editor options
│   │   ├── keymaps.lua         # Global custom keymaps
│   │   └── autocmds.lua        # Autocommands
│   └── plugins/
│       ├── codesnap.lua        # Code screenshots
│       ├── colorschemes.lua    # catppuccin, rose-pine
│       ├── completion.lua      # blink.cmp
│       ├── git.lua             # gitsigns, lazygit
│       ├── harpoon.lua         # Harpoon v2
│       ├── lsp.lua             # LSP, Mason, conform, nvim-lint
│       ├── oil.lua             # Oil file explorer
│       ├── telescope.lua       # Telescope + fzf
│       ├── ui.lua              # lualine, disable noice/bufferline/dashboard
│       └── which-key.lua       # which-key scroll key config
└── stylua.toml                 # Lua formatter config (2-space, 120-col)
```
