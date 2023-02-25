require('core.mappings')
require('core.options')

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
  -- everything is lazy loaded by default, set lazy = false for specific plugins
  defaults = { lazy = false },
  checker = { enabled = true },
  performance = {
    cache = { enabled = true },
  },
})
