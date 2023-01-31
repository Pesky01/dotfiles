require('leap').set_default_keymaps()
require('leap').setup({
  options = {
    max_aot_targets = nil,
    highlight_unlabeled = false,
    case_sensitive = true,
    equivalence_classes = { '\t\r\n' },
  }
})
