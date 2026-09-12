# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Lua Formatting

This config uses StyLua (configured in `stylua.toml`): 2-space indentation, 120-column width.

StyLua is installed by Mason, not Homebrew, so it is not on `$PATH` by default.
Either add `~/.local/share/nvim/mason/bin` to `$PATH` or call it by full path:

```sh
~/.local/share/nvim/mason/bin/stylua --check .   # check formatting
~/.local/share/nvim/mason/bin/stylua .           # apply formatting
```

Inside Neovim, conform.nvim runs the same binary on save.

## Architecture

This is a [LazyVim](https://lazyvim.github.io) v8 config built on [lazy.nvim](https://github.com/folke/lazy.nvim).

**Load order:** `init.lua` → `lua/config/lazy.lua` (bootstraps lazy.nvim, merges LazyVim defaults with user plugins) → LazyVim auto-sources `lua/config/options.lua`, `lua/config/keymaps.lua`, and `lua/config/autocmds.lua`.

**Adding/overriding plugins:** Every `.lua` file under `lua/plugins/` is auto-loaded as a plugin spec. To override a LazyVim default, return a spec with the same plugin name — lazy.nvim deep-merges `opts` tables. `lua/plugins/example.lua` is a disabled reference file (guarded by `if true then return {} end`).

**Key design choices vs LazyVim defaults:**
- **Completion:** blink.cmp (LazyVim v8 default) — NOT nvim-cmp. Ghost text and signature help are enabled in `lua/plugins/completion.lua`.
- **Fuzzy finder:** Telescope — NOT snacks.picker (the LazyVim v8 default). Enabled through the `editor.telescope` extra, which registers Telescope as LazyVim's picker backend, so every `<leader>f*`, `<leader>s*` and `<leader>g*` picker routes to it at once. `lua/plugins/telescope.lua` holds only the deviations: live grep stays on `<leader>fg` (the extra puts `git_files` there), the LSP-symbols / diagnostics / keymaps pickers the extra lacks, the layout, and hidden-file search. Do not hand-roll picker keymaps that the extra already provides.
- **File explorer:** oil.nvim on `<leader>pv` — NOT netrw. Nothing may bind `<leader>p` as a leaf, or `<leader>pv` waits out `timeoutlen`; this is why `lua/plugins/yanky.lua` moves the yank-history picker to `<leader>P`. Configured in `lua/plugins/oil.lua`; shows hidden files by default.
- **noice.nvim disabled:** Replaced with plain cmdline (`cmdheight=1`). lualine is fully replaced (not extended) in `lua/plugins/ui.lua` to avoid noice components.
- **bufferline disabled:** Navigation via Harpoon 2 (`lua/plugins/harpoon.lua`). Lists are scoped per git branch — the list key combines cwd with the branch read from `.git/HEAD` — so a feature branch gets its own marks. Marks 1-9 are on `<leader>1`..`<leader>9`; add is `<leader>h`, which must stay a leaf mapping (no `<leader>h*` siblings) so it fires without waiting out `timeoutlen`.
- **Dashboard:** snacks dashboard is enabled with a cerne.pro-branded header (`lua/plugins/ui.lua`). Its Find File / Find Text / Recent Files entries call Telescope with an explicit `cwd` so a deleted working directory falls back to `$HOME` instead of crashing the picker.
- **Lazygit:** kdheepak/lazygit.nvim on `<leader>gg`; snacks.lazygit is disabled to avoid keymap conflict.
- **Claude Code:** coder/claudecode.nvim owns the whole `<leader>a` prefix (`lua/plugins/claudecode.lua`). Nothing else may bind `<leader>a` itself — a bare `<leader>a` mapping makes every `<leader>a*` key wait out `timeoutlen`. This is why Harpoon's add-file lives on `<leader>h`.

**LSP / Mason / Treesitter:** Configured in `lua/plugins/lsp.lua`. LSP servers (pyright, ruff, lua_ls, clangd, ts_ls, eslint) are auto-installed by mason-lspconfig when detected in the `servers` table — do NOT add them to mason's `ensure_installed` or they will double-install and crash. Mason's `ensure_installed` is only for standalone tools not tied to an LSP server (currently: prettier, clang-format). Inlay hints are globally enabled. conform.nvim handles formatting.

**Linting comes from LSP servers only** — there is deliberately no `linters_by_ft` entry for Python. The `ruff` LSP already publishes lint diagnostics, so adding nvim-lint's `ruff` on top duplicated every warning. eslint diagnostics likewise come from the eslint LSP. Only reach for nvim-lint for a linter with no language server.

The `lazyvim.plugins.extras.lang.clangd` extra is enabled in `lazyvim.json`; the other languages are hand-configured in `lua/plugins/lsp.lua` rather than through LazyVim extras.

**which-key:** scroll keys remapped to `<C-f>` (down) / `<C-b>` (up) inside the popup to avoid conflict with the `<C-d>`/`<C-u>` scroll-centering keymaps.

**Colorschemes:** `cerne` (the cerne.pro brand palette, from `Cerne17/cerne.nvim`) is the default, with `cerne-light` as its light counterpart. Ten other schemes are installed as alternatives: catppuccin, rose-pine, tokyonight, gruvbox, kanagawa, nightfox, everforest, onedark, nord and github-nvim-theme — see the comment block at the bottom of `lua/plugins/colorschemes.lua` for every variant name. Switch at runtime with `<leader>uC` (Telescope colorscheme picker with preview).

**Theme sync (`lua/config/cerne-theme.lua`):** mirrors the shell `cerne-theme` toggle from dotfiles so Neovim follows macOS Dark Mode. State lives in `stdpath("state") .. "/cerne_colorscheme"` (`light` / `dark` / `auto`), the same file dotfiles' `bin/cerne-theme-watch.sh` reads before remote-sending `:CerneThemeAuto` over the RPC server. `:CerneTheme [light|dark|auto]` sets it; no argument toggles polarity.

The module is wired into LazyVim's `colorscheme` **option as a function** (`lua/plugins/colorschemes.lua`), not into an autocmd. Keep it that way: a hard-coded `colorscheme = "cerne"` there painted dark first and got repainted `cerne-light` a moment later, flashing on every boot in light mode. `lua/config/autocmds.lua` only requires the module to register its user commands.

**Avante (AI assistant):** `lua/plugins/avante.lua` — disabled (`enabled = false`). No Anthropic API key available; AI assistance goes through claudecode.nvim (`<leader>a*`) instead.

**LazyVim extras** (`lazyvim.json`): `editor.telescope`, `editor.inc-rename`, `coding.mini-surround`, `coding.yanky`, `util.project`, `test.core`, `dap.core`, and the language extras `lang.clangd`, `lang.python`, `lang.typescript`, `lang.json`, `lang.yaml`, `lang.markdown`. Prefer enabling an extra over hand-rolling equivalent config — `lua/plugins/` should carry deviations from the extras, not copies of them.

**Plugin updates:** lazy.nvim's periodic `checker` is disabled, because it rewrote `lazy-lock.json` in the background and left the repo permanently dirty. Update deliberately with `:Lazy sync` and commit the lockfile as its own change.

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
| `<leader>h` | Harpoon: add current file |
| `<C-e>` | Harpoon: open quick menu |
| `<leader>1` | Harpoon: jump to mark 1 |
| `<leader>2` | Harpoon: jump to mark 2 |
| `<leader>3` | Harpoon: jump to mark 3 |
| `<leader>4`..`<leader>9` | Harpoon: jump to marks 4-9 |
| `<leader>cp` | CodeSnap: copy code screenshot to clipboard (visual mode) |
| `<C-d>` | Scroll down + center cursor |
| `<C-u>` | Scroll up + center cursor |
| `<leader>ac` | Claude Code: toggle |
| `<leader>af` | Claude Code: focus |
| `<leader>ar` | Claude Code: resume |
| `<leader>aC` | Claude Code: continue |
| `<leader>am` | Claude Code: select model |
| `<leader>ab` | Claude Code: add current buffer |
| `<leader>as` | Claude Code: send selection (visual) / add file (explorer buffers) |
| `<leader>aa` | Claude Code: accept diff |
| `<leader>ad` | Claude Code: deny diff |

Everything not listed here is a LazyVim default or comes from an extra —
including the `<leader>s*` pickers (Telescope), `<leader>t*` (neotest),
`<leader>d*` (dap), `<leader>P` (yanky) and `gsa`/`gsd`/`gsr` (mini.surround).
`<leader>e` remains the snacks explorer; Oil on `<leader>pv` is the primary one.
