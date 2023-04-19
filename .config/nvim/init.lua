-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 90 }
  end
})

-- Remove trailing whitespace
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  command = [[%s/\s\+$//e]]
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line('$') then
      vim.fn.setpos('.', vim.fn.getpos("'\""))
      vim.api.nvim_feedkeys('zz', 'n', true)
    end
  end
})

-- Make sure to set 'mapleader' before lazy so your mappings are correct
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

-- Bootstraps lazy.nvim
-- Github Link:
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = 'plugins' },
  },
  defaults = { lazy = true },
  checker = { enabled = true },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'netrwPlugin',
        'rplugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      }
    }
  },
})

require('core.mappings')
require('core.options')
