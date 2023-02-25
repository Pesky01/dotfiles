return {
  {
    'ggandor/leap.nvim',
    lazy = false,
    keys = {
      { 's', '<Plug>(leap-forward)',  desc = 'Leap: search forward' },
      { 's', '<Plug>(leap-forward)',  desc = 'Leap: search forward',  mode = 'x' },
      { 'S', '<Plug>(leap-backward)', desc = 'Leap: search backward' },
      { 'S', '<Plug>(leap-backward)', desc = 'Leap: search backward', mode = 'x' },
    },
    opts = {
      options = {
        max_aot_targets = nil,
        highlight_unlabeled = false,
        case_sensitive = true,
        equivalence_classes = { '\t\r\n' },
      }
    },
  }
}
