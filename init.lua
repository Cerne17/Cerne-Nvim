vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")

vim.keymap.set({'n','v'}, '<leader>pv', '<cmd>Explore<CR>', {silent = true})
