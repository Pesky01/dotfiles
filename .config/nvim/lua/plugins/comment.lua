return {
  {
    'numToStr/Comment.nvim',
    keys = {
      { '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',                 desc = 'Comment out current line' },
      { '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', mode = 'v',                       desc = 'Comment out visual selection' },
    },
    opts = { options = {} },
  }
}
