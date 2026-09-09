-- cerne.pro brand colorscheme ("heartwood core", dark)
-- Tokens from ~/Documents/design-guidelines. Kept deliberately restrained:
-- literals/keywords/functions each get one brand hue rather than inventing
-- syntax-only colors, matching "one accent dominates" from the guidelines.
-- Most @treesitter captures inherit these via Neovim's built-in default
-- links to the classic groups below (e.g. @function -> Function).

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "cerne"

local c = {
  ink = "#0C0D10",
  surface = "#14161B",
  surface2 = "#1F2229",
  text = "#E8E4DB",
  text_muted = "#9A968C",
  heartwood = "#E89A3C",
  glow = "#F6B65A",
  oxblood = "#8C3B24",
  sapwood = "#4E8F6B",
  info = "#5C7A99", -- non-brand neutral blue, shared with the Ghostty/tmux ANSI palette
}

local hl = vim.api.nvim_set_hl

local groups = {
  -- Editor UI
  Normal = { fg = c.text, bg = c.ink },
  NormalFloat = { fg = c.text, bg = c.surface },
  FloatBorder = { fg = c.surface2, bg = c.surface },
  FloatTitle = { fg = c.heartwood, bg = c.surface, bold = true },
  CursorLine = { bg = c.surface },
  CursorLineNr = { fg = c.heartwood, bold = true },
  LineNr = { fg = c.text_muted },
  Visual = { bg = c.surface2 },
  Search = { fg = c.ink, bg = c.heartwood },
  IncSearch = { fg = c.ink, bg = c.glow },
  CurSearch = { fg = c.ink, bg = c.glow },
  Pmenu = { fg = c.text, bg = c.surface },
  PmenuSel = { fg = c.glow, bg = c.surface2, bold = true },
  PmenuSbar = { bg = c.surface2 },
  PmenuThumb = { bg = c.oxblood },
  StatusLine = { fg = c.text, bg = c.surface },
  StatusLineNC = { fg = c.text_muted, bg = c.surface },
  WinSeparator = { fg = c.surface2 },
  VertSplit = { fg = c.surface2 },
  Folded = { fg = c.text_muted, bg = c.surface },
  SignColumn = { bg = c.ink },
  ColorColumn = { bg = c.surface },
  NonText = { fg = c.surface2 },
  EndOfBuffer = { fg = c.surface2 },
  Whitespace = { fg = c.surface2 },
  MatchParen = { fg = c.text, bg = c.oxblood, bold = true },
  Title = { fg = c.heartwood, bold = true },
  Directory = { fg = c.glow },
  ErrorMsg = { fg = c.oxblood, bold = true },
  WarningMsg = { fg = c.heartwood },
  ModeMsg = { fg = c.sapwood },
  MoreMsg = { fg = c.sapwood },
  Question = { fg = c.sapwood },
  WildMenu = { fg = c.ink, bg = c.heartwood },

  -- Syntax
  Comment = { fg = c.text_muted, italic = true },
  Constant = { fg = c.glow },
  String = { fg = c.glow },
  Character = { fg = c.glow },
  Number = { fg = c.glow },
  Boolean = { fg = c.glow },
  Float = { fg = c.glow },
  Identifier = { fg = c.text },
  Function = { fg = c.sapwood, bold = true },
  Statement = { fg = c.heartwood },
  Conditional = { fg = c.heartwood },
  Repeat = { fg = c.heartwood },
  Label = { fg = c.heartwood },
  Exception = { fg = c.heartwood },
  Keyword = { fg = c.heartwood },
  Operator = { fg = c.text_muted },
  PreProc = { fg = c.heartwood },
  Include = { fg = c.heartwood },
  Define = { fg = c.heartwood },
  Macro = { fg = c.heartwood },
  PreCondit = { fg = c.heartwood },
  Type = { fg = c.text, bold = true },
  StorageClass = { fg = c.text, bold = true },
  Structure = { fg = c.text, bold = true },
  Typedef = { fg = c.text, bold = true },
  Special = { fg = c.glow },
  SpecialChar = { fg = c.glow },
  Tag = { fg = c.glow },
  Delimiter = { fg = c.text_muted },
  SpecialComment = { fg = c.text_muted, italic = true },
  Debug = { fg = c.oxblood },
  Underlined = { fg = c.glow, underline = true },
  Ignore = { fg = c.surface2 },
  Error = { fg = c.text, bg = c.oxblood, bold = true },
  Todo = { fg = c.ink, bg = c.heartwood, bold = true },

  -- Diagnostics
  DiagnosticError = { fg = c.oxblood },
  DiagnosticWarn = { fg = c.heartwood },
  DiagnosticInfo = { fg = c.info },
  DiagnosticHint = { fg = c.sapwood },
  DiagnosticUnderlineError = { undercurl = true, sp = c.oxblood },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.heartwood },
  DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
  DiagnosticUnderlineHint = { undercurl = true, sp = c.sapwood },
  LspReferenceText = { bg = c.surface2 },
  LspReferenceRead = { bg = c.surface2 },
  LspReferenceWrite = { bg = c.surface2 },
  LspInlayHint = { fg = c.text_muted, bg = c.surface, italic = true },

  -- gitsigns.nvim
  GitSignsAdd = { fg = c.sapwood },
  GitSignsChange = { fg = c.heartwood },
  GitSignsDelete = { fg = c.oxblood },
  GitSignsCurrentLineBlame = { fg = c.text_muted, italic = true },

  -- Telescope
  TelescopeNormal = { fg = c.text, bg = c.surface },
  TelescopeBorder = { fg = c.surface2, bg = c.surface },
  TelescopePromptNormal = { fg = c.text, bg = c.surface },
  TelescopePromptBorder = { fg = c.surface2, bg = c.surface },
  TelescopePromptTitle = { fg = c.ink, bg = c.heartwood, bold = true },
  TelescopePreviewTitle = { fg = c.ink, bg = c.sapwood, bold = true },
  TelescopeResultsTitle = { fg = c.ink, bg = c.text_muted, bold = true },
  TelescopeSelection = { fg = c.text, bg = c.surface2, bold = true },
  TelescopeMatching = { fg = c.heartwood, bold = true },

  -- which-key
  WhichKey = { fg = c.heartwood, bold = true },
  WhichKeyGroup = { fg = c.sapwood },
  WhichKeyDesc = { fg = c.text },
  WhichKeySeparator = { fg = c.text_muted },
  WhichKeyFloat = { bg = c.surface },
  WhichKeyBorder = { fg = c.surface2, bg = c.surface },

  -- blink.cmp
  BlinkCmpMenu = { fg = c.text, bg = c.surface },
  BlinkCmpMenuBorder = { fg = c.surface2, bg = c.surface },
  BlinkCmpMenuSelection = { bg = c.surface2 },
  BlinkCmpDoc = { fg = c.text, bg = c.surface },
  BlinkCmpDocBorder = { fg = c.surface2, bg = c.surface },
  BlinkCmpLabelMatch = { fg = c.heartwood, bold = true },
  BlinkCmpSignatureHelp = { fg = c.text, bg = c.surface },
  BlinkCmpSignatureHelpBorder = { fg = c.surface2, bg = c.surface },

  -- oil.nvim (directories/files render through Directory/Normal already)
  OilDir = { fg = c.glow, bold = true },

  -- Snacks dashboard header/mark, in case it renders before the
  -- brand-pin autocmd in config/autocmds.lua runs
  SnacksDashboardHeader = { fg = c.heartwood, bold = true },
}

for group, opts in pairs(groups) do
  hl(0, group, opts)
end
