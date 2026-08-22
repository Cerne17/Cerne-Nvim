# Cerne-Nvim

A personal Neovim configuration built on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), managed with [lazy.nvim](https://github.com/folke/lazy.nvim). Modular setup with LSP, autocompletion, fuzzy finding, Treesitter highlighting, and C/C++ tooling.

## Features

- **LSP** via `nvim-lspconfig` + `mason.nvim` — auto-installs servers for Lua, Python, TypeScript, and C/C++ (clangd).
- **Autocompletion** with `nvim-cmp` + `LuaSnip` snippets and GitHub Copilot.
- **Syntax highlighting** with Treesitter (`c`, `cpp`, `lua`, `python`, `javascript`, `typescript`, and more).
- **Fuzzy finding** with Telescope (+ fzf-native).
- **File navigation** with Harpoon 2, Oil, and an undo tree.
- **Git** integration via Fugitive, Gitsigns, and LazyGit.
- **Colorschemes**: cyberdream (default) and rose-pine.

## Requirements

- Neovim ≥ 0.9
- `git`, `make`, a C compiler (for `telescope-fzf-native` and `codesnap`)
- `ripgrep` (Telescope live grep)
- A [Nerd Font](https://www.nerdfonts.com/) for icons

## Install

```sh
# Back up any existing config first
git clone https://github.com/Cerne17/Cerne-Nvim ~/.config/nvim
nvim
```

On first launch, lazy.nvim bootstraps itself and installs all plugins; Mason installs the LSP servers automatically.

## Structure

```
~/.config/nvim
├── init.lua                 # Entry point: leader key, requires modules in order
└── lua
    ├── lazy-pm.lua          # Bootstraps lazy.nvim
    ├── lazy-plugins.lua     # Plugin declarations
    ├── options.lua          # Editor options
    ├── keymaps.lua          # General keymaps
    ├── custom
    │   ├── autoformat.lua   # Format-on-save
    │   └── debug.lua        # DAP debug config
    └── plugins              # Per-plugin setup
        ├── lsp-setup.lua
        ├── treesitter-setup.lua
        ├── telescope-setup.lua
        ├── harpoon-setup.lua
        ├── oil-setup.lua
        ├── codesnap-setup.lua
        ├── undo-tree-setup.lua
        ├── rose-setup.lua
        └── cyberdream.lua
```

## Language servers

Installed automatically by `mason-lspconfig` (declared in `lua/plugins/lsp-setup.lua`):

| Server                 | Languages       |
|------------------------|-----------------|
| `clangd`               | C / C++         |
| `jedi_language_server` | Python          |
| `tsserver`             | JavaScript / TS |
| `lua_ls`               | Lua             |

`clangd` runs with `--clang-tidy`, IWYU header insertion, detailed completion, and argument placeholders. For multi-file C/C++ projects, provide a `compile_commands.json` or `compile_flags.txt` so clangd resolves includes.

## Keymaps

Leader is `<Space>`.

### General

| Key          | Action                         |
|--------------|--------------------------------|
| `<C-d>`      | Half page down, center cursor  |
| `<C-u>`      | Half page up, center cursor    |
| `[d` / `]d`  | Previous / next diagnostic     |
| `<leader>e`  | Open floating diagnostic       |
| `<leader>q`  | Diagnostics to location list   |
| `<leader>gg` | LazyGit                        |
| `<leader>u`  | Toggle undo tree               |
| `<leader>pv` | Open Oil file explorer         |

### Telescope

| Key          | Action                          |
|--------------|---------------------------------|
| `<leader>sf` | Search files                    |
| `<leader>sg` | Live grep                       |
| `<leader>sw` | Search current word             |
| `<leader>sd` | Search diagnostics              |
| `<leader>sh` | Search help                     |
| `<leader>ff` | Recently opened files           |
| `<leader>fb` | Existing buffers                |
| `<leader>fc` | Fuzzy search in current buffer  |
| `<leader>gf` | Git files                       |

### Harpoon

| Key          | Action                        |
|--------------|-------------------------------|
| `<leader>m`  | Add current file              |
| `<C-e>`      | Open Harpoon menu (Telescope) |
| `<leader>ht` | Toggle quick menu             |
| `<C-h><C-h>` | Jump to file 1                |
| `<C-h><C-j>` | Jump to file 2                |
| `<C-h><C-k>` | Jump to file 3                |
| `<C-h><C-l>` | Jump to file 4                |

### LSP (buffer-local, on attach)

| Key          | Action            |
|--------------|-------------------|
| `gd`         | Go to definition  |
| `gr`         | Go to references  |
| `gI`         | Go to implementation |
| `gD`         | Go to declaration |
| `K`          | Hover documentation |
| `<C-k>`      | Signature help    |
| `<leader>rn` | Rename symbol     |
| `<leader>ca` | Code action       |
| `<leader>D`  | Type definition   |
| `<leader>ds` | Document symbols  |
| `<leader>ws` | Workspace symbols |

### CodeSnap (visual mode)

| Key          | Action                               |
|--------------|--------------------------------------|
| `<leader>tc` | Copy code screenshot to clipboard    |
| `<leader>ts` | Save code screenshot to `~/Pictures` |

## Plugins

| #  | Plugin         | Category          | Description                        | Link |
|----|----------------|-------------------|------------------------------------|------|
| 1  | lazy.nvim      | Plugin Management | Plugin manager                     | https://github.com/folke/lazy.nvim |
| 2  | Mason          | Plugin Management | LSP / tool installer               | https://github.com/williamboman/mason.nvim |
| 3  | nvim-lspconfig | LSP               | LSP client configuration           | https://github.com/neovim/nvim-lspconfig |
| 4  | clangd         | LSP               | C/C++ language server              | https://github.com/clangd/clangd |
| 5  | nvim-cmp       | Completion        | Autocompletion engine              | https://github.com/hrsh7th/nvim-cmp |
| 6  | LuaSnip        | Completion        | Snippet engine                     | https://github.com/L3MON4D3/LuaSnip |
| 7  | copilot.vim    | Completion        | AI code suggestions                | https://github.com/github/copilot.vim |
| 8  | Treesitter     | Highlighting      | Syntax highlighting & textobjects  | https://github.com/nvim-treesitter/nvim-treesitter |
| 9  | Telescope      | Fuzzy Finder      | Fuzzy finder over files, LSP, grep | https://github.com/nvim-telescope/telescope.nvim |
| 10 | Harpoon        | Navigation        | Quick file switching               | https://github.com/ThePrimeagen/harpoon |
| 11 | Oil            | File Explorer     | Edit the filesystem like a buffer  | https://github.com/stevearc/oil.nvim |
| 12 | undotree       | History           | Visualize the undo history         | https://github.com/jiaoshijie/undotree |
| 13 | Fugitive       | Git               | Git command wrapper                | https://github.com/tpope/vim-fugitive |
| 14 | Gitsigns       | Git               | Gutter signs & hunk actions        | https://github.com/lewis6991/gitsigns.nvim |
| 15 | LazyGit        | Git               | Terminal UI for Git                | https://github.com/kdheepak/lazygit.nvim |
| 16 | lualine        | UI                | Statusline                         | https://github.com/nvim-lualine/lualine.nvim |
| 17 | which-key      | Documentation     | Shows pending keybinds             | https://github.com/folke/which-key.nvim |
| 18 | fidget         | LSP               | LSP progress notifications         | https://github.com/j-hui/fidget.nvim |
| 19 | cyberdream     | Colorscheme       | Default colorscheme                | https://github.com/scottmckendry/cyberdream.nvim |
| 20 | rose-pine      | Colorscheme       | Alternate colorscheme              | https://github.com/rose-pine/neovim |
| 21 | CodeSnap       | Utility           | Code screenshots                   | https://github.com/mistricky/codesnap.nvim |
