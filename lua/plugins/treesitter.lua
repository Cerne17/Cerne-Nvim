return {
  -- Ensure C/C++ Treesitter parsers are installed for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
      },
    },
  },
}
