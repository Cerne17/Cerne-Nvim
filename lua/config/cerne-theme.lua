-- Mirrors the shell `cerne-theme` toggle (see dotfiles' .zshrc) so nvim
-- stays in sync with the cerne.pro dark/light brand palette. State lives in
-- stdpath("state") .. "/cerne_colorscheme" — the same path dotfiles'
-- bin/cerne-theme-watch.sh reads before remote-sending :CerneThemeAuto into
-- an already-running instance over its RPC server.
local M = {}

local state_file = vim.fn.stdpath("state") .. "/cerne_colorscheme"

local function system_is_dark()
  local ok, out = pcall(vim.fn.system, { "defaults", "read", "-g", "AppleInterfaceStyle" })
  return ok and vim.trim(out or "") == "Dark"
end

local function read_state()
  local f = io.open(state_file, "r")
  if not f then
    return "auto"
  end
  local state = vim.trim(f:read("*a") or "")
  f:close()
  if state == "light" or state == "dark" or state == "auto" then
    return state
  end
  return "auto"
end

local function write_state(state)
  vim.fn.mkdir(vim.fn.fnamemodify(state_file, ":h"), "p")
  local f = io.open(state_file, "w")
  if f then
    f:write(state)
    f:close()
  end
end

local function resolve(state)
  if state == "light" or state == "dark" then
    return state
  end
  return system_is_dark() and "dark" or "light"
end

local function apply(resolved)
  local name = resolved == "light" and "cerne-light" or "cerne"
  if not pcall(vim.cmd.colorscheme, name) then
    vim.notify("cerne.nvim unavailable, falling back to habamax", vim.log.levels.WARN)
    pcall(vim.cmd.colorscheme, "habamax")
  end
end

-- `:CerneTheme [light|dark|auto]` — no arg toggles the resolved polarity,
-- same UX as the shell's `cerne-theme`.
function M.set(arg)
  local want
  if arg == "light" or arg == "dark" or arg == "auto" then
    want = arg
  elseif arg == nil or arg == "" then
    want = resolve(read_state()) == "dark" and "light" or "dark"
  else
    vim.notify("usage: CerneTheme [light|dark|auto]", vim.log.levels.ERROR)
    return
  end
  write_state(want)
  apply(resolve(want))
end

-- `:CerneThemeAuto` — re-resolves from the system appearance and applies.
-- Invoked remotely by dotfiles' bin/cerne-theme-watch.sh on every macOS
-- Dark Mode toggle; only acts while the saved state is "auto" so an
-- explicit `:CerneTheme light|dark` pick stays put. Safe to run by hand.
function M.auto()
  local state = read_state()
  if state ~= "auto" then
    return
  end
  apply(resolve(state))
end

-- Apply the saved (or system-detected) theme once, on startup. Wired into
-- LazyVim's `colorscheme` option (see lua/plugins/colorschemes.lua) rather than
-- an autocmd, so the resolved polarity is applied in one shot -- setting a
-- hard-coded dark default there first made light mode flash dark on every boot.
function M.startup()
  apply(resolve(read_state()))
end

vim.api.nvim_create_user_command("CerneTheme", function(opts)
  M.set(opts.args ~= "" and opts.args or nil)
end, {
  nargs = "?",
  complete = function()
    return { "light", "dark", "auto" }
  end,
  desc = "Switch the cerne.pro colorscheme (light/dark/auto)",
})

vim.api.nvim_create_user_command("CerneThemeAuto", M.auto, {
  desc = "Re-sync colorscheme from macOS appearance (used by cerne-theme-watch.sh)",
})

return M
