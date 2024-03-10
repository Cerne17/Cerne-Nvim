local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>m", function() harpoon:list():append() end, { desc = "Add current file to harpoon list" })
vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
  { desc = "Toggle harpoon list (without telescope)" })

vim.keymap.set("n", "<C-h><C-h>", function() harpoon:list():select(1) end, { desc = "[H]arpoon Fisrt File" })
vim.keymap.set("n", "<C-h><C-j>", function() harpoon:list():select(2) end, { desc = "[H]arpoon Second File" })
vim.keymap.set("n", "<C-h><C-k>", function() harpoon:list():select(3) end, { desc = "[H]arpoon Third File" })
vim.keymap.set("n", "<C-h><C-l>", function() harpoon:list():select(4) end, { desc = "[H]arpoon Fourth File" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "[H]arpoon Next File" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "[H]arpoon Previous File" })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
  { desc = "Open harpoon window" })
