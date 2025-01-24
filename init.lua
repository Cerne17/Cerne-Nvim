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

-- [[ Oil Navigation Settings ]]
-- nvim oil-ssh://[username@]hostname[:port]/[path] -> opens nvim on ssh
require("config.oil")

-- [[ Plugins Related Mappings ]]
require("config.keymappings")

-- [[ Plugins Settings Section END ]]

-- [[ Personal Settings ]]
-- Not related to any plugins
require("cerne.init")

