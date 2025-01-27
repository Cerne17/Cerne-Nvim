local o = vim.o
local opt = vim.opt
local g = vim.g

-- sets the line numbers
o.nu = true
o.relativenumber = true

-- disables case sensitivity in searches
o.ignorecase = true
o.smartcase = true

-- Keeps signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decreses update time
o.updatetime = 250
o.timeoutlen = 300

-- Sets up the completeo to have better completion
-- experience
o.completeopt = 'menuone,noselect'

-- NOTE: make sure your terminal supports this
o.termguicolors = true

-- Tab Config
g.python_recommended_style = 1
g.rust_recommended_style = 1
opt.tabstop = 2
opt.smartindent = true
opt.shiftwidth = 2
opt.expandtab = true

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Fixes searched terms always being highlighted
-- Clear search highlights when pressing <Esc> in normal mode
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.opt.hlsearch = false
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.opt.hlsearch = true
    end,
})

-- Clear search highlights when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Sets conceallevel for obsidian.nvim
opt.conceallevel = 2
