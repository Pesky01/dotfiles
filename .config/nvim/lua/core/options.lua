local opt = vim.opt

opt.rnu = true
-- Share clipboard between wsl and windoww (with wslyank)
opt.clipboard = 'unnamedplus'

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'a'

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append 'sI'

opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true
opt.updatetime = 250

-- auto-wrap comments, don't auto insert comment on o/O and enter
opt.formatoptions:remove 'cro'

opt.hlsearch = false
opt.incsearch = true
opt.colorcolumn = '99'
opt.cul = true
opt.scrolloff = 8
opt.textwidth = 80
