return {
  'folke/which-key.nvim',
  lazy = false,
  init = function()
    local leader = {
      ['f'] = {
        name = '+telescope',
      },
    }
    require('which-key').register(leader, { prefix = '<leader>' })
  end,
  opts = {
    show_help = false,
    show_keys = false,
    key_labels = { ['<leader>'] = 'SPC' },
  }
}
