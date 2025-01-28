return {
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    }
  }
}
-- Todo-comments options:
-- PERF: fully optimised
-- HACK: testing
-- TODO: self-explaining right?
-- NOTE: hmm, I don't know...
-- FIX: IMPORTANT
-- WARNING: hehe
