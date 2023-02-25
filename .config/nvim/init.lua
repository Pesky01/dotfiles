require('core.mappings')
require('core.options')

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 60 }
  end
})

-- Remove trailing whitespace
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  command = [[%s/\s\+$//e]]
})

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
    -- '--branch=stable',
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
        'matchparen',
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
