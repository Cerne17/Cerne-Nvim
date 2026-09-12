-- Telescope replaces snacks.picker as the fuzzy finder. The heavy lifting is
-- done by `lazyvim.plugins.extras.editor.telescope` (enabled in lazyvim.json),
-- which registers Telescope as LazyVim's picker backend -- that reroutes every
-- <leader>f*, <leader>s* and <leader>g* picker, plus fzf-native with automatic
-- rebuild handling. Only the deviations from it live here.
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- The extra puts git_files on <leader>fg. Keep live grep there instead:
      -- <leader>sg is the LazyVim-native spelling, but the muscle memory here
      -- is fg. Requires ripgrep.
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      -- Not provided by the extra.
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Symbols" },
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
