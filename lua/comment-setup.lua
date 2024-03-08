require('Comment').setup()
M = {
  padding = true, -- White spacing
  sticky = true,  -- Cursor stays at the same position
  ignore = nil,   -- Lines ignored
  toggler = {     -- toggle mappings in NORMAL mode
    line = '<leader>/',
    ---Block-comment toggle keymap
    block = '<leader>g/',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = '<leader>/',
    ---Block-comment keymap
    block = '<leader>g/',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = true,
  },
  ---Function to call before (un)comment
  pre_hook = nil,
  ---Function to call after (un)comment
  post_hook = nil,
}

return M
