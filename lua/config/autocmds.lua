-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- cerne.pro brand palette: force dashboard highlights regardless of active
-- colorscheme, so the startup page stays on-brand even after <leader>uC.
local cerne = {
  heartwood = "#E89A3C",
  heartwood_glow = "#F6B65A",
  sapwood = "#4E8F6B",
  text = "#E8E4DB",
  text_muted = "#9A968C",
}

local function set_dashboard_highlights()
  vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = cerne.heartwood, bold = true })
  vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = cerne.text })
  vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = cerne.heartwood_glow, bold = true })
  vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = cerne.sapwood })
  vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = cerne.text_muted, italic = true })
  vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = cerne.heartwood_glow })
end

vim.api.nvim_create_augroup("cerne_dashboard_theme", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "cerne_dashboard_theme",
  callback = set_dashboard_highlights,
})
set_dashboard_highlights()
