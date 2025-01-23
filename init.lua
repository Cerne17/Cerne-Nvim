vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")
require("config.init")

vim.keymap.set({'n','v'}, '<leader>pv', '<cmd>Explore<CR>', {silent = true})

-- [[ Sets my visual preferences]]
-- Such as colorscheme
require("cerne.visuals")
