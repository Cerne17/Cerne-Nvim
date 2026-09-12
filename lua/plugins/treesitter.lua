return {
  -- Parsers for every language in active use. LazyVim installs a base set
  -- (lua, vim, markdown, ...) but not these, so highlighting and the
  -- treesitter-backed text objects silently fell back to regex syntax.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "javascript",
        "json",
        "jsonc",
        "python",
        "tsx",
        "typescript",
        "yaml",
      },
    },
  },
}
