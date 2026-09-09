-- Whatever colorscheme is active gets written here on every ColorScheme
-- event (see below), so the choice survives restarts. Falls back to the
-- cerne.pro brand colorscheme (colors/cerne.lua) if nothing saved yet.
local state_file = vim.fn.stdpath("state") .. "/cerne_colorscheme"

local function read_saved_colorscheme()
  local f = io.open(state_file, "r")
  if not f then
    return nil
  end
  local name = f:read("*l")
  f:close()
  return name and name ~= "" and name or nil
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("cerne_persist_colorscheme", { clear = true }),
  callback = function()
    local name = vim.g.colors_name
    if not name then
      return
    end
    local f = io.open(state_file, "w")
    if f then
      f:write(name)
      f:close()
    end
  end,
})

return {
  -- Rose Pine (dark: main/moon, light: dawn)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      variant = "moon",
    },
  },

  -- Catppuccin (dark: mocha/frappe/macchiato, light: latte)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha",
    },
  },

  -- Tokyonight (dark: night/storm/moon, light: day)
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "storm",
    },
  },

  -- Gruvbox (dark + light via background)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {},
  },

  -- Kanagawa (dark: wave/dragon, light: lotus)
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {},
  },

  -- Nightfox (dark: nightfox/duskfox/nordfox/terafox/carbonfox, light: dayfox/dawnfox)
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {},
  },

  -- Everforest (dark + light via background)
  {
    "sainnhe/everforest",
    lazy = true,
    init = function()
      vim.g.everforest_background = "medium"
    end,
  },

  -- OneDark (dark: dark/darker/cool/deep/warm, light: light)
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = {
      style = "dark",
    },
  },

  -- Nord (dark)
  {
    "gbprod/nord.nvim",
    lazy = true,
    opts = {},
  },

  -- GitHub theme (dark/dimmed + light)
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
    opts = {},
  },

  -- Default colorscheme on startup
  -- Switch at runtime with <leader>uC (Telescope colorscheme picker, live preview) —
  -- the pick is persisted automatically and restored on the next launch.
  -- Dark options:  cerne (brand default, colors/cerne.lua),
  --                catppuccin-mocha, catppuccin-frappe, catppuccin-macchiato,
  --                rose-pine, rose-pine-moon, tokyonight, tokyonight-storm, tokyonight-night,
  --                gruvbox, kanagawa, kanagawa-wave, kanagawa-dragon,
  --                nightfox, duskfox, nordfox, terafox, carbonfox,
  --                everforest, onedark, nord, github_dark, github_dimmed
  -- Light options: catppuccin-latte, rose-pine-dawn, tokyonight-day, gruvbox (background=light),
  --                kanagawa-lotus, dayfox, dawnfox, everforest (background=light),
  --                onelight, github_light
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.cmd.colorscheme(read_saved_colorscheme() or "cerne")
      end,
    },
  },
}
