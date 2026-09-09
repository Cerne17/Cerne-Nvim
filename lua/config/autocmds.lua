-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- cerne.pro brand palette: force dashboard highlights on any THIRD-PARTY
-- colorscheme (catppuccin, rose-pine, etc — picked via <leader>uC), so the
-- startup page stays on-brand even when the active theme doesn't know
-- about Snacks. Skipped entirely for cerne/cerne-light themselves, which
-- already set these groups correctly for their own polarity in
-- colors/cerne.lua and colors/cerne-light.lua — this function used to
-- unconditionally reapply the DARK tokens after every ColorScheme event,
-- which stomped cerne-light's light-safe values and made dashboard text
-- (SnacksDashboardDesc, near-white) nearly invisible on its light bg.
local dark = {
  header = "#E89A3C", -- heartwood
  desc = "#E8E4DB", -- text
  key = "#F6B65A", -- heartwood-glow
  icon = "#4E8F6B", -- sapwood
  footer = "#9A968C", -- text-muted
}
local light = {
  header = "#8C3B24", -- oxblood stands in for heartwood on light
  desc = "#1A1B1E", -- text
  key = "#8C3B24", -- oxblood stands in for heartwood-glow on light too
  icon = "#3A6E52", -- sapwood (light)
  footer = "#5A5852", -- text-muted (light)
}

local function set_dashboard_highlights()
  local name = vim.g.colors_name or ""
  if name == "cerne" or name == "cerne-light" then
    return
  end
  local t = (vim.o.background == "light") and light or dark
  vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = t.header, bold = true })
  vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = t.desc })
  vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = t.key, bold = true })
  vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = t.icon })
  vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = t.footer, italic = true })
  vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = t.key })
end

vim.api.nvim_create_augroup("cerne_dashboard_theme", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "cerne_dashboard_theme",
  callback = set_dashboard_highlights,
})
set_dashboard_highlights()

-- Same stale-cwd guard as init.lua's startup check (see there for the
-- full explanation), re-run on every :cd/:lcd/:tcd. init.lua only covers
-- the directory nvim was launched into; this catches one becoming
-- invalid afterwards (e.g. `:cd` into a path a script then deletes).
vim.api.nvim_create_autocmd("DirChanged", {
  group = vim.api.nvim_create_augroup("cerne_cwd_guard", { clear = true }),
  callback = function()
    if not vim.uv.fs_realpath(".") then
      vim.notify("cwd no longer exists, falling back to $HOME", vim.log.levels.WARN)
      vim.cmd.cd(vim.env.HOME)
    end
  end,
})
