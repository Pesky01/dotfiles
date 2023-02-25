return {
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = 'v3.*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<leader>1', '<cmd>lua require("bufferline").go_to_buffer(1)<CR>', desc = 'Go to Buffer 1' },
      { '<leader>2', '<cmd>lua require("bufferline").go_to_buffer(2)<CR>', desc = 'Go to Buffer 2' },
      { '<leader>3', '<cmd>lua require("bufferline").go_to_buffer(3)<CR>', desc = 'Go to Buffer 3' },
      { '<leader>4', '<cmd>lua require("bufferline").go_to_buffer(4)<CR>', desc = 'Go to Buffer 4' },
      { '<leader>5', '<cmd>lua require("bufferline").go_to_buffer(5)<CR>', desc = 'Go to Buffer 5' },
      { '<leader>6', '<cmd>lua require("bufferline").go_to_buffer(6)<CR>', desc = 'Go to Buffer 6' },
      { '<leader>7', '<cmd>lua require("bufferline").go_to_buffer(7)<CR>', desc = 'Go to Buffer 7' },
    },
    opts = {
      options = {
        numbers = 'ordinal',
        diagnostics = 'nvim_lsp', }
    },
  }
}
