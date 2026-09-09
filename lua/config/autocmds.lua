-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Registers :CerneTheme / :CerneThemeAuto and applies the saved (or
-- system-detected) cerne/cerne-light colorscheme, keeping nvim in sync with
-- macOS Dark Mode the same way dotfiles' zsh `cerne-theme` does.
require("config.cerne-theme").startup()
