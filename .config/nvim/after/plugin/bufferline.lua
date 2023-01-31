vim.keymap.set('n', '<leader>1', '<cmd>lua require("bufferline").go_to_buffer(1)<CR>')
vim.keymap.set('n', '<leader>2', '<cmd>lua require("bufferline").go_to_buffer(2)<CR>')
vim.keymap.set('n', '<leader>3', '<cmd>lua require("bufferline").go_to_buffer(3)<CR>')
vim.keymap.set('n', '<leader>4', '<cmd>lua require("bufferline").go_to_buffer(4)<CR>')
vim.keymap.set('n', '<leader>5', '<cmd>lua require("bufferline").go_to_buffer(5)<CR>')
vim.keymap.set('n', '<leader>6', '<cmd>lua require("bufferline").go_to_buffer(6)<CR>')
vim.keymap.set('n', '<leader>7', '<cmd>lua require("bufferline").go_to_buffer(7)<CR>')

require('bufferline').setup({
  options = {
    numbers = 'ordinal',
    diagnostics = 'nvim_lsp',
  }
})
