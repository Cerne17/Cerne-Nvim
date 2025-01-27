vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")

-- [[ Plugins Settings Section START ]]

-- [[ Autocompletion Settings ]]
-- require("config.cmp")

-- [[ Gitsigns Settings ]]
require("config.gitsigns")

-- [[ LSP Settings ]]
require("config.lsp")

-- [[ Oil Navigation Settings ]]
-- nvim oil-ssh://[username@]hostname[:port]/[path] -> opens nvim on ssh
require("config.oil")

-- [[ Status Line Customization ]]
require("config.statusline")

-- [[ Harpoon Config ]]
require("config.harpoon")

-- [[ Copilot Config ]]
require("config.copilot")

-- [[ Indentation Config ]]
require("config.indent")

-- [[ Alpha Config ]]
-- Dashboard for nvim initialization
require("config.dashboard")

-- [[ Plugins Related Mappings ]]
require("config.keymappings")

-- [[ Plugins Settings Section END ]]

-- [[ Personal Settings ]]
-- Not related to any plugins
require("cerne.init")

