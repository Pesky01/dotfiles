vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<CR>')
-- vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>')

require('trouble').setup({
  use_diagnostic_signs = true,
})
