# 1. Code Structure
```
~/.config/nvim
├── cerne
│   ├── init.lua
│   ├── spec1.lua
│   ├── **
│   └── spec2.lua
├── config
│   ├── lazy.lua
│   ├── spec1.lua
│   ├── **
│   └── spec2.lua
├── plugins
│   ├── plugin1.lua
│   ├── **
│   └── plugin2.lua
└── init.lua
```
# 2. Features
```
[x] ripgrep (file finder) *
[x] lazygit ~
[x] nerd-font *
[x] luarocks (lua package-manager) *
[x] lazy.nvim (nvim package-manager) *
[x] Powershell 7.x (pre-requisite for Mason) *
[x] plenary.nvim (pre-requisite for telescope) *
[x] telescope.nvim (fuzzy finder) +
[x] tree-sitter.nvim (highlighting) +
[x] tokyonight.nvim (colorscheme) ~
[x] mason.nvim (lsp) +
[x] lazygit.nvim (git cli) ~
[x] gitsigns.nvim (git info) +
[x] mason-lspconfig.nvim (lsp) +
[x] cmp-buffer.nvim (completion) +
[x] cmp-nvim-lsp.nvim (completion) +
[x] cmp-path.nvim (completion) +
[x] nvim-cmp (completion engine) +
[x] which-key.nvim (keybinding manager) +
[x] Oil.nvim (file management) ~
[x] lualine.nvim (status bar) ~
[x] harpoon.nvim (jumping across buffers)
[x] Copilot.nvim (AI assistant)
[x] indentmini.nvim (Adjusts tabstop and shiftwidth)
[ ] CopilotChat.nvim (AI Chat)
[ ] nvim-autopairs.nvim (auto-closing brackets/quotes)
[ ] trouble.nvim (better error handling -> editor)
[ ] Comment.nvim (shortcut for commenting)
[ ] todo-comments.nvim (comments to enhance development)
[x] alpha.nvim (Dashboard)
[x] vimbegood.nvim (training vim-motions)
[ ] obsidian.nvim (note-taking)
[ ] markdown-preview.nvim
```
```
* -> pre-requisites
+ -> core
~ -> optional
```
# 3. TODO's
## 3.1. Configurations:
```
[x] telescope *&
[x] general keybindings *
[x] which-key *&
[x] harpoon *&
[x] Oil *&
[ ] Copilot *&
[x] lazygit *
[x] cmp *
[ ] Fix cmp with Obsidian.nvim on Vaults !!!
```
```
* -> key-bindings
& -> configurations
```

# 4. Important Links
For the cmp configuration, I used basically the [gmr458's configuration](https://github.com/gmr458) file. His
nvim configuration can be found [here](https://github.com/gmr458/nvim). And the
cmp config can be found [here](https://github.com/gmr458/nvim/blob/main/lua/gmr/plugins/cmp.lua)
