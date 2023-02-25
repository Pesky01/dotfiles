return {
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = 'v3.*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<leader>1', '<cmd>lua require("bufferline").go_to_buffer(1)<CR>', desc = 'Bufferline: Go to 1' },
      { '<leader>2', '<cmd>lua require("bufferline").go_to_buffer(2)<CR>', desc = 'Bufferline: Go to 2' },
      { '<leader>3', '<cmd>lua require("bufferline").go_to_buffer(3)<CR>', desc = 'Bufferline: Go to 3' },
      { '<leader>4', '<cmd>lua require("bufferline").go_to_buffer(4)<CR>', desc = 'Bufferline: Go to 4' },
      { '<leader>5', '<cmd>lua require("bufferline").go_to_buffer(5)<CR>', desc = 'Bufferline: Go to 5' },
      { '<leader>6', '<cmd>lua require("bufferline").go_to_buffer(6)<CR>', desc = 'Bufferline: Go to 6' },
      { '<leader>7', '<cmd>lua require("bufferline").go_to_buffer(7)<CR>', desc = 'Bufferline: Go to 7' },
    },
    opts = {
      options = {
        numbers = 'ordinal',
        diagnostics = 'nvim_lsp', }
    },
  }
}
