return {
  -- Rose Pine (new — not in default LazyVim install)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      variant = "moon",
    },
  },

  -- Catppuccin is already installed; set flavour to mocha
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha",
    },
  },

  -- Default colorscheme on startup
  -- Switch at runtime with <leader>uC (Telescope colorscheme picker)
  -- Available: catppuccin-mocha, catppuccin-latte, catppuccin-frappe,
  --            rose-pine, rose-pine-moon, rose-pine-dawn, tokyonight, etc.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
