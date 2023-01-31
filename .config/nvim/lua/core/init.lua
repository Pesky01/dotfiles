require('core.options')
require('core.mappings')

local autocmd = vim.api.nvim_create_autocmd

function R(name)
  require('plenary.reload').reload_module(name)
end

autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 60,
    })
  end,
})

autocmd({ 'BufWritePre' }, {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
