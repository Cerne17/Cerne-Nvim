-- Browsable, categorised view of every keymap that has a description.
--
-- `<leader>fk` (plain Telescope keymaps) answers "what was that key?" -- it
-- needs a search term. This answers the other question: "what can this config
-- even do?". Categories are listed first, each preview showing its keymaps, so
-- the whole set can be skimmed without typing anything or reading all 400+.
--
-- Everything is read from the live keymap table, so it can never drift from
-- the config the way a hand-written cheatsheet does.
local M = {}

-- First matching rule wins, so order from specific to generic. `lhs` patterns
-- match the display form (leader already expanded); `desc` patterns match the
-- description, and catch plugins that do not share a common prefix.
local CATEGORIES = {
  -- Listed first purely for matching precedence: these patterns are narrow,
  -- and mini.pairs binds [ and ], which Navigation would otherwise claim.
  {
    name = "Vim Built-ins",
    desc = { "^:help .*%-default$" },
  },
  {
    name = "Auto-pairs",
    desc = { "MiniPairs", "[Oo]pen action for", "Close action for", "Closeopen action" },
  },
  {
    name = "Plugin Manager / Config",
    lhs = { "^<leader>[lL]$" },
    desc = { "^Lazy$", "^LazyVim Changelog$", "Mason" },
  },
  {
    name = "AI / Claude Code",
    lhs = { "^<leader>a" },
  },
  {
    name = "Debug (DAP)",
    lhs = { "^<leader>d" },
    desc = { "[Dd]ap", "[Bb]reakpoint", "Step [IOB]" },
  },
  {
    name = "Test (Neotest)",
    lhs = { "^<leader>t" },
    desc = { "Neotest", "[Tt]est" },
  },
  {
    name = "Git",
    lhs = { "^<leader>g", "^[%[%]]h" },
    desc = { "[Gg]it", "[Hh]unk", "[Bb]lame", "[Cc]ommit", "[Ss]tash", "azy[Gg]it" },
  },
  {
    name = "Harpoon",
    lhs = { "^<C%-e>$" },
    desc = { "Harpoon" },
  },
  {
    name = "Diagnostics / Trouble / Lists",
    lhs = { "^<leader>x", "^[%[%]][dDeEwW]$" },
    desc = { "[Dd]iagnostic", "Trouble", "[Qq]uickfix", "[Ll]ocation [Ll]ist", "[Ee]rror", "Todo" },
  },
  {
    name = "LSP / Code Actions",
    lhs = { "^<leader>c", "^gr", "^gO$", "^<leader>K$" },
    desc = {
      "vim%.lsp",
      "LSP",
      "[Rr]ename",
      "[Cc]ode [Aa]ction",
      "[Ff]ormat",
      "[Ss]ymbol",
      "[Dd]efinition",
      "[Rr]eferences",
      "[Ii]nlay",
      "Keywordprg",
    },
  },
  {
    name = "Search / Pickers",
    lhs = { "^<leader>s", "^<leader>/$", "^<leader>:$", "^<leader><space>$" },
    desc = { "[Gg]rep", "[Pp]icker", "Telescope", "[Ss]earch", "[Hh]istory", "[Rr]esume" },
  },
  {
    name = "Files / Explorer / Projects",
    lhs = { "^<leader>f", "^<leader>p", "^<leader>e", "^<leader>%-$" },
    desc = { "[Ff]ile", "[Ee]xplorer", "Oil", "[Pp]roject", "[Rr]ecent" },
  },
  {
    name = "Buffers / Windows / Tabs",
    lhs = { "^<leader>b", "^<leader>w", "^<leader><tab>", "^<C%-[WHJKLhjkl]>", "^[%[%]][bB]$" },
    desc = { "[Bb]uffer", "[Ww]indow", "[Ss]plit", "[Tt]ab " },
  },
  {
    name = "Editing / Yank / Surround / Comments",
    lhs = {
      "^gs",
      "^gc",
      "^<leader>P$",
      "^[ypP]$",
      "^g[pP]$",
      "^[%[%]][pPy]$",
      "^[<>]p$",
      "^<M%-[jk]>$",
      "^<leader>[<>]",
      "^=[pP]$",
      "^<C%-Space>$",
    },
    desc = {
      "[Yy]ank",
      "[Pp]ut Text",
      "[Pp]ut [BA]",
      "[Ss]urround",
      "[Cc]omment",
      "[Ii]ndent",
      "[Dd]uplicate",
      "Move [Ll]ine",
      "Incremental Selection",
    },
  },
  {
    name = "Text Objects",
    desc = { "textobject", "[Tt]ext [Oo]bject" },
  },
  {
    name = "UI / Toggles",
    lhs = { "^<leader>u" },
    desc = { "[Tt]oggle", "[Cc]olorscheme", "[Zz]en", "[Dd]im" },
  },
  {
    name = "Session / Quit",
    lhs = { "^<leader>q" },
    desc = { "[Ss]ession", "[Qq]uit", "[Rr]estore" },
  },
  {
    name = "Terminal",
    desc = { "[Tt]erminal" },
  },
  {
    name = "Navigation / Motions",
    lhs = { "^[%[%]]", "^[nN]$", "^[sS]$", "^[jk]$", "^<[UD][po]", "^<Left>$", "^<Right>$" },
    desc = { "Flash", "[Jj]ump", "Next ", "Prev", "Move to", "[Ss]croll" },
  },
}

local FALLBACK = "Other"

local function matches(patterns, text)
  for _, pattern in ipairs(patterns or {}) do
    if text:match(pattern) then
      return true
    end
  end
  return false
end

local function categorise(lhs, desc)
  for _, category in ipairs(CATEGORIES) do
    if matches(category.lhs, lhs) or matches(category.desc, desc) then
      return category.name
    end
  end
  return FALLBACK
end

-- lhs as nvim reports it uses a raw space for <leader>; spell it out so it
-- reads the way the config and the docs write it.
local function display_lhs(lhs)
  return (lhs:gsub("^ ", "<leader>"))
end

-- Which plugin contributed a mapping, taken from lazy.nvim's `keys` specs.
-- More useful than debug.getinfo, which reports lazy's own stub for anything
-- not yet loaded.
local function plugin_owners()
  local owners = {}
  local ok, config = pcall(require, "lazy.core.config")
  if not ok then
    return owners
  end
  for name, plugin in pairs(config.plugins) do
    -- `keys` may be a function (this config uses one to rewrite yanky's lhs),
    -- in which case the resolved mappings are not inspectable here.
    if type(plugin.keys) == "table" then
      for _, spec in ipairs(plugin.keys) do
        local lhs = type(spec) == "string" and spec or spec[1]
        if type(lhs) == "string" then
          owners[lhs] = name
        end
      end
    end
  end
  return owners
end

local MODES = { "n", "i", "v", "x", "o", "t", "c" }

-- One entry per lhs, collecting the modes it is bound in.
function M.collect()
  local owners = plugin_owners()
  local seen, entries = {}, {}

  for _, mode in ipairs(MODES) do
    for _, map in ipairs(vim.api.nvim_get_keymap(mode)) do
      if map.desc and map.desc ~= "" and map.desc ~= "which_key_ignore" then
        local lhs = display_lhs(map.lhs)
        local key = lhs .. "\0" .. map.desc
        if seen[key] then
          table.insert(seen[key].modes, mode)
        else
          local entry = {
            lhs = lhs,
            desc = map.desc,
            modes = { mode },
            plugin = owners[lhs],
            category = categorise(lhs, map.desc),
          }
          seen[key] = entry
          table.insert(entries, entry)
        end
      end
    end
  end

  table.sort(entries, function(a, b)
    if a.category ~= b.category then
      return a.category < b.category
    end
    return a.lhs < b.lhs
  end)
  return entries
end

function M.by_category()
  local groups, order = {}, {}
  for _, entry in ipairs(M.collect()) do
    if not groups[entry.category] then
      groups[entry.category] = {}
      table.insert(order, entry.category)
    end
    table.insert(groups[entry.category], entry)
  end
  table.sort(order, function(a, b)
    return #groups[a] > #groups[b]
  end)
  return groups, order
end

local function format_entry(entry)
  local modes = table.concat(entry.modes, ",")
  local line = string.format("  %-22s %-6s %s", entry.lhs, modes, entry.desc)
  if entry.plugin then
    line = line .. "  (" .. entry.plugin .. ")"
  end
  return line
end

-- Drill-down: every keymap in one category (or all of them).
function M.keymaps(category)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local entries = M.collect()
  if category then
    entries = vim.tbl_filter(function(entry)
      return entry.category == category
    end, entries)
  end

  pickers
    .new({}, {
      prompt_title = category and ("Keymaps: " .. category) or "Keymaps: all categories",
      finder = finders.new_table({
        results = entries,
        entry_maker = function(entry)
          local label = string.format("%-22s %-6s %s", entry.lhs, table.concat(entry.modes, ","), entry.desc)
          if not category then
            label = string.format("%-32s %s", entry.category, label)
          end
          return {
            value = entry,
            display = label,
            ordinal = table.concat({ entry.category, entry.lhs, entry.desc, entry.plugin or "" }, " "),
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if not selection then
            return
          end
          local entry = selection.value
          if not vim.tbl_contains(entry.modes, "n") then
            vim.notify(
              entry.lhs .. " is only bound in mode(s): " .. table.concat(entry.modes, ", "),
              vim.log.levels.WARN
            )
            return
          end
          local lhs = entry.lhs:gsub("^<leader>", vim.g.mapleader == " " and " " or vim.g.mapleader)
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(lhs, true, false, true), "m", false)
        end)
        return true
      end,
    })
    :find()
end

-- Entry point: categories first, each previewing the keymaps it holds, so the
-- config can be browsed rather than searched.
function M.categories()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local previewers = require("telescope.previewers")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local groups, order = M.by_category()

  pickers
    .new({}, {
      prompt_title = "Keymap Categories",
      finder = finders.new_table({
        results = order,
        entry_maker = function(name)
          return {
            value = name,
            display = string.format("%-34s %3d", name, #groups[name]),
            ordinal = name,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      previewer = previewers.new_buffer_previewer({
        title = "Keymaps in category",
        define_preview = function(self, entry)
          local lines = {}
          for _, item in ipairs(groups[entry.value] or {}) do
            table.insert(lines, format_entry(item))
          end
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
          vim.bo[self.state.bufnr].filetype = "help"
        end,
      }),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if selection then
            M.keymaps(selection.value)
          end
        end)
        return true
      end,
    })
    :find()
end

return M
