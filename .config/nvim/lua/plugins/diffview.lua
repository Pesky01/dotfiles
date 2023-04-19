return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
  keys = {
    { '<leader>do', '<cmd> DiffviewOpen<CR>',        desc = 'Diffview: Open' },
    { '<leader>dc', '<cmd> DiffviewClose<CR>',       desc = 'Diffview: Close' },
    { '<leader>dt', '<cmd> DiffviewToggleFiles<CR>', desc = 'Diffview: Toggle files' },
    { '<leader>df', '<cmd> DiffviewFocusFiles<CR>',  desc = 'Diffview: Focus files' },
  },
}
