local wk = require("which-key")

-- [[ START - Importing the plugins to set the mappings ]]
local telescope = require("telescope.builtin")
local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

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
	{ "<leader>h", group = "Harpoon"}, -- creates harpoon grouping
	{ "<leader>ha", function() harpoon:list():add() end, desc = "Harpoon add", mode = {"n", "v"} },
	{ "<leader>hh", function() harpoon:list():select(1) end, desc = "First file", mode = {"n", "v"} },
	{ "<leader>hj", function() harpoon:list():select(2) end, desc = "Second file", mode = {"n", "v"} },
	{ "<leader>hk", function() harpoon:list():select(3) end, desc = "Third file", mode = {"n", "v"} },
	{ "<leader>hl", function() harpoon:list():select(4) end, desc = "Fourth file", mode = {"n", "v"} },
	{ "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Opens harpoon list", mode = {"n", "v"} },
	{ "<C-S-P>", function() harpoon:list():prev() end, desc = "Previous harpoon file", mode = {"n", "v" } },
	{ "<C-S-N>", function() harpoon:list():next() end, desc = "Next harpoon file", mode = {"n", "v" } },
})
