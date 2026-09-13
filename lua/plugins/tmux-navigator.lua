-- Ctrl+h/j/k/l crosses Neovim splits and tmux panes interchangeably. LazyVim
-- already maps these four to <C-w>h/j/k/l; the plugin's commands take over so
-- that hitting the edge of the window moves to the neighbouring tmux pane
-- instead of doing nothing. Requires `christoomey/vim-tmux-navigator` in the
-- tmux plugin list (see ~/dotfiles/.tmux.conf).
return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Window/Pane Left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window/Pane Down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window/Pane Up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window/Pane Right" },
    },
  },
}
