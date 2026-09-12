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
| `<leader>h` | Add file to Harpoon | `lua/plugins/harpoon.lua` |
| `<C-e>` | Harpoon quick menu | `lua/plugins/harpoon.lua` |
| `<leader>1` | Jump to Harpoon mark 1 | `lua/plugins/harpoon.lua` |
| `<leader>2` | Jump to Harpoon mark 2 | `lua/plugins/harpoon.lua` |
| `<leader>3` | Jump to Harpoon mark 3 | `lua/plugins/harpoon.lua` |
| `<leader>4` | Jump to Harpoon mark 4 | `lua/plugins/harpoon.lua` |
| `<leader>5`..`<leader>9` | Jump to Harpoon marks 5-9 | `lua/plugins/harpoon.lua` |

Lists are scoped per git branch, so each branch keeps its own set of marks.

### Telescope
Telescope is LazyVim's picker backend, so every `<leader>f*`, `<leader>s*` and
`<leader>g*` picker uses it. Listed here are only the local deviations — run
`<leader>fk` for the full set.

| Key | Action | File |
|-----|--------|------|
| `<leader>fg` | Live grep (the extra puts git_files here) | `lua/plugins/telescope.lua` |
| `<leader>fs` | LSP document symbols | `lua/plugins/telescope.lua` |
| `<leader>fd` | Diagnostics | `lua/plugins/telescope.lua` |
| `<leader>fk` | Browse all keymaps | `lua/plugins/telescope.lua` |

Hidden files are searched by `find_files` and `live_grep`; `.git/` is excluded.

### Git
| Key | Action | File |
|-----|--------|------|
| `<leader>gg` | LazyGit | `lua/plugins/git.lua` |

### Claude Code
`<leader>a` is the group prefix — nothing else may bind `<leader>a` on its own.

| Key | Action | Mode | File |
|-----|--------|------|------|
| `<leader>ac` | Toggle Claude | Normal | `lua/plugins/claudecode.lua` |
| `<leader>af` | Focus Claude | Normal | `lua/plugins/claudecode.lua` |
| `<leader>ar` | Resume Claude | Normal | `lua/plugins/claudecode.lua` |
| `<leader>aC` | Continue Claude | Normal | `lua/plugins/claudecode.lua` |
| `<leader>am` | Select Claude model | Normal | `lua/plugins/claudecode.lua` |
| `<leader>ab` | Add current buffer | Normal | `lua/plugins/claudecode.lua` |
| `<leader>as` | Send selection / add file | Visual, explorer buffers | `lua/plugins/claudecode.lua` |
| `<leader>aa` | Accept diff | Normal | `lua/plugins/claudecode.lua` |
| `<leader>ad` | Deny diff | Normal | `lua/plugins/claudecode.lua` |

### Theme
| Command | Action | File |
|---------|--------|------|
| `:CerneTheme [light\|dark\|auto]` | Set cerne polarity (no arg toggles) | `lua/config/cerne-theme.lua` |
| `:CerneThemeAuto` | Re-sync from macOS appearance | `lua/config/cerne-theme.lua` |

### From LazyVim extras
| Prefix | Provides | Extra |
|--------|----------|-------|
| `<leader>t*` | Run and inspect tests | `test.core` (+ neotest-python) |
| `<leader>d*` | Breakpoints, stepping, debug UI | `dap.core` (+ nvim-dap-python) |
| `<leader>p` | Yank-history picker (`<C-p>`/`<C-n>` after paste) | `coding.yanky` |
| `gsa` / `gsd` / `gsr` | Add / delete / replace surrounding pair | `coding.mini-surround` |
| `<leader>cr` | LSP rename with live preview | `editor.inc-rename` |
| `<leader>fp` | Recent-project picker | `util.project` |

### Code
| Key | Action | Mode | File |
|-----|--------|------|------|
| `<leader>cp` | Copy code snapshot to clipboard | Visual | `lua/plugins/codesnap.lua` |

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
| `coder/claudecode.nvim` | Claude Code integration (`<leader>a*`) | `lua/plugins/claudecode.lua` |
| `nvim-lualine/lualine.nvim` | Status line | `lua/plugins/ui.lua` |
| `Cerne17/cerne.nvim` | Default colorscheme (`cerne` / `cerne-light`) | `lua/plugins/colorschemes.lua` |
| 10 alternative schemes | catppuccin, rose-pine, tokyonight, gruvbox, kanagawa, nightfox, everforest, onedark, nord, github | `lua/plugins/colorschemes.lua` |
| `neovim/nvim-lspconfig` | LSP configuration | `lua/plugins/lsp.lua` |
| `mason-org/mason.nvim` | LSP/tool installer | `lua/plugins/lsp.lua` |
| `stevearc/conform.nvim` | Formatting (prettier, stylua, ruff) | `lua/plugins/lsp.lua` |

Linting is **not** configured through nvim-lint — the `ruff` and `eslint` LSP
servers already publish those diagnostics, and doubling them up duplicated every
warning.

---

## LSP Servers (auto-installed by Mason)

| Server | Language | Notes |
|--------|---------|-------|
| `pyright` | Python | Type checking |
| `ruff` | Python | Linting + formatting |
| `lua_ls` | Lua | Neovim API types via lazydev.nvim |
| `clangd` | C / C++ | Via the `lang.clangd` extra; custom flags in `lsp.lua` |
| `vtsls` | TypeScript / JavaScript | Via the `lang.typescript` extra (replaces `ts_ls`) |
| `eslint` | TypeScript / JavaScript | Diagnostics via LSP; hand-configured |
| `jsonls` | JSON | Via `lang.json`, with SchemaStore completion |
| `yamlls` | YAML | Via `lang.yaml`, with SchemaStore completion |
| `marksman` | Markdown | Via `lang.markdown` |

Most of these come from LazyVim extras listed in `lazyvim.json`.
`lua/plugins/lsp.lua` carries only the deviations: the pyright virtualenv hook,
the clangd flags, and eslint.

## Formatters (auto-installed by Mason)
| Tool | Filetypes |
|------|----------|
| `prettier` | JS, TS, JSX, TSX, JSON, CSS, HTML |
| `stylua` | Lua |
| `ruff_format` | Python |
| `clang-format` | C, C++ |

---

## Setup Requirements (new machine)

### System packages

macOS (the primary machine):
```sh
brew install neovim git ripgrep fd make lazygit
```

Debian/Ubuntu:
```sh
sudo apt install git ripgrep fd-find make build-essential
```
- `lazygit` on Linux — install separately: https://github.com/jesseduffield/lazygit#installation
- Neovim 0.10+ required (currently running v0.11.5)
- Mason installs the rest (LSP servers, stylua, prettier, clang-format) into
  `~/.local/share/nvim/mason/bin`, which is not on `$PATH` unless you add it.

### First launch
1. Open `nvim` — lazy.nvim auto-installs all plugins
2. Mason auto-installs all LSP servers and tools on first file open
3. Run `:TSUpdate` to install Treesitter parsers

Plugin updates are manual: lazy.nvim's periodic checker is off, so run
`:Lazy sync` and commit `lazy-lock.json` as its own change.
