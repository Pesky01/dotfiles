return {
  {
    'numToStr/Comment.nvim',
    keys = {
      { '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',                 desc = 'Comment: Comment out current line' },
      { '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', desc = 'Comment: Comment out visual selection', mode = 'v' },
    },
    opts = {
      mappings = {
        basic = false,
        extra = false,
      }
    },
  }
}
