local theme = require('themes/tokyonight')
local transparent = true

function ColorMyTreesitter()
  vim.api.nvim_set_hl(0, '@attribute', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, '@character', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@constructor', { fg = theme.base0C })
  vim.api.nvim_set_hl(0, '@constant.builtin', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, '@constant.macro', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@error', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@exception', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@float', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, '@keyword', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, '@keyword.function', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, '@keyword.return', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, '@function', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, '@function.builtin', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, '@function.macro', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@keyword.operator', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, '@method', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, '@namespace', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@none', { fg = theme.base05 })
  vim.api.nvim_set_hl(0, '@parameter', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@reference', { fg = theme.base05 })
  vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = theme.base0F })
  vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = theme.base0F })
  vim.api.nvim_set_hl(0, '@punctuation.special', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@string.regex', { fg = theme.base0C })
  vim.api.nvim_set_hl(0, '@string.escape', { fg = theme.base0C })
  vim.api.nvim_set_hl(0, '@symbol', { fg = theme.base0B })
  vim.api.nvim_set_hl(0, '@tag', { link = 'Tag' })
  vim.api.nvim_set_hl(0, '@tag.attribute', { link = '@property' })
  vim.api.nvim_set_hl(0, '@tag.delimiter', { fg = theme.base0F })
  vim.api.nvim_set_hl(0, '@text', { fg = theme.base05 })
  vim.api.nvim_set_hl(0, '@text.strong', { bold = true })
  vim.api.nvim_set_hl(0, '@text.emphasis', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, '@text.strike', { fg = theme.base00, strikethrough = true })
  vim.api.nvim_set_hl(0, '@text.literal', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, '@text.uri', { fg = theme.base09, underline = true })
  vim.api.nvim_set_hl(0, '@type.builtin', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, '@variable', { fg = theme.base05 })
  vim.api.nvim_set_hl(0, '@variable.builtin', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, '@definition', { sp = theme.base04, underline = true })
  vim.api.nvim_set_hl(0, 'TSDefinition', { sp = theme.base04, underline = true })
  vim.api.nvim_set_hl(0, '@scope', { bold = true })
  vim.api.nvim_set_hl(0, '@field', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@property', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, '@include', { link = 'Include' })
  vim.api.nvim_set_hl(0, '@conditional', { link = 'Conditional' })
end

function ColorMySyntaxStandard()
  vim.api.nvim_set_hl(0, 'Boolean', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, 'Character', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'Conditional', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, 'Constant', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'Define', { fg = theme.base0E, sp = 'none' })
  vim.api.nvim_set_hl(0, 'Delimiter', { fg = theme.base0F })
  vim.api.nvim_set_hl(0, 'Float', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, 'Variable', { fg = theme.base05 })
  vim.api.nvim_set_hl(0, 'Function', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'Identifier', { fg = theme.base08, sp = 'none' })
  vim.api.nvim_set_hl(0, 'Include', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'Keyword', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, 'Label', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, 'Number', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, 'Operator', { fg = theme.base05, sp = 'none' })
  vim.api.nvim_set_hl(0, 'PreProc', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, 'Repeat', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, 'Special', { fg = theme.base0C })
  vim.api.nvim_set_hl(0, 'SpecialChar', { fg = theme.base0F })
  vim.api.nvim_set_hl(0, 'Statement', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'StorageClass', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, 'String', { fg = theme.base0B })
  vim.api.nvim_set_hl(0, 'Structure', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, 'Tag', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, 'Todo', { fg = theme.base0A, bg = theme.base01 })
  vim.api.nvim_set_hl(0, 'Type', { fg = theme.base0A, sp = 'none' })
  vim.api.nvim_set_hl(0, 'Typedef', { fg = theme.base0A })
end

function ColorMyMason()
  vim.api.nvim_set_hl(0, 'MasonHeader', { bg = theme.red })
  vim.api.nvim_set_hl(0, 'MasonHighlight', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'MasonHighlightBlock', { fg = theme.black, bg = theme.green })
  vim.api.nvim_set_hl(0, 'MasonHighlightBlockBold', { link = 'MasonHighlightBlock' })
  vim.api.nvim_set_hl(0, 'MasonHeaderSecondary', { link = 'MasonHighlightBlock' })
  vim.api.nvim_set_hl(0, 'MasonMuted', { fg = theme.light_grey })
  vim.api.nvim_set_hl(0, 'MasonMutedBlock', { fg = theme.light_grey, bg = theme.one_bg })
end

function ColorMyDefaults()
  vim.api.nvim_set_hl(0, 'MatchWord', { bg = theme.grey, fg = theme.white })
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = theme.one_bg })
  vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = theme.one_bg })
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = theme.pmenu_bg, fg = theme.black })
  vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = theme.grey })
  vim.api.nvim_set_hl(0, 'MatchParen', { link = 'MatchWord' })
  vim.api.nvim_set_hl(0, 'Comment', { fg = theme.grey_fg })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = theme.grey })
  -- Floating Windows
  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = transparent and 'none' or theme.darker_black })
  vim.api.nvim_set_hl(0, 'NvimInternalError', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'WinSeparator', { fg = theme.line })
  -- Packer
  vim.api.nvim_set_hl(0, 'PackerPackageName', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'PackerSuccess', { fg = theme.green })
  vim.api.nvim_set_hl(0, 'PackerStatusSuccess', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'PackerStatusCommit', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'PackerProgress', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'PackerOutput', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'PackerStatus', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'PackerHash', { fg = theme.blue })
  -- Transparent -> bg = 'none'
  vim.api.nvim_set_hl(0, 'Normal', { fg = theme.base05, bg = transparent and 'none' or theme.base00 })
  vim.api.nvim_set_hl(0, 'NonText', { fg = theme.base03 })
  vim.api.nvim_set_hl(0, 'Bold', { bold = true })
  vim.api.nvim_set_hl(0, 'Debug', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'Directory', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'Error', { fg = theme.base00, bg = theme.base08 })
  vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = theme.base08, bg = theme.base00 })
  vim.api.nvim_set_hl(0, 'Exception', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'FoldColumn', { fg = theme.base0C, bg = theme.base01 })
  vim.api.nvim_set_hl(0, 'Folded', { fg = theme.base03, bg = theme.base01 })
  vim.api.nvim_set_hl(0, 'IncSearch', { fg = theme.base01, bg = theme.base09 })
  vim.api.nvim_set_hl(0, 'Italic', { italic = true })
  vim.api.nvim_set_hl(0, 'Macro', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'ModeMsg', { fg = theme.base0B })
  vim.api.nvim_set_hl(0, 'MoreMsg', { fg = theme.base0B })
  vim.api.nvim_set_hl(0, 'Question', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'Search', { fg = theme.base01, bg = theme.base0A })
  vim.api.nvim_set_hl(0, 'Substitute', { fg = theme.base01, bg = theme.base0A, sp = 'none' })
  vim.api.nvim_set_hl(0, 'SpecialKey', { fg = theme.base03 })
  vim.api.nvim_set_hl(0, 'TooLong', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'UnderLined', { fg = theme.base0B })
  vim.api.nvim_set_hl(0, 'Visual', { bg = theme.base02 })
  vim.api.nvim_set_hl(0, 'VisualNOS', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'WarningMsg', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'WildMenu', { fg = theme.base08, bg = theme.base0A })
  vim.api.nvim_set_hl(0, 'Title', { fg = theme.base0D, sp = 'none' })
  vim.api.nvim_set_hl(0, 'Conceal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'Cursor', { fg = theme.base00, bg = theme.base05 })
  vim.api.nvim_set_hl(0, 'SignColumn', { fg = theme.base03, sp = 'none' })
  vim.api.nvim_set_hl(0, 'ColorColumn', { bg = theme.base01, sp = 'none' })
  vim.api.nvim_set_hl(0, 'CursorColumn', { fg = theme.base01, sp = 'none' })
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none', sp = 'none' })
  vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = theme.base01, sp = 'none' })
  -- spell
  vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = theme.base08 })
  vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = theme.base0C })
  vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = theme.base0D })
  vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = theme.base0E })
  vim.api.nvim_set_hl(0, 'healthSuccess', { bg = theme.green, fg = theme.black })
end

function ColorMyDevicons()
  vim.api.nvim_set_hl(0, 'DevIconDefault', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'DevIconc', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'DevIconcss', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'DevIcondeb', { fg = theme.cyan })
  vim.api.nvim_set_hl(0, 'DevIconDockerfile', { fg = theme.cyan })
  vim.api.nvim_set_hl(0, 'DevIconhtml', { fg = theme.baby_pink })
  vim.api.nvim_set_hl(0, 'DevIconjpeg', { fg = theme.dark_purple })
  vim.api.nvim_set_hl(0, 'DevIconjpg', { fg = theme.dark_purple })
  vim.api.nvim_set_hl(0, 'DevIconjs', { fg = theme.sun })
  vim.api.nvim_set_hl(0, 'DevIconkt', { fg = theme.orange })
  vim.api.nvim_set_hl(0, 'DevIconlock', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'DevIconlua', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'DevIconmp3', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'DevIconmp4', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'DevIconout', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'DevIconpng', { fg = theme.dark_purple })
  vim.api.nvim_set_hl(0, 'DevIconpy', { fg = theme.cyan })
  vim.api.nvim_set_hl(0, 'DevIcontoml', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'DevIconts', { fg = theme.teal })
  vim.api.nvim_set_hl(0, 'DevIconttf', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'DevIconrb', { fg = theme.pink })
  vim.api.nvim_set_hl(0, 'DevIconrpm', { fg = theme.orange })
  vim.api.nvim_set_hl(0, 'DevIconvue', { fg = theme.vibrant_green })
  vim.api.nvim_set_hl(0, 'DevIconwoff', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'DevIconwoff2', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'DevIconxz', { fg = theme.sun })
  vim.api.nvim_set_hl(0, 'DevIconzip', { fg = theme.sun })
  vim.api.nvim_set_hl(0, 'DevIconZig', { fg = theme.orange })
end

function ColorMyBufferline()
  vim.api.nvim_set_hl(0, 'BufferLineBackground', { fg = theme.light_grey, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferlineIndicatorVisible', { fg = theme.black2, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', { fg = theme.white, bg = transparent and 'none' or theme.black })
  vim.api.nvim_set_hl(0, 'BufferLineBufferVisible',
    { fg = theme.light_grey, bg = transparent and 'none' or theme.black2 })
  -- for diagnostics = 'nvim_lsp'
  vim.api.nvim_set_hl(0, 'BufferLineError', { fg = theme.light_grey, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineErrorDiagnostic',
    { fg = theme.light_grey, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineCloseButton', { fg = theme.light_grey, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineCloseButtonVisible',
    { fg = theme.light_grey, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineCloseButtonSelected', { fg = theme.red, bg = transparent and 'none' or theme.black })
  vim.api.nvim_set_hl(0, 'BufferLineFill', { fg = theme.grey_fg, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferlineIndicatorSelected', { fg = theme.black, bg = transparent and 'none' or theme.black })
  vim.api.nvim_set_hl(0, 'BufferLineModified', { fg = theme.red, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible', { fg = theme.red, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', { fg = theme.green, bg = transparent and 'none' or theme.black })
  -- separators
  vim.api.nvim_set_hl(0, 'BufferLineSeparator', { fg = theme.darker_black, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { fg = theme.black2, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected',
    { fg = theme.black2, bg = transparent and 'none' or theme.black2 })
  -- tabs
  vim.api.nvim_set_hl(0, 'BufferLineTab', { fg = theme.light_grey, bg = transparent and 'none' or theme.one_bg3 })
  vim.api.nvim_set_hl(0, 'BufferLineTabSelected',
    { fg = theme.light_grey, bg = transparent and 'none' or theme.nord_blue })
  vim.api.nvim_set_hl(0, 'BufferLineTabClose', { fg = theme.red, bg = transparent and 'none' or theme.black })

  -- why not work???
  -- vim.api.nvim_set_hl(0, 'BufferLineDevIconDefaultSelected', { bg = theme.white })
  -- vim.api.nvim_set_hl(0, 'BufferLineDevIconDefaultInactive', { bg = theme.white })

  vim.api.nvim_set_hl(0, 'BufferLineDuplicate', { fg = 'none', bg = theme.black2 })
  vim.api.nvim_set_hl(0, 'BufferLineDuplicateSelected', { fg = theme.red, bg = theme.black })
  vim.api.nvim_set_hl(0, 'BufferLineDuplicateVisible', { fg = theme.blue, bg = theme.black2 })

  vim.api.nvim_set_hl(0, 'BufferLineRightCustomAreaText1', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'BufferLineRightCustomAreaText2', { fg = theme.red })
end

function ColorMyCmp()
  -- nvim cmp
  vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = theme.white })
  vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = theme.blue, bold = true })
  vim.api.nvim_set_hl(0, 'CmpBorder', { fg = theme.grey })
  vim.api.nvim_set_hl(0, 'CmpDocBorder', { fg = theme.darker_black, bg = transparent and 'none' or theme.darker_black })
  vim.api.nvim_set_hl(0, 'CmPmenu', { bg = transparent and 'none' or theme.darker_black })
  -- cmp item kinds
  vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = theme.base09 })
  vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'CmpItemKindIdentifier', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = theme.base0B })
  vim.api.nvim_set_hl(0, 'CmpItemKindStructure', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, 'CmpItemKindType', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = theme.base07 })
  vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = theme.base07 })
  vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = theme.base07 })
  vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = theme.base05 })
  vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = theme.base05 })
  vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = theme.green })
end

function ColorMyGit()
  vim.api.nvim_set_hl(0, 'DiffAdd', { fg = theme.blue })
  vim.api.nvim_set_hl(0, 'DiffAdded', { fg = theme.green })
  vim.api.nvim_set_hl(0, 'DiffChange', { fg = theme.light_grey })
  vim.api.nvim_set_hl(0, 'DiffChangeDelete', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'DiffModified', { fg = theme.orange })
  vim.api.nvim_set_hl(0, 'DiffDelete', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = theme.red })
  -- git commits
  vim.api.nvim_set_hl(0, 'gitcommitOverflow', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = theme.base08 })
  vim.api.nvim_set_hl(0, 'gitcommitComment', { fg = theme.base03 })
  vim.api.nvim_set_hl(0, 'gitcommitUntracked', { fg = theme.base03 })
  vim.api.nvim_set_hl(0, 'gitcommitDiscarded', { fg = theme.base03 })
  vim.api.nvim_set_hl(0, 'gitcommitSelected', { fg = theme.base03 })
  vim.api.nvim_set_hl(0, 'gitcommitHeader', { fg = theme.base0E })
  vim.api.nvim_set_hl(0, 'gitcommitSelectedType', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'gitcommitUnmergedType', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'gitcommitDiscardedType', { fg = theme.base0D })
  vim.api.nvim_set_hl(0, 'gitcommitBranch', { fg = theme.base09, bold = true })
  vim.api.nvim_set_hl(0, 'gitcommitUntrackedFile', { fg = theme.base0A })
  vim.api.nvim_set_hl(0, 'gitcommitUnmergedFile', { fg = theme.base08, bold = true })
  vim.api.nvim_set_hl(0, 'gitcommitDiscardedFile', { fg = theme.base08, bold = true })
  vim.api.nvim_set_hl(0, 'gitcommitSelectedFile', { fg = theme.base08, bold = true })
end

function ColorMyLSP()
  -- LSP references
  vim.api.nvim_set_hl(0, 'LspReferenceText', { fg = theme.darker_black, bg = theme.white })
  vim.api.nvim_set_hl(0, 'LspReferenceRead', { fg = theme.darker_black, bg = theme.white })
  vim.api.nvim_set_hl(0, 'LspReferenceWrite', { fg = theme.darker_black, bg = theme.white })
  -- LSP diagnostics
  vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = theme.purple })
  vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = theme.yellow })
  vim.api.nvim_set_hl(0, 'DiagnosticInformation', { fg = theme.green })
  vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = theme.black, bg = theme.green })

  vim.api.nvim_set_hl(0, 'RenamerTitle', { fg = theme.black, bg = theme.red })
  vim.api.nvim_set_hl(0, 'RenamerBorder', { fg = theme.red })
end

function ColorMyTelescope()
  vim.api.nvim_set_hl(0, 'TelescopeBorder',
    { fg = transparent and theme.light_grey or theme.darker_black, bg = transparent and 'none' or theme.darker_black })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder',
    { fg = transparent and theme.light_grey or theme.black2, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = theme.white, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = theme.red, bg = transparent and 'none' or theme.black2 })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = transparent and 'none' or theme.darker_black })
  vim.api.nvim_set_hl(0, 'TelescopePreviewTitle',
    { fg = transparent and theme.light_grey or theme.black, bg = transparent and 'none' or theme.green })
  vim.api.nvim_set_hl(0, 'TelescopePromptTitle',
    { fg = transparent and theme.light_grey or theme.black, bg = transparent and 'none' or theme.red })
  vim.api.nvim_set_hl(0, 'TelescopeResultsTitle',
    { fg = transparent and theme.light_grey or theme.darker_black, bg = transparent and 'none' or theme.darker_black })
  vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = theme.white, bg = theme.black2 })
  vim.api.nvim_set_hl(0, 'TelescopeResultsDiffAdd', { fg = theme.green })
  vim.api.nvim_set_hl(0, 'TelescopeResultsDiffChange', { fg = theme.yellow })
  vim.api.nvim_set_hl(0, 'TelescopeResultsDiffDelete', { fg = theme.red })
end

ColorMyTreesitter()
ColorMyDevicons()
ColorMyDefaults()
ColorMySyntaxStandard()
ColorMyBufferline()
ColorMyCmp()
ColorMyGit()
ColorMyLSP()
ColorMyBufferline()
ColorMyMason()
ColorMyTelescope()

return theme, transparent
