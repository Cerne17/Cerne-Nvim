-- [ Sets the leader key ]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [ Installs Lazy Package Manager ]
require("cerne.lazy-pm")

-- [ Requires the basic plugins installations ]
require("cerne.lazy-plugins")

-- [ Sets the default vim options ]
require("cerne.options")

-- [ Requires the Treesitter's config ]
-- Highlighting Plugin
require("cerne.plugins.treesitter-setup")

-- [ Requires the LSP's configurations ]
require("cerne.plugins.lsp-setup")

-- [ Requires the Telescope Config]
-- Fuzzy Finder
require("cerne.plugins.telescope-setup")

-- [ Requires the Harpoon Config]
-- File Multiplexer
require("cerne.plugins.harpoon-setup")

-- [ Requires the Rose Pine Colors Config ]
require("cerne.plugins.rose-setup")

-- [ Requires the Cyberdream Colors Config ]
require("cerne.plugins.cyberdream")

-- Setting the Default Colorscheme
vim.cmd('colorscheme cyberdream')

-- [ Requires General vim's keymaps ]
require("cerne.keymaps")

-- [ Requires Undo Tree config ]
require("cerne.plugins.undo-tree-setup")

-- [ Requires Oil's Config ]
-- File Explorer
require("cerne.plugins.oil-setup")

-- [ Custom Functionalities ]
require("cerne.custom.autoformat")
require("cerne.custom.debug")
