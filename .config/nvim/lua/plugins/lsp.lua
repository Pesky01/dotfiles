local function opts(bufnr, desc)
  return { buffer = bufnr, remap = false, desc = desc }
end

return {
  {
    'j-hui/fidget.nvim',
    lazy = false,
    opts = {
      text = {
        spinner = 'dots',
      },
      timer = {
        spinner_rate = 50,
      },
      window = {
        blend = 0,
      }
    }
  },
  {
    'folke/neodev.nvim',
    lazy = false,
    config = true,
  },
  {
    -- requires vimtex/treesitter
    'iurimateus/luasnip-latex-snippets.nvim',
    ft = 'tex',
    dependencies = { 'L3MON4D3/LuaSnip', 'nvim-treesitter/nvim-treesitter' },
    opts = {
      use_treesitter = true,
    }
  },
  {
    'julian/lean.nvim',
    ft = 'lean',
    config = function()
      local lean_on_attach = function(_, bufnr)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts(bufnr, 'LSP: Go to definition'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts(bufnr, 'LSP: Hover'))
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts(bufnr, 'LSP: Workspace symbols'))
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts(bufnr, 'LSP: Open diagnostics'))
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts(bufnr, 'LSP: Next diagnostic'))
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts(bufnr, 'LSP: Previous diagnostic'))
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts(bufnr, 'LSP: Code action'))
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts(bufnr, 'LSP: References'))
        vim.keymap.set('i', '<C-sh>', vim.lsp.buf.signature_help, opts(bufnr, 'LSP: Signature help'))
        vim.keymap.set('n', '<C-x>', vim.lsp.buf.format, opts(bufnr, 'LSP: Format'))
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts(bufnr, 'LSP: Rename'))
      end

      require('lean').setup({
        abbreviations = { builtin = true },
        lsp = { on_attach = lean_on_attach },
      })
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    config = function()
      local rust_tools_settings = {
        -- need separate on_attach for rust-tools
        on_attach = function(client, bufnr)
          -- Disable semantic highlighting
          client.server_capabilities.semanticTokensProvider = nil

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts(bufnr, 'LSP: Go to definition'))
          vim.keymap.set('n', 'K', require('rust-tools').hover_actions.hover_actions, opts(bufnr, 'LSP: Hover'))
          vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts(bufnr, 'LSP: Workspace symbols'))
          vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts(bufnr, 'LSP: Open diagnostics'))
          vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts(bufnr, 'LSP: Next diagnostic'))
          vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts(bufnr, 'LSP: Previous diagnostic'))
          vim.keymap.set('n', '<space>vca', require('rust-tools').code_action_group.code_action_group,
            opts(bufnr, 'LSP: Code action'))
          vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts(bufnr, 'LSP: References'))
          vim.keymap.set('i', '<C-sh>', vim.lsp.buf.signature_help, opts(bufnr, 'LSP: Signature help'))
          vim.keymap.set('n', '<C-x>', vim.lsp.buf.format, opts(bufnr, 'LSP: Format'))
          vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts(bufnr, 'LSP: Rename'))
        end,
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              allFeatures = true,
              command = 'clippy',
            }
          }
        },
      }

      local rust_lsp = require('lsp-zero').build_options('rust_analyzer', rust_tools_settings)

      require('rust-tools').setup({
        server = rust_lsp,
        tools = {
          inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = '',
            other_hints_prefix = '',
          },
        }
      })
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      { 'williamboman/mason.nvim',           config = true },
      { 'williamboman/mason-lspconfig.nvim', config = true },

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local lsp = require('lsp-zero')

      lsp.preset('recommended')
      lsp.ensure_installed({
        'lua_ls',
        'rust_analyzer',
        'pyright',
        'texlab',
      })

      -- Fix undefined global 'vim'
      lsp.configure('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      local cmp = require('cmp')
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require('luasnip').expand_or_jumpable() then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump',
                true, true, true), '')
          elseif vim.b._copilot_suggestion ~= nil then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true,
                true, true), '')
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require('luasnip').jumpable( -1) then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true,
                true, true), '')
          elseif vim.b._copilot_suggestion ~= nil then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true,
                true, true), '')
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
      })

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {},
      })

      -- for all lsp not rust and lean
      lsp.on_attach(function(client, bufnr)
        -- Disable semantic highlighting
        client.server_capabilities.semanticTokensProvider = nil

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts(bufnr, 'LSP: Go to definition'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts(bufnr, 'LSP: Hover'))
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts(bufnr, 'LSP: Workspace symbols'))
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts(bufnr, 'LSP: Open diagnostics'))
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts(bufnr, 'LSP: Next diagnostic'))
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts(bufnr, 'LSP: Previous diagnostic'))
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts(bufnr, 'LSP: Code action'))
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts(bufnr, 'LSP: References'))
        vim.keymap.set('i', '<C-sh>', vim.lsp.buf.signature_help, opts(bufnr, 'LSP: Signature help'))
        vim.keymap.set('n', '<C-x>', vim.lsp.buf.format, opts(bufnr, 'LSP: Format'))
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts(bufnr, 'LSP: Rename'))
      end)

      lsp.setup()

      vim.diagnostic.config({
        virtual_text = true,
      })
    end
  }
}
