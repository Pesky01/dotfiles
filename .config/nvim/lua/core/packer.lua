local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- File Browser
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  -- Show errors/warnings in separate pane
  use 'folke/trouble.nvim'
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }
  use 'nvim-lualine/lualine.nvim'
  use 'github/copilot.vim'

  -- rust specific lsp stuff (e.g inlay hints)
  use 'simrat39/rust-tools.nvim'

  -- lean lsp stuff
  use 'julian/lean.nvim'

  -- move with your eyeballs
  use 'ggandor/leap.nvim'
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'
  use { 'lervag/vimtex', ft = 'tex' }
  use {
    'iurimateus/luasnip-latex-snippets.nvim',
    requires = { 'L3MON4D3/LuaSnip', "lervag/vimtex" },
    config = function()
      require 'luasnip-latex-snippets'.setup()
    end,
    ft = 'tex',
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
