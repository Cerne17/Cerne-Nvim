-- Autoreloading files as they change, without reopening neovim
vim.o.autoread = true
-- vim.api.nvim_create_autocmd({
--   "BufEnter",
--   "CursorHold",
--   "CursorHoldI",
--   command = "if mode() != 'c' | checktime | endif",
--   pattern = { "*" },
-- })
