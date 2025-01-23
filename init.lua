require("config.lazy")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({'n','v'}, '<leader>pv', '<cmd>Explore<CR>', {silent = true})
