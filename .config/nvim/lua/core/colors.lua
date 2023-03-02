local theme = require('themes/tokyonight')
local transparent = true

function ColorMyTreesitter()
  vim.api.nvim_set_hl(0, '@attribute', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, '@character', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@constructor', { fg = theme.base_16.base0C })
  vim.api.nvim_set_hl(0, '@constant.builtin', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, '@constant.macro', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@error', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@exception', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@float', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, '@keyword', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, '@keyword.function', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, '@keyword.return', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, '@function', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, '@function.builtin', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, '@function.macro', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@keyword.operator', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, '@method', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, '@namespace', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@none', { fg = theme.base_16.base05 })
  vim.api.nvim_set_hl(0, '@parameter', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@reference', { fg = theme.base_16.base05 })
  vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = theme.base_16.base0F })
  vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = theme.base_16.base0F })
  vim.api.nvim_set_hl(0, '@punctuation.special', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@string.regex', { fg = theme.base_16.base0C })
  vim.api.nvim_set_hl(0, '@string.escape', { fg = theme.base_16.base0C })
  vim.api.nvim_set_hl(0, '@symbol', { fg = theme.base_16.base0B })
  vim.api.nvim_set_hl(0, '@tag', { link = 'Tag' })
  vim.api.nvim_set_hl(0, '@tag.attribute', { link = '@property' })
  vim.api.nvim_set_hl(0, '@tag.delimiter', { fg = theme.base_16.base0F })
  vim.api.nvim_set_hl(0, '@text', { fg = theme.base_16.base05 })
  vim.api.nvim_set_hl(0, '@text.strong', { bold = true })
  vim.api.nvim_set_hl(0, '@text.emphasis', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, '@text.strike', { fg = theme.base_16.base00, strikethrough = true })
  vim.api.nvim_set_hl(0, '@text.literal', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, '@text.uri', { fg = theme.base_16.base09, underline = true })
  vim.api.nvim_set_hl(0, '@type.builtin', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, '@variable', { fg = theme.base_16.base05 })
  vim.api.nvim_set_hl(0, '@variable.builtin', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, '@definition', { sp = theme.base_16.base04, underline = true })
  vim.api.nvim_set_hl(0, 'TSDefinition', { sp = theme.base_16.base04, underline = true })
  vim.api.nvim_set_hl(0, '@scope', { bold = true })
  vim.api.nvim_set_hl(0, '@field', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@property', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, '@include', { link = 'Include' })
  vim.api.nvim_set_hl(0, '@conditional', { link = 'Conditional' })
end

function ColorMySyntaxStandard()
  vim.api.nvim_set_hl(0, 'Boolean', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, 'Character', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'Conditional', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'Constant', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'Define', { fg = theme.base_16.base0E, sp = 'none' })
  vim.api.nvim_set_hl(0, 'Delimiter', { fg = theme.base_16.base0F })
  vim.api.nvim_set_hl(0, 'Float', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, 'Variable', { fg = theme.base_16.base05 })
  vim.api.nvim_set_hl(0, 'Function', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'Identifier', { fg = theme.base_16.base08, sp = 'none' })
  vim.api.nvim_set_hl(0, 'Include', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'Keyword', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'Label', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'Number', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, 'Operator', { fg = theme.base_16.base05, sp = 'none' })
  vim.api.nvim_set_hl(0, 'PreProc', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'Repeat', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'Special', { fg = theme.base_16.base0C })
  vim.api.nvim_set_hl(0, 'SpecialChar', { fg = theme.base_16.base0F })
  vim.api.nvim_set_hl(0, 'Statement', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'StorageClass', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'String', { fg = theme.base_16.base0B })
  vim.api.nvim_set_hl(0, 'Structure', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'Tag', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'Todo', { fg = theme.base_16.base0A, bg = theme.base01 })
  vim.api.nvim_set_hl(0, 'Type', { fg = theme.base_16.base0A, sp = 'none' })
  vim.api.nvim_set_hl(0, 'Typedef', { fg = theme.base_16.base0A })
end

function ColorMyDefaults()
  vim.api.nvim_set_hl(0, 'MatchWord', { bg = theme.base_30.grey, fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = theme.base_30.one_bg })
  vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = theme.base_30.one_bg })
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = theme.base_30.pmenu_bg, fg = theme.base_30.black })
  vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = theme.base_30.grey })
  vim.api.nvim_set_hl(0, 'MatchParen', { link = 'MatchWord' })
  vim.api.nvim_set_hl(0, 'Comment', { fg = theme.base_30.grey_fg })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = theme.base_30.grey })

  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = theme.base_30.blue })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = transparent and 'none' or theme.base_30.darker_black })
  vim.api.nvim_set_hl(0, 'NvimInternalError', { fg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'WinSeparator', { fg = theme.base_30.line })

  vim.api.nvim_set_hl(0, 'Normal', { fg = theme.base_16.base05, bg = transparent and 'none' or theme.base_16.base00 })
  vim.api.nvim_set_hl(0, 'NonText', { fg = theme.base_16.base03 })
  vim.api.nvim_set_hl(0, 'Bold', { bold = true })
  vim.api.nvim_set_hl(0, 'Debug', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'Directory', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'Error', { fg = theme.base_16.base00, bg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = theme.base_16.base08, bg = theme.base_16.base00 })
  vim.api.nvim_set_hl(0, 'Exception', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'FoldColumn', { fg = theme.base_16.base0C, bg = theme.base_16.base01 })
  vim.api.nvim_set_hl(0, 'Folded', { fg = theme.base_16.base03, bg = theme.base_16.base01 })
  vim.api.nvim_set_hl(0, 'IncSearch', { fg = theme.base_16.base01, bg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, 'Italic', { italic = true })
  vim.api.nvim_set_hl(0, 'Macro', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'ModeMsg', { fg = theme.base_16.base0B })
  vim.api.nvim_set_hl(0, 'MoreMsg', { fg = theme.base_16.base0B })
  vim.api.nvim_set_hl(0, 'Question', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'Search', { fg = theme.base_16.base01, bg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'Substitute', { fg = theme.base_16.base01, bg = theme.base_16.base0A, sp = 'none' })
  vim.api.nvim_set_hl(0, 'SpecialKey', { fg = theme.base_16.base03 })
  vim.api.nvim_set_hl(0, 'TooLong', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'UnderLined', { fg = theme.base_16.base0B })
  vim.api.nvim_set_hl(0, 'Visual', { bg = theme.base_16.base02 })
  vim.api.nvim_set_hl(0, 'VisualNOS', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'WarningMsg', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'WildMenu', { fg = theme.base_16.base08, bg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'Title', { fg = theme.base_16.base0D, sp = 'none' })
  vim.api.nvim_set_hl(0, 'Conceal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'Cursor', { fg = theme.base_16.base00, bg = theme.base_16.base05 })
  vim.api.nvim_set_hl(0, 'SignColumn', { fg = theme.base_16.base03, sp = 'none' })
  vim.api.nvim_set_hl(0, 'ColorColumn', { bg = theme.base_16.base01, sp = 'none' })
  vim.api.nvim_set_hl(0, 'CursorColumn', { fg = theme.base_16.base01, sp = 'none' })
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none', sp = 'none' })
  vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = theme.base_16.base01, sp = 'none' })

  vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = theme.base_16.base0C })
  vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'healthSuccess', { bg = theme.base_30.green, fg = theme.base_30.black })
end

function ColorMyBufferline()
  vim.api.nvim_set_hl(0, 'BufferLineBackground',
    { fg = theme.base_30.light_grey, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferlineIndicatorVisible',
    { fg = theme.base_30.black2, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineBufferSelected',
    { fg = theme.base_30.white, bg = transparent and 'none' or theme.base_30.black })
  vim.api.nvim_set_hl(0, 'BufferLineBufferVisible',
    { fg = theme.base_30.light_grey, bg = transparent and 'none' or theme.base_30.black2 })
  -- for diagnostics = 'nvim_lsp'
  vim.api.nvim_set_hl(0, 'BufferLineError',
    { fg = theme.base_30.light_grey, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineErrorDiagnostic',
    { fg = theme.base_30.light_grey, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineCloseButton',
    { fg = theme.base_30.light_grey, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineCloseButtonVisible',
    { fg = theme.base_30.light_grey, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineCloseButtonSelected',
    { fg = theme.base_30.red, bg = transparent and 'none' or theme.base_30.black })
  vim.api.nvim_set_hl(0, 'BufferLineFill',
    { fg = theme.base_30.grey_fg, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferlineIndicatorSelected',
    { fg = theme.base_30.black, bg = transparent and 'none' or theme.base_30.black })
  vim.api.nvim_set_hl(0, 'BufferLineModified',
    { fg = theme.base_30.red, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible',
    { fg = theme.base_30.red, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected',
    { fg = theme.base_30.green, bg = transparent and 'none' or theme.base_30.black })
  -- separators
  vim.api.nvim_set_hl(0, 'BufferLineSeparator',
    { fg = theme.base_30.darker_black, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible',
    { fg = theme.base_30.black2, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected',
    { fg = theme.base_30.black2, bg = transparent and 'none' or theme.base_30.black2 })
  -- tabs
  vim.api.nvim_set_hl(0, 'BufferLineTab',
    { fg = theme.base_30.light_grey, bg = transparent and 'none' or theme.base_30.one_bg3 })
  vim.api.nvim_set_hl(0, 'BufferLineTabSelected',
    { fg = theme.base_30.light_grey, bg = transparent and 'none' or theme.base_30.nord_blue })
  vim.api.nvim_set_hl(0, 'BufferLineTabClose',
    { fg = theme.base_30.red, bg = transparent and 'none' or theme.base_30.black })

  vim.api.nvim_set_hl(0, 'BufferLineDuplicate', { fg = 'none', bg = theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineDuplicateSelected', { fg = theme.base_30.red, bg = theme.base_30.black })
  vim.api.nvim_set_hl(0, 'BufferLineDuplicateVisible', { fg = theme.base_30.blue, bg = theme.base_30.black2 })

  vim.api.nvim_set_hl(0, 'BufferLineRightCustomAreaText1', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'BufferLineRightCustomAreaText2', { fg = theme.base_30.red })
  -- why not work???
  -- vim.api.nvim_set_hl(0, 'BufferLineDevIconDefaultSelected', { bg = theme.base_30.white })
  -- vim.api.nvim_set_hl(0, 'BufferLineDevIconDefaultInactive', { bg = theme.base_30.white })
end

function ColorMyDevicons()
  vim.api.nvim_set_hl(0, 'DevIconDefault', { fg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'DevIconc', { fg = theme.base_30.blue })
  vim.api.nvim_set_hl(0, 'DevIconcss', { fg = theme.base_30.blue })
  vim.api.nvim_set_hl(0, 'DevIcondeb', { fg = theme.base_30.cyan })
  vim.api.nvim_set_hl(0, 'DevIconDockerfile', { fg = theme.base_30.cyan })
  vim.api.nvim_set_hl(0, 'DevIconhtml', { fg = theme.base_30.baby_pink })
  vim.api.nvim_set_hl(0, 'DevIconjpeg', { fg = theme.base_30.dark_purple })
  vim.api.nvim_set_hl(0, 'DevIconjpg', { fg = theme.base_30.dark_purple })
  vim.api.nvim_set_hl(0, 'DevIconjs', { fg = theme.base_30.sun })
  vim.api.nvim_set_hl(0, 'DevIconkt', { fg = theme.base_30.orange })
  vim.api.nvim_set_hl(0, 'DevIconlock', { fg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'DevIconlua', { fg = theme.base_30.blue })
  vim.api.nvim_set_hl(0, 'DevIconmp3', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'DevIconmp4', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'DevIconout', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'DevIconpng', { fg = theme.base_30.dark_purple })
  vim.api.nvim_set_hl(0, 'DevIconpy', { fg = theme.base_30.cyan })
  vim.api.nvim_set_hl(0, 'DevIcontoml', { fg = theme.base_30.blue })
  vim.api.nvim_set_hl(0, 'DevIconts', { fg = theme.base_30.teal })
  vim.api.nvim_set_hl(0, 'DevIconttf', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'DevIconrb', { fg = theme.base_30.pink })
  vim.api.nvim_set_hl(0, 'DevIconrpm', { fg = theme.base_30.orange })
  vim.api.nvim_set_hl(0, 'DevIconvue', { fg = theme.base_30.vibrant_green })
  vim.api.nvim_set_hl(0, 'DevIconwoff', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'DevIconwoff2', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'DevIconxz', { fg = theme.base_30.sun })
  vim.api.nvim_set_hl(0, 'DevIconzip', { fg = theme.base_30.sun })
  vim.api.nvim_set_hl(0, 'DevIconZig', { fg = theme.base_30.orange })
end

function ColorMyCmp()
  vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = theme.base_30.blue, bold = true })
  vim.api.nvim_set_hl(0, 'CmpBorder', { fg = theme.base_30.grey })
  vim.api.nvim_set_hl(0, 'CmpDocBorder',
    { fg = theme.base_30.darker_black, bg = transparent and 'none' or theme.base_30.darker_black })
  vim.api.nvim_set_hl(0, 'CmPmenu', { bg = transparent and 'none' or theme.base_30.darker_black })

  vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = theme.base_16.base09 })
  vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'CmpItemKindIdentifier', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = theme.base_16.base0B })
  vim.api.nvim_set_hl(0, 'CmpItemKindStructure', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'CmpItemKindType', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = theme.base_16.base07 })
  vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = theme.base_30.blue })
  vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = theme.base_16.base07 })
  vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = theme.base_16.base07 })
  vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = theme.base_16.base05 })
  vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = theme.base_16.base05 })
  vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = theme.base_30.green })
end

function ColorMyGit()
  vim.api.nvim_set_hl(0, 'DiffAdd', { fg = theme.base_30.blue })
  vim.api.nvim_set_hl(0, 'DiffAdded', { fg = theme.base_30.green })
  vim.api.nvim_set_hl(0, 'DiffChange', { fg = theme.base_30.light_grey })
  vim.api.nvim_set_hl(0, 'DiffChangeDelete', { fg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'DiffModified', { fg = theme.base_30.orange })
  vim.api.nvim_set_hl(0, 'DiffDelete', { fg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = theme.base_30.red })

  vim.api.nvim_set_hl(0, 'gitcommitOverflow', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = theme.base_16.base08 })
  vim.api.nvim_set_hl(0, 'gitcommitComment', { fg = theme.base_16.base03 })
  vim.api.nvim_set_hl(0, 'gitcommitUntracked', { fg = theme.base_16.base03 })
  vim.api.nvim_set_hl(0, 'gitcommitDiscarded', { fg = theme.base_16.base03 })
  vim.api.nvim_set_hl(0, 'gitcommitSelected', { fg = theme.base_16.base03 })
  vim.api.nvim_set_hl(0, 'gitcommitHeader', { fg = theme.base_16.base0E })
  vim.api.nvim_set_hl(0, 'gitcommitSelectedType', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'gitcommitUnmergedType', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'gitcommitDiscardedType', { fg = theme.base_16.base0D })
  vim.api.nvim_set_hl(0, 'gitcommitBranch', { fg = theme.base_16.base09, bold = true })
  vim.api.nvim_set_hl(0, 'gitcommitUntrackedFile', { fg = theme.base_16.base0A })
  vim.api.nvim_set_hl(0, 'gitcommitUnmergedFile', { fg = theme.base_16.base08, bold = true })
  vim.api.nvim_set_hl(0, 'gitcommitDiscardedFile', { fg = theme.base_16.base08, bold = true })
  vim.api.nvim_set_hl(0, 'gitcommitSelectedFile', { fg = theme.base_16.base08, bold = true })
end

function ColorMyTelescope()
  vim.api.nvim_set_hl(0, 'TelescopeBorder',
    {
      fg = transparent and theme.base_30.light_grey or theme.base_30.darker_black,
      bg = transparent and 'none' or theme.base_30.darker_black
    })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder',
    {
      fg = transparent and theme.base_30.light_grey or theme.base_30.black2,
      bg = transparent and 'none' or theme.base_30.black2
    })
  vim.api.nvim_set_hl(0, 'TelescopePromptNormal',
    { fg = theme.base_30.white, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'TelescopePromptPrefix',
    { fg = theme.base_30.red, bg = transparent and 'none' or theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = transparent and 'none' or theme.base_30.darker_black })
  vim.api.nvim_set_hl(0, 'TelescopePreviewTitle',
    {
      fg = transparent and theme.base_30.light_grey or theme.base_30.black,
      bg = transparent and 'none' or theme.base_30.green
    })
  vim.api.nvim_set_hl(0, 'TelescopePromptTitle',
    {
      fg = transparent and theme.base_30.light_grey or theme.base_30.black,
      bg = transparent and 'none' or theme.base_30.red
    })
  vim.api.nvim_set_hl(0, 'TelescopeResultsTitle',
    {
      fg = transparent and theme.base_30.light_grey or theme.base_30.darker_black,
      bg = transparent and 'none' or theme.base_30.darker_black
    })
  vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = theme.base_30.white, bg = theme.base_30.black2 })
  vim.api.nvim_set_hl(0, 'TelescopeResultsDiffAdd', { fg = theme.base_30.green })
  vim.api.nvim_set_hl(0, 'TelescopeResultsDiffChange', { fg = theme.base_30.yellow })
  vim.api.nvim_set_hl(0, 'TelescopeResultsDiffDelete', { fg = theme.base_30.red })
end

function ColorMyLSP()
  vim.api.nvim_set_hl(0, 'LspReferenceText', { fg = theme.base_30.darker_black, bg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'LspReferenceRead', { fg = theme.base_30.darker_black, bg = theme.base_30.white })
  vim.api.nvim_set_hl(0, 'LspReferenceWrite', { fg = theme.base_30.darker_black, bg = theme.base_30.white })

  vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = theme.base_30.purple })
  vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = theme.base_30.yellow })
  vim.api.nvim_set_hl(0, 'DiagnosticInformation', { fg = theme.base_30.green })
  vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = theme.base_30.black, bg = theme.base_30.green })

  vim.api.nvim_set_hl(0, 'RenamerTitle', { fg = theme.base_30.black, bg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'RenamerBorder', { fg = theme.base_30.red })

  vim.api.nvim_set_hl(0, 'FidgetTitle', { fg = theme.base_30.cyan, bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTask', { bg = 'none' })
end

function ColorMyMason()
  vim.api.nvim_set_hl(0, 'MasonHeader', { bg = theme.base_30.red })
  vim.api.nvim_set_hl(0, 'MasonHighlight', { fg = theme.base_30.blue })
  vim.api.nvim_set_hl(0, 'MasonHighlightBlock', { fg = theme.base_30.black, bg = theme.base_30.green })
  vim.api.nvim_set_hl(0, 'MasonHighlightBlockBold', { link = 'MasonHighlightBlock' })
  vim.api.nvim_set_hl(0, 'MasonHeaderSecondary', { link = 'MasonHighlightBlock' })
  vim.api.nvim_set_hl(0, 'MasonMuted', { fg = theme.base_30.light_grey })
  vim.api.nvim_set_hl(0, 'MasonMutedBlock', { fg = theme.base_30.light_grey, bg = theme.base_30.one_bg })
end

ColorMySyntaxStandard()
ColorMyTreesitter()
ColorMyDevicons()
ColorMyDefaults()
ColorMyBufferline()
ColorMyCmp()
ColorMyGit()
ColorMyLSP()
ColorMyBufferline()
ColorMyMason()
ColorMyTelescope()

return theme, transparent
