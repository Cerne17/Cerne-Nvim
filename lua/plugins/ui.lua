return {
  -- Disable noice: keep cmdline at the bottom, no fancy popups
  { "folke/noice.nvim", enabled = false },

  -- Disable tabline
  { "akinsho/bufferline.nvim", enabled = false },

  -- Snacks: cerne.pro branded dashboard, lazygit disabled (using kdheepak/lazygit.nvim)
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = { enabled = false },
      dashboard = {
        enabled = true,
        preset = {
          header = [[
    ◯  ◎  ◉  ◎  ◯
 _______ _______  ___
/ __/ -_) __/ _ \/ -_)
\__/\__/_/ /_//_/\__/
  // core, unshaken]],
          ---@type snacks.dashboard.Item[]
          keys = {
            -- Explicit cwd: telescope's default (vim.uv.cwd()) crashes with
            -- "path: expected string, got nil" if the shell's actual working
            -- directory has been deleted out from under the process — falls
            -- back to $HOME so the picker always has somewhere valid to open.
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = function()
                require("telescope.builtin").find_files({ cwd = vim.uv.cwd() or vim.env.HOME })
              end,
            },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = function()
                require("telescope.builtin").live_grep({ cwd = vim.uv.cwd() or vim.env.HOME })
              end,
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = function()
                require("telescope.builtin").oldfiles({ cwd = vim.uv.cwd() or vim.env.HOME })
              end,
            },
            { icon = " ", key = "e", desc = "Explorer", action = ":Oil" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header", padding = 1 },
          { section = "keys" },
          { section = "startup" },
        },
      },
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
