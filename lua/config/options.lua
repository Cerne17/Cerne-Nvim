-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Keep cmdline visible at the bottom (noice.nvim is disabled)
vim.opt.cmdheight = 1

-- Never let the cursor sit against the top or bottom edge. Pairs with the
-- <C-d>/<C-u> centering keymaps in keymaps.lua.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Match stylua.toml's 120-column width so the ruler is where the formatter wraps.
vim.opt.colorcolumn = "120"
