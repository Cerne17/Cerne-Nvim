-- Telescope is not in the LazyVim v8 default install (snacks.picker is the
-- default). This adds it as the primary fuzzy finder and overrides the
-- snacks.picker keymaps for the operations we care about.
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    keys = {
      -- Explicit cwd on the file-based pickers: telescope's default
      -- (vim.uv.cwd()) throws "path: expected string, got nil" if the
      -- shell's working directory has been deleted out from under the
      -- process — falls back to $HOME so these always have somewhere to open.
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ cwd = vim.uv.cwd() or vim.env.HOME })
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({ cwd = vim.uv.cwd() or vim.env.HOME })
        end,
        desc = "Live Grep",
      },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Symbols" },
      { "<leader>uC", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme Picker" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find Diagnostics" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    },
    opts = {
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
        file_ignore_patterns = { "node_modules", "%.git/" },
      },
    },
  },
}
