return {
  {
    'github/copilot.vim',
    lazy = false,
    config = function()
      -- enable copilot for specific filetypes
      vim.g.copilot_filetypes = {
        ['*'] = false,
        ['rust'] = true,
        ['tex'] = true,
        ['lua'] = true,
        ['lean'] = true,
      }

      -- helps with copilot complaining that tab is already mapped
      vim.g.copilot_assume_mapped = true
    end
  }
}
