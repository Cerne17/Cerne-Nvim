return {
  -- Ensure language servers and tools are installed via Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "lua-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "stylua",
        "prettier",
      },
    },
  },

  -- LSP server configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      diagnostics = {
        virtual_text = { prefix = "●" },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      },
      servers = {
        -- Python: type checking via pyright, linting/formatting via ruff
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        ruff = {},

        -- Lua: lazydev.nvim provides Neovim API types automatically
        lua_ls = {},

        -- JavaScript / TypeScript
        ts_ls = {},
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
      },
    },
  },

  -- Linting (eslint diagnostics come from the LSP server above)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
      },
    },
  },
}
