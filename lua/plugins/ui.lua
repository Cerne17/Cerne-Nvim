return {
  -- Disable noice: keep cmdline at the bottom, no fancy popups
  { "folke/noice.nvim", enabled = false },

  -- Disable tabline
  { "akinsho/bufferline.nvim", enabled = false },

  -- Snacks: disable dashboard and lazygit (using kdheepak/lazygit.nvim)
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      lazygit = { enabled = false },
    },
  },

  -- Minimal lualine: no powerline symbols, no noice components
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        options = {
          theme = "auto",
          globalstatus = true,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "lazy", "mason" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = { "trouble", "lazy" },
      }
    end,
  },
}
