-- The coding.yanky extra puts the yank-history picker on <leader>p, which
-- collides with <leader>pv (Oil): a leaf mapping sharing a prefix with a longer
-- one makes the leaf wait out 'timeoutlen' on every press. Move it to
-- <leader>P, pairing with vim's own p/P, and leave <leader>p to Oil.
--
-- Rewriting the lhs in place rather than redefining the mapping keeps the
-- extra's picker-dispatch logic as the single source of truth.
return {
  {
    "gbprod/yanky.nvim",
    keys = function(_, keys)
      for _, key in ipairs(keys) do
        if key[1] == "<leader>p" then
          key[1] = "<leader>P"
        end
      end
      return keys
    end,
  },
}
