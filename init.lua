-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
-- (Package manager)
require 'lazy-bootstrap'

-- [[ Configure plugins ]]
-- (lazy install and load plugins)
require 'lazy-plugins'

-- [[ Setting options ]]
-- (General settings from nvim)
require 'options'

-- [[ Basic Keymaps ]]
-- (General Keymaps not related to plugins)
require 'keymaps'

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require 'telescope-setup'

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require 'treesitter-setup'

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require 'lsp-setup'

-- [[ Configure nvim-cmp ]]
-- (completion)
require 'cmp-setup'

-- [[Configure Harpoon]]
-- (multifile working)
require 'harpoon-setup'

-- [[Configure Transparent]]
-- (Background Transparency)
require 'transparent-setup'

--[[ Configure Copilot ]]
-- (Coding Assistant)
require 'copilot-setup'

--[[ Configure Oil ]]
-- (File Explorer)
require 'oil-setup'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
