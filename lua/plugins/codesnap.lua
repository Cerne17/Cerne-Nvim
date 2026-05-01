return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<leader>tc", "<cmd>CodeSnapHighlight<cr>", mode = "x", desc = "Copy Code Snapshot" },
    },
    opts = {
      has_breadcrumbs = true,
      show_workspace = true,
      has_line_number = true,
      watermark = "",
    },
  },
}
