return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    -- Moved off <leader>tc: <leader>t is LazyVim's test group (neotest), and a
    -- <leader>t* leaf there would shadow it. <leader>c is the code group, and
    -- <leader>cs / <leader>cS are already Trouble symbols, hence cp: code picture.
    keys = {
      { "<leader>cp", "<cmd>CodeSnapHighlight<cr>", mode = "x", desc = "Copy Code Snapshot" },
    },
    opts = {
      has_breadcrumbs = true,
      show_workspace = true,
      has_line_number = true,
      watermark = "",
    },
  },
}
