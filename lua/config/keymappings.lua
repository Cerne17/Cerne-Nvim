local wk = require("which-key")

-- [[ Telescope ]]
wk.add({
	{"<leader>f", group = "find (telescope)"}, -- creates the grouping
	{ "<leader>ff", "<cmd>Telescope find_file<CR>", desc = "Find File", mode = "n" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find in Buffers", mode = "n" },
	{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find with Live Grep", mode = "n" },
	{ "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Find Colorscheme", mode = "n" },
})
