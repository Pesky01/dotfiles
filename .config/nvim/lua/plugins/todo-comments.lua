return {
  'folke/todo-comments.nvim',
  event = 'BufReadPost',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = {
    { ']t', function() require('todo-comments').jump_next() end, desc = 'Todo-Comments: Go to next comment' },
    { '[t', function() require('todo-comments').jump_prev() end, desc = 'Todo-Comments: Go to previous comment' },
  },
}
