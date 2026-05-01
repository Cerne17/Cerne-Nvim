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
- **Fuzzy finder:** Telescope — NOT snacks.picker (the LazyVim v8 default). Telescope was added explicitly in `lua/plugins/telescope.lua`; plumbing for `<leader>ff/fg/fb/fs` overrides snacks.picker keymaps.
- **noice.nvim disabled:** Replaced with plain cmdline (`cmdheight=1`). lualine is fully replaced (not extended) in `lua/plugins/ui.lua` to avoid noice components.
- **bufferline disabled:** Navigation via Harpoon 2 (`lua/plugins/harpoon.lua`).
- **Dashboard disabled:** snacks dashboard is off; Neovim opens to an empty buffer.
- **Lazygit:** kdheepak/lazygit.nvim on `<leader>gg`; snacks.lazygit is disabled to avoid keymap conflict.

**LSP / Mason / Treesitter:** Configured in `lua/plugins/lsp.lua`. Mason ensures pyright, ruff, lua-language-server, typescript-language-server, eslint-lsp, stylua, and prettier are installed. Inlay hints are globally enabled. conform.nvim handles formatting; nvim-lint handles ruff linting for Python (eslint diagnostics come from the eslint LSP).

**Colorschemes:** catppuccin-mocha is the default. rose-pine is also installed. Switch at runtime with `<leader>uC` (Telescope colorscheme picker with preview). Other available variants: catppuccin-latte, catppuccin-frappe, rose-pine-moon, rose-pine-dawn, tokyonight.

**Avante (AI assistant):** `lua/plugins/avante.lua` — disabled (`enabled = false`). No Anthropic API key available; AI assistance is handled via Claude Code in the terminal instead.

## Keymaps added/overridden

| Key | Action |
|-----|--------|
| `<leader>pv` | netrw Explorer (`:Ex`) |
| `<leader>ff` | Telescope: find files |
| `<leader>fg` | Telescope: live grep |
| `<leader>fb` | Telescope: buffers |
| `<leader>fs` | Telescope: LSP document symbols |
| `<leader>uC` | Telescope: colorscheme picker |
| `<leader>gg` | LazyGit (overrides snacks default) |
| `<leader>a` | Harpoon: add current file |
| `<C-e>` | Harpoon: open quick menu |
| `<leader>1` | Harpoon: jump to mark 1 |
| `<leader>2` | Harpoon: jump to mark 2 |
| `<leader>3` | Harpoon: jump to mark 3 |
| `<leader>4` | Harpoon: jump to mark 4 |

Avante keymaps follow avante.nvim defaults (auto-set by the plugin).
