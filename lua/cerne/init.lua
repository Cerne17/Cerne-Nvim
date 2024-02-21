-- Sets the leader to be the space key
vim.g.mapleader = " "

-- The files required here get automatically sourced every time nvim opens
require("cerne.remap")
require("cerne.lazy")
print("Hello from Cerne")
