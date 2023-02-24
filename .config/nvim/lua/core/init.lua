require('core.options')
require('core.mappings')

function R(name)
  require('plenary.reload').reload_module(name)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Highlight on copy (y)
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 60,
    })
  end,
})

-- auto-wrap comments, don't auto insert comment on o/O and enter
-- vim.api.nvim_create_autocmd('BufEnter', {
--     pattern = '*',
--     callback = function()
--       vim.opt_local.formatoptions:remove 'cro'
--     end,
-- })

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- doesnt matter? because netrw is hijacked by telescope file browser
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
