vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")

-- [[ Plugins Settings Section START ]]

-- [[ Autocompletion Settings ]]
require("config.cmp")

-- [[ Gitsigns Settings ]]
require("config.gitsigns")

-- [[ LSP Settings ]]
require("config.lsp")

-- [[ Plugins Settings Section END ]]

-- [[ Personal Settings ]]
-- Not related to any plugins
require("cerne.init")

