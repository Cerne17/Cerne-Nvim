-- Whatever colorscheme is picked via <leader>uC gets written here, so an
-- explicit choice survives restarts. If nothing's been explicitly picked
-- yet (or :CerneThemeAuto reset it back to "auto"), startup instead
-- follows the macOS system appearance and picks cerne / cerne-light —
-- same "explicit wins, otherwise follow system" model as the zsh/tmux
-- cerne-theme toggle.
local state_file = vim.fn.stdpath("state") .. "/cerne_colorscheme"

local function read_state()
  local f = io.open(state_file, "r")
  if not f then
    return nil
  end
  local val = f:read("*l")
  f:close()
  return val and val ~= "" and val or nil
end

local function write_state(val)
  local f = io.open(state_file, "w")
  if f then
    f:write(val)
    f:close()
  end
end

local function system_is_dark()
  local out = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
  return vim.v.shell_error == 0 and out:match("Dark") ~= nil
end

-- Set around any colorscheme application WE trigger programmatically
-- (startup, :CerneThemeAuto), so the persist-on-pick autocmd below can
-- tell that apart from an actual <leader>uC pick and not immediately
-- stomp the "auto" marker with the resolved theme name.
local applying_auto = false

local function pick_colorscheme()
  local saved = read_state()
  if saved and saved ~= "auto" then
    return saved
  end
  return system_is_dark() and "cerne" or "cerne-light"
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("cerne_persist_colorscheme", { clear = true }),
  callback = function()
    if applying_auto then
      return
    end
    local name = vim.g.colors_name
    if not name then
      return
    end
    write_state(name)
  end,
})

vim.api.nvim_create_user_command("CerneThemeAuto", function()
  write_state("auto")
  applying_auto = true
  vim.cmd.colorscheme(system_is_dark() and "cerne" or "cerne-light")
  applying_auto = false
end, { desc = "Resume following the macOS system light/dark appearance" })

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

  -- Default colorscheme on startup: an explicit <leader>uC pick is
  -- restored as-is; otherwise (nothing picked yet, or :CerneThemeAuto)
  -- follows the macOS system light/dark appearance.
  -- Dark options:  cerne (brand default, colors/cerne.lua),
  --                catppuccin-mocha, catppuccin-frappe, catppuccin-macchiato,
  --                rose-pine, rose-pine-moon, tokyonight, tokyonight-storm, tokyonight-night,
  --                gruvbox, kanagawa, kanagawa-wave, kanagawa-dragon,
  --                nightfox, duskfox, nordfox, terafox, carbonfox,
  --                everforest, onedark, nord, github_dark, github_dimmed
  -- Light options: cerne-light (brand default, colors/cerne-light.lua),
  --                catppuccin-latte, rose-pine-dawn, tokyonight-day, gruvbox (background=light),
  --                kanagawa-lotus, dayfox, dawnfox, everforest (background=light),
  --                onelight, github_light
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        applying_auto = true
        vim.cmd.colorscheme(pick_colorscheme())
        applying_auto = false
      end,
    },
  },
}
