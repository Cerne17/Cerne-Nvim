-- LazyVim v8 ships blink.cmp (not nvim-cmp). This configures ghost text,
-- signature help, and auto-show documentation.
return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = { enabled = true },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
      signature = { enabled = true },
    },
  },
}
