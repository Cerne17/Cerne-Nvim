local wk = require("which-key")

-- [[ START - Importing the plugins to set the mappings ]]
local telescope = require("telescope.builtin")
-- [[ END - Importing the plugins to set the mappings ]]

wk.add({
	-- [[ Telescope ]]
	{ "<leader>f", group = "find (telescope)" }, -- creates the searching grouping
	{ "<leader>ff", telescope.find_files, desc = "Find File", mode = "n" },
	{ "<leader>fb", telescope.buffers, desc = "Find in Buffers", mode = "n" },
	{ "<leader>fg", telescope.live_grep, desc = "Find with Live Grep", mode = "n" },
	{ "<leader>fc", telescope.colorscheme, desc = "Find Colorscheme", mode = "n" },
	{ "<leader>g", group = "git" }, -- creates the git grouping
	{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "Opens LazyGit", mode = "n" },
	{ "<leader>p", group = "Project" }, -- creates the project grouping
	{ "<leader>pv", "<cmd>Oil<CR>", desc = "Project View", mode = "n" },
})
