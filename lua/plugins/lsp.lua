return {
  -- Ensure language servers and tools are installed via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "clang-format",
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
      -- Base configuration for these servers comes from the LazyVim lang
      -- extras enabled in lazyvim.json. Only genuine deviations belong here --
      -- anything else is a copy that silently drifts from upstream.
      servers = {
        -- lang.python already selects pyright + ruff (its defaults). The venv
        -- hook is the deviation: point pyright at the active virtualenv so it
        -- resolves third-party imports instead of flagging them as missing.
        pyright = {
          before_init = function(_, config)
            local venv = vim.env.VIRTUAL_ENV
            if venv then
              config.settings.python.pythonPath = venv .. "/bin/python"
            end
          end,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
        -- Lua: lazydev.nvim provides Neovim API types automatically
        lua_ls = {},

        -- C / C++: lang.clangd provides the server; these flags are the
        -- deviation from its defaults.
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            -- Stays a bare named style: clangd validates --fallback-style
            -- against its built-in names only. Inline YAML and file:<path>
            -- are both rejected, and clangd then falls back to LLVM
            -- *silently* (the reason only shows at log level info), which
            -- is further from the intent than plain mozilla. Formatting on
            -- save goes through conform below, which does take the full
            -- style string.
            "--fallback-style={BasedOnStyle: mozilla, BreakAfterReturnType: None, AlwaysBreakAfterDefinitionReturnType: None}",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },

        -- JavaScript / TypeScript: lang.typescript selects vtsls and disables
        -- ts_ls, so no server entry is needed here. eslint is not part of that
        -- extra and stays hand-configured.
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
        -- Order matters: sort and prune imports first, then reformat.
        python = { "ruff_organize_imports", "ruff_format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
      },
      -- clang-format ignores clangd's --fallback-style flag (that flag only
      -- covers clangd's own formatting requests). This mirrors the fallback
      -- here so a project with no .clang-format still formats as Mozilla on
      -- save; a project's own .clang-format still wins over this.
      --
      -- Mozilla puts the return type on its own line for definitions. Both
      -- keys below are needed to stop that: setting either one alone still
      -- breaks, because the base style's other key survives and wins.
      formatters = {
        ["clang-format"] = {
          prepend_args = {
            "--style={BasedOnStyle: mozilla, BreakAfterReturnType: None, AlwaysBreakAfterDefinitionReturnType: None}",
          },
        },
      },
    },
  },

  -- No nvim-lint entry for Python: the `ruff` LSP above already publishes lint
  -- diagnostics, and running both duplicated every warning. eslint diagnostics
  -- likewise come from the eslint LSP server.
}
