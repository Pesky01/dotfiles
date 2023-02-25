return {
  {
    'folke/trouble.nvim',
    keys = {
      { '<leader>xx', '<cmd> TroubleToggle<CR>', desc = 'Toggle Trouble diagnostics window' }
    },
    opts = {
      use_diagnostic_signs = true,
    }
  }
}
