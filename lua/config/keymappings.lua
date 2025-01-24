local wk = require("which-key")

-- [[ START - Importing the plugins to set the mappings ]]
local telescope = require("telescope.builtin")
-- [[ END - Importing the plugins to set the mappings ]]

-- [[ Telescope ]]
wk.add({
	{"<leader>f", group = "find (telescope)"}, -- creates the grouping
	{ "<leader>ff", telescope.find_files, desc = "Find File", mode = "n" },
	{ "<leader>fb", telescope.buffers, desc = "Find in Buffers", mode = "n" },
	{ "<leader>fg", telescope.live_grep, desc = "Find with Live Grep", mode = "n" },
	{ "<leader>fc", telescope.colorscheme, desc = "Find Colorscheme", mode = "n" },
})
