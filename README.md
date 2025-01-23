# 1. Code Structure
```
~/.config/nvim
├── config
│   ├── lazy.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
```
# 2. Features
```
[x] ripgrep (file finder) *
[x] lazygit ~
[x] nerd-font *
[x] luarocks (lua package-manager) *
[x] lazy.nvim (nvim package-manager) *
[x] plenary.nvim (pre-requisite for telescope) *
[x] telescope.nvim (fuzzy finder) +
[ ] tree-sitter.nvim (highlighting) +
[ ] tokyonight.nvim (colorscheme) ~
[ ] mason.nvim (lsp) +
[ ] lazygit.nvim (git cli) ~
[ ] gitsigns.nvim (git info) +
[ ] mason-lspconfig.nvim (lsp) +
[ ] cmp-buffer.nvim (completion) +
[ ] cmp-nvim-lsp.nvim (completion) +
[ ] cmp-path.nvim (completion) +
[ ] nvim-cmp (completion engine) +
[ ] lualine.nvim (status bar) ~
[ ] which-key.nvim (keybinding manager) +
[ ] Comment.nvim (shortcut for commenting)
[ ] nvim-autopairs.nvim (auto-closing brackets/quotes)
[ ] harpoon.nvim (jumping across buffers)
```
```
* -> pre-requisites
+ -> core
~ -> optional
```
