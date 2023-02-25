return {
  {
    'folke/trouble.nvim',
    keys = {
      { '<leader>xx', '<cmd> TroubleToggle<CR>', desc = 'Trouble: Toggle diagnostics window' }
    },
    opts = {
      use_diagnostic_signs = true,
    }
  }
}
