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
  -- Switch at runtime with <leader>uC (Telescope colorscheme picker, live preview)
  -- Dark options:  catppuccin-mocha, catppuccin-frappe, catppuccin-macchiato,
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
      colorscheme = "catppuccin-mocha",
    },
  },
}
