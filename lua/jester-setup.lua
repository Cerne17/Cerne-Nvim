local jester = require("jester")

jester.setup({
  dap = {
    lazy = true,
    console = "externalConsole",
  }
})

vim.keymap.set("n", "<leader>jr<CR>", function() jester.run_file() end, { desc = "Runs the tests in the current file." })
vim.keymap.set("n", "<leader>jd<CR>", function() jester.debug_file() end,
  { desc = "Debugs the Current file's tests." })
