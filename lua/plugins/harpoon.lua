-- Harpoon lists are scoped per git branch, so a feature branch gets its own
-- set of marks and switching back restores the previous one.
local function branch_scoped_key()
  local cwd = vim.uv.cwd() or vim.env.HOME
  local dotgit = vim.fs.find(".git", { upward = true, path = cwd })[1]
  if not dotgit then
    return cwd
  end

  -- A worktree or submodule has .git as a file holding "gitdir: <path>".
  local gitdir = dotgit
  if vim.fn.isdirectory(dotgit) == 0 then
    local pointer = (vim.fn.readfile(dotgit)[1] or ""):match("^gitdir:%s*(.+)$")
    if not pointer then
      return cwd
    end
    gitdir = vim.fs.normalize(pointer)
  end

  -- Read .git/HEAD directly rather than shelling out to git: this runs on
  -- every list access, and a subprocess per keypress is noticeable.
  local head = (vim.fn.readfile(gitdir .. "/HEAD")[1] or ""):match("^ref: refs/heads/(.+)$")
  return head and (cwd .. "#" .. head) or cwd
end

local function mark(n)
  return {
    "<leader>" .. n,
    function()
      require("harpoon"):list():select(n)
    end,
    desc = "Harpoon File " .. n,
  }
end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- <leader>a is the claudecode.nvim group prefix; harpoon add lives on
      -- <leader>h so neither has to wait out 'timeoutlen'. Keep <leader>h a
      -- leaf mapping for the same reason -- no <leader>h* siblings.
      {
        "<leader>h",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon Add File",
      },
      {
        "<C-e>",
        function()
          local h = require("harpoon")
          h.ui:toggle_quick_menu(h:list())
        end,
        desc = "Harpoon Menu",
      },
      mark(1),
      mark(2),
      mark(3),
      mark(4),
      mark(5),
      mark(6),
      mark(7),
      mark(8),
      mark(9),
    },
    config = function()
      require("harpoon"):setup({
        settings = {
          key = branch_scoped_key,
          save_on_toggle = true,
        },
      })
    end,
  },
}
