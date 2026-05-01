# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Lua Formatting

This config uses StyLua (configured in `stylua.toml`): 2-space indentation, 120-column width.

```sh
stylua --check .   # check formatting
stylua .           # apply formatting
```

## Architecture

This is a [LazyVim](https://lazyvim.github.io) v8 config built on [lazy.nvim](https://github.com/folke/lazy.nvim).

**Load order:** `init.lua` → `lua/config/lazy.lua` (bootstraps lazy.nvim, merges LazyVim defaults with user plugins) → LazyVim auto-sources `lua/config/options.lua`, `lua/config/keymaps.lua`, and `lua/config/autocmds.lua`.

**Adding/overriding plugins:** Every `.lua` file under `lua/plugins/` is auto-loaded as a plugin spec. To override a LazyVim default, return a spec with the same plugin name — lazy.nvim deep-merges `opts` tables. `lua/plugins/example.lua` is a disabled reference file (guarded by `if true then return {} end`).

**Key design choices vs LazyVim defaults:**
- **Completion:** blink.cmp (LazyVim v8 default) — NOT nvim-cmp. Ghost text and signature help are enabled in `lua/plugins/completion.lua`.
- **Fuzzy finder:** Telescope — NOT snacks.picker (the LazyVim v8 default). Telescope was added explicitly in `lua/plugins/telescope.lua`; plumbing for `<leader>ff/fg/fb/fs/fd/fk` overrides snacks.picker keymaps.
- **File explorer:** oil.nvim on `<leader>pv` — NOT netrw. Configured in `lua/plugins/oil.lua`; shows hidden files by default.
- **noice.nvim disabled:** Replaced with plain cmdline (`cmdheight=1`). lualine is fully replaced (not extended) in `lua/plugins/ui.lua` to avoid noice components.
- **bufferline disabled:** Navigation via Harpoon 2 (`lua/plugins/harpoon.lua`).
- **Dashboard disabled:** snacks dashboard is off; Neovim opens to an empty buffer.
- **Lazygit:** kdheepak/lazygit.nvim on `<leader>gg`; snacks.lazygit is disabled to avoid keymap conflict.

**LSP / Mason / Treesitter:** Configured in `lua/plugins/lsp.lua`. LSP servers (pyright, ruff, lua_ls, ts_ls, eslint) are auto-installed by mason-lspconfig when detected in the `servers` table — do NOT add them to mason's `ensure_installed` or they will double-install and crash. Mason's `ensure_installed` is only for standalone tools not tied to an LSP server (currently: prettier). Inlay hints are globally enabled. conform.nvim handles formatting; nvim-lint handles ruff linting for Python (eslint diagnostics come from the eslint LSP).

**which-key:** scroll keys remapped to `<C-f>` (down) / `<C-b>` (up) inside the popup to avoid conflict with the `<C-d>`/`<C-u>` scroll-centering keymaps.

**Colorschemes:** catppuccin-mocha is the default. rose-pine is also installed. Switch at runtime with `<leader>uC` (Telescope colorscheme picker with preview). Other available variants: catppuccin-latte, catppuccin-frappe, rose-pine-moon, rose-pine-dawn, tokyonight.

**Avante (AI assistant):** `lua/plugins/avante.lua` — disabled (`enabled = false`). No Anthropic API key available; AI assistance is handled via Claude Code in the terminal instead.

**Quick reference:** `KEYMAPS.md` in the repo root lists all custom keymaps, plugins, LSP servers, and new-machine setup steps.

## Keymaps added/overridden

| Key | Action |
|-----|--------|
| `<leader>pv` | Oil file explorer |
| `<leader>ff` | Telescope: find files |
| `<leader>fg` | Telescope: live grep (requires ripgrep) |
| `<leader>fb` | Telescope: buffers |
| `<leader>fs` | Telescope: LSP document symbols |
| `<leader>fd` | Telescope: diagnostics |
| `<leader>fk` | Telescope: browse all keymaps |
| `<leader>uC` | Telescope: colorscheme picker |
| `<leader>gg` | LazyGit (overrides snacks default) |
| `<leader>a` | Harpoon: add current file |
| `<C-e>` | Harpoon: open quick menu |
| `<leader>1` | Harpoon: jump to mark 1 |
| `<leader>2` | Harpoon: jump to mark 2 |
| `<leader>3` | Harpoon: jump to mark 3 |
| `<leader>4` | Harpoon: jump to mark 4 |
| `<leader>tc` | CodeSnap: copy code screenshot to clipboard (visual mode) |
| `<C-d>` | Scroll down + center cursor |
| `<C-u>` | Scroll up + center cursor |

Avante keymaps follow avante.nvim defaults (auto-set by the plugin).
