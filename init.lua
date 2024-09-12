-- [ Sets the leader key ]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [ Installs Lazy Package Manager ]
require("cerne.lazy-pm")

-- [ Sets the default vim options ]
require("cerne.options")

-- [ Requires the basic plugins installations ]
require("cerne.lazy-plugins")

-- [ Requires the Rose Pine Colors Config ]
require("cerne.plugins.rose-setup")

-- [ Requires General vim's keymaps ]
require("cerne.keymaps")
