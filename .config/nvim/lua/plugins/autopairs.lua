return {
  {
    'windwp/nvim-autopairs',
    lazy = false,
    -- opts auto runs setup
    opts = {
      options = {
        fast_wrap = {},
        disable_filetype = { 'TelescopePrompt', 'vim' }
      }
    },
  },
}
