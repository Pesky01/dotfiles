return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'c',
        'css',
        'fish',
        'elm',
        'html',
        'javascript',
        'lua',
        'python',
        'regex',
        'rust',
        'svelte',
        'toml',
        'tsx',
        'typescript',
        'yaml'
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- better indentation
      indent = {
        enable = true,
        disable = { 'python' }
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      auto_install = false,
      highlight = {
        enable = true,
        disable = { 'tex', 'latex', 'lean' },
        -- additional_vim_regex_highlighting = false,
      }
    })
  end,
}
