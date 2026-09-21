return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    -- Moved off <leader>tc: <leader>t is LazyVim's test group (neotest), and a
    -- <leader>t* leaf there would shadow it. <leader>c is the code group, and
    -- <leader>cs / <leader>cS are already Trouble symbols, hence cp: code picture.
    --
    -- `:<C-u>` rather than `<cmd>`: CodeSnap reads the '< and '> marks, and a
    -- <cmd> mapping does not leave visual mode, so the marks still hold the
    -- PREVIOUS selection. Typing `:` ends visual mode and sets them, and <C-u>
    -- drops the '<,'> range Vim prefills (CodeSnap ignores the range anyway).
    -- cp is the plain snapshot; cP opens the picker that tints chosen lines
    -- with highlight_color -- that tint is why every snapshot used to look
    -- washed out, since cp was bound to the highlight variant.
    keys = {
      { "<leader>cp", ":<C-u>CodeSnap<cr>", mode = "x", desc = "Copy Code Snapshot" },
      { "<leader>cP", ":<C-u>CodeSnapHighlight<cr>", mode = "x", desc = "Copy Code Snapshot (highlight lines)" },
    },
    -- Branded like the rest of the config: the code window uses cerne (dark),
    -- the background gradient uses cerne-light. codesnap renders through
    -- syntect, not Neovim, so the code theme is a hand-ported Sublime theme in
    -- codesnap/themes/cerne.tmTheme rather than the live colorscheme -- it does
    -- NOT follow :CerneTheme at runtime.
    -- Everything below `snapshot_config` is passed to the Rust side; top-level
    -- keys other than show_line_number / show_workspace / highlight_color are
    -- silently ignored, so breadcrumbs and watermark have to be nested.
    opts = {
      show_line_number = true,
      show_workspace = true,
      -- Only used by <leader>cP. Heartwood at ~14% instead of the default
      -- white, which tinted the ink background a flat grey.
      highlight_color = "#E89A3C24",
      snapshot_config = {
        themes_folders = { "~/.config/nvim/codesnap/themes" },
        theme = "cerne",
        -- cerne-light: surface -> surface2, top-left to bottom-right.
        background = {
          start = { x = 0, y = 0 },
          ["end"] = { x = "max", y = "max" },
          stops = {
            { position = 0, color = "#F5F4F0" },
            { position = 1, color = "#D8D5CC" },
          },
        },
        -- cerne dark text_muted, matching the editor's LineNr.
        line_number_color = "#9A968C",
        code_config = {
          breadcrumbs = {
            enable = true,
            color = "#9A968C",
          },
        },
        window = {
          -- A light rim so the dark window separates from the light gradient;
          -- the default #ffffff30 disappears against it.
          border = { width = 1, color = "#ECEBE640" },
          title_config = { color = "#E8E4DB" },
        },
        watermark = { content = "" },
      },
    },
  },
}
