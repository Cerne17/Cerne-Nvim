# Neovim Config — Quick Reference

## Custom Keymaps

### Navigation
| Key | Action | File |
|-----|--------|------|
| `<leader>pv` | Open Oil file explorer | `lua/config/keymaps.lua` |
| `<C-d>` | Scroll down + center | `lua/config/keymaps.lua` |
| `<C-u>` | Scroll up + center | `lua/config/keymaps.lua` |

### Harpoon
| Key | Action | File |
|-----|--------|------|
| `<leader>ha` | Add file to Harpoon | `lua/plugins/harpoon.lua` |
| `<C-e>` | Harpoon quick menu | `lua/plugins/harpoon.lua` |
| `<leader>1` | Jump to Harpoon mark 1 | `lua/plugins/harpoon.lua` |
| `<leader>2` | Jump to Harpoon mark 2 | `lua/plugins/harpoon.lua` |
| `<leader>3` | Jump to Harpoon mark 3 | `lua/plugins/harpoon.lua` |
| `<leader>4` | Jump to Harpoon mark 4 | `lua/plugins/harpoon.lua` |

### Claude Code
| Key | Action | Mode | File |
|-----|--------|------|------|
| `<leader>ac` | Toggle Claude terminal | Normal | `lua/plugins/claude.lua` |
| `<leader>af` | Focus Claude terminal | Normal | `lua/plugins/claude.lua` |
| `<leader>ar` | Resume previous session | Normal | `lua/plugins/claude.lua` |
| `<leader>aC` | Continue conversation | Normal | `lua/plugins/claude.lua` |
| `<leader>am` | Select model | Normal | `lua/plugins/claude.lua` |
| `<leader>ab` | Add current buffer to context | Normal | `lua/plugins/claude.lua` |
| `<leader>as` | Send selection / add file (in oil) | Visual / oil | `lua/plugins/claude.lua` |
| `<leader>aa` | Accept diff | Normal | `lua/plugins/claude.lua` |
| `<leader>ad` | Deny diff | Normal | `lua/plugins/claude.lua` |

### Telescope
| Key | Action | File |
|-----|--------|------|
| `<leader>ff` | Find files | `lua/plugins/telescope.lua` |
| `<leader>fg` | Live grep (search file contents) | `lua/plugins/telescope.lua` |
| `<leader>fb` | Buffers | `lua/plugins/telescope.lua` |
| `<leader>fs` | LSP document symbols | `lua/plugins/telescope.lua` |
| `<leader>fd` | Diagnostics | `lua/plugins/telescope.lua` |
| `<leader>fk` | Browse all keymaps | `lua/plugins/telescope.lua` |
| `<leader>uC` | Colorscheme picker | `lua/plugins/telescope.lua` |

### Git
| Key | Action | File |
|-----|--------|------|
| `<leader>gg` | LazyGit | `lua/plugins/git.lua` |

### Code
| Key | Action | Mode | File |
|-----|--------|------|------|
| `<leader>tc` | Copy code snapshot to clipboard | Visual | `lua/plugins/codesnap.lua` |

---

## Plugins

| Plugin | Purpose | File |
|--------|---------|------|
| `saghen/blink.cmp` | Completion (ghost text, signature help) | `lua/plugins/completion.lua` |
| `stevearc/oil.nvim` | File explorer as editable buffer | `lua/plugins/oil.lua` |
| `ThePrimeagen/harpoon` (v2) | Quick file marking and jumping | `lua/plugins/harpoon.lua` |
| `nvim-telescope/telescope.nvim` | Fuzzy finder (files, grep, buffers) | `lua/plugins/telescope.lua` |
| `kdheepak/lazygit.nvim` | LazyGit floating terminal | `lua/plugins/git.lua` |
| `lewis6991/gitsigns.nvim` | Gutter git signs + current line blame | `lua/plugins/git.lua` |
| `mistricky/codesnap.nvim` | Code screenshots to clipboard | `lua/plugins/codesnap.lua` |
| `nvim-lualine/lualine.nvim` | Status line | `lua/plugins/ui.lua` |
| `folke/snacks.nvim` (dashboard) | Branded startup dashboard | `lua/plugins/ui.lua` |
| `coder/claudecode.nvim` | Claude Code IDE integration | `lua/plugins/claude.lua` |
| `colors/cerne.lua` | Default colorscheme, cerne.pro brand tokens (dark) | `colors/cerne.lua` |
| `colors/cerne-light.lua` | Light counterpart, same brand tokens | `colors/cerne-light.lua` |
| `catppuccin/nvim` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `rose-pine/neovim` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `folke/tokyonight.nvim` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `ellisonleao/gruvbox.nvim` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `rebelot/kanagawa.nvim` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `EdenEast/nightfox.nvim` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `sainnhe/everforest` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `navarasu/onedark.nvim` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `gbprod/nord.nvim` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `projekt0n/github-nvim-theme` | Alternative colorscheme | `lua/plugins/colorschemes.lua` |
| `neovim/nvim-lspconfig` | LSP configuration | `lua/plugins/lsp.lua` |
| `mason-org/mason.nvim` | LSP/tool installer | `lua/plugins/lsp.lua` |
| `stevearc/conform.nvim` | Formatting (prettier, stylua, ruff) | `lua/plugins/lsp.lua` |
| `mfussenegger/nvim-lint` | Linting (ruff for Python) | `lua/plugins/lsp.lua` |

---

## LSP Servers (auto-installed by Mason)

| Server | Language | Notes |
|--------|---------|-------|
| `pyright` | Python | Type checking |
| `ruff` | Python | Linting + formatting |
| `lua_ls` | Lua | Neovim API types via lazydev.nvim |
| `ts_ls` | TypeScript / JavaScript | |
| `eslint` | TypeScript / JavaScript | Diagnostics via LSP |

## Formatters (auto-installed by Mason)
| Tool | Filetypes |
|------|----------|
| `prettier` | JS, TS, JSX, TSX, JSON, CSS, HTML |
| `stylua` | Lua |
| `ruff_format` | Python |

---

## Setup Requirements (new machine)

### System packages
```sh
sudo apt install git ripgrep make build-essential
```
- `lazygit` — install separately: https://github.com/jesseduffield/lazygit#installation
- Neovim 0.10+ required (tested on v0.12.2)

### First launch
1. Open `nvim` — lazy.nvim auto-installs all plugins
2. Mason auto-installs all LSP servers and tools on first file open
3. Run `:TSUpdate` to install Treesitter parsers
