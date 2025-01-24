wk = require("which-key")
wk.add({
	-- Diagnostics
	{ "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic message", mode = "n" },
	{ "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic message", mode = "n" },
	{ "<leader>e", vim.diagnostic.open_float, desc = "Opens floating diagnostic message", mode = "n" },
	{ "<leader>q", vim.diagnostic.setloclist, desc = "Opens diagnostic list", mode = "n" },

	-- Better Movement
	{ "<C-u>", "<C-u>zz", desc = "Moves cursor half-screen up and centers it", mode = { "n", "v", "x" } },
	{ "<C-d>", "<C-d>zz", desc = "Moves cursor half-screen down and centers it", mode = { "n", "v", "x" } },
})
