-- absolute line number for current line, relative otherwise
vim.opt.rnu = true
vim.opt.nu = true

-- sync clipboptard between OS and nvim
vim.opt.clipboard = 'unnamedplus'

-- transparent cmp menu (doesn't completely work)
vim.opt.pumblend = 20
vim.opt.pumheight = 10

-- global status line
vim.opt.laststatus = 3

vim.opt.breakindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.softtabstop = 2
vim.opt.shiftround = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- replace "~" eoptf chars with spaces " "
vim.opt.fillchars = { eob = ' ' }

-- enable moptuse
vim.opt.mouse = 'a'

-- Number coptlumn
vim.opt.numberwidth = 2
vim.opt.ruler = false

-- disable nvim intropt
vim.opt.shortmess:append 'sI'

vim.opt.signcolumn = 'yes'

-- pane splitting settings
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.backup = false

-- save undopt history
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 400

-- set by cmp in lsp.lua
-- vim.opt.completeopt = 'menu,menuone,noinsert'

-- highlight search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.colorcolumn = '100'
vim.opt.cul = true
vim.opt.scrolloff = 8
vim.opt.textwidth = 100
