-- Guard against a stale/deleted process cwd. If the shell nvim was
-- launched from was sitting in a directory that no longer exists,
-- vim.uv.cwd() and plenary's lazy Path._cwd (both real getcwd()-style
-- syscalls, unlike the cached vim.fn.getcwd()) resolve to nil — which
-- surfaces as confusing "table index is nil" / "invalid value (nil) ...
-- for 'concat'" crashes deep in Telescope's previewer and Harpoon's
-- project-key lookup. Fix it here, once, before anything else loads.
if not vim.uv.fs_realpath(".") then
  vim.cmd.cd(vim.env.HOME)
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
