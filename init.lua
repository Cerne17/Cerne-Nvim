-- [ Sets the leader key ]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [ Installs Lazy Package Manager ]
require "lazy-pm"

-- [ Requires the basic plugins installations ]
require  "lazy-plugins"

-- [ Sets the default vim options ]
require  "options"

-- [ Requires the Treesitter's config ]
-- Highlighting Plugin
require  "plugins.treesitter-setup"

-- [ Requires the LSP's configurations ]
require  "plugins.lsp-setup"

-- [ Requires the Telescope Config]
-- Fuzzy Finder
require  "plugins.telescope-setup"

-- [ Requires the Harpoon Config]
-- File Multiplexer
require  "plugins.harpoon-setup"

-- [ Requires the Rose Pine Colors Config ]
require  "plugins.rose-setup"

-- [ Requires the Cyberdream Colors Config ]
require  "plugins.cyberdream"

-- Setting the Default Colorscheme
vim.cmd('colorscheme cyberdream')

-- [ Requires General vim's keymaps ]
require  "keymaps"

-- [ Requires Undo Tree config ]
require  "plugins.undo-tree-setup"

-- [ Requires Oil's Config ]
-- File Explorer
require  "plugins.oil-setup"

-- [ Custom Functionalities ]
require  "custom.autoformat"
require  "custom.debug"
