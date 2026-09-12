-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>pv", "<cmd>Oil<cr>", { desc = "Project View (Oil)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Browse the config by category instead of searching it. <leader>fk (plain
-- Telescope keymaps) needs a search term; this one is for "what can this
-- config even do?" -- categories first, each previewing its keymaps.
vim.keymap.set("n", "<leader>fK", function()
  require("config.keymap-explorer").categories()
end, { desc = "Keymap Explorer (by category)" })

vim.keymap.set("n", "<leader>fA", function()
  require("config.keymap-explorer").keymaps()
end, { desc = "Keymaps: all, with category" })

vim.api.nvim_create_user_command("KeymapExplorer", function()
  require("config.keymap-explorer").categories()
end, { desc = "Browse keymaps by category" })
