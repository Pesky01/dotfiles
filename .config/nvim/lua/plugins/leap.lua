return {
  {
    'ggandor/leap.nvim',
    lazy = false,
    opts = {
      options = {
        max_aot_targets = nil,
        highlight_unlabeled = false,
        case_sensitive = true,
        equivalence_classes = { '\t\r\n' },
      }
    },
    config = function()
      require('leap').set_default_keymaps()
    end
  }
}
