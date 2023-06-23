local function opts(bufnr, desc)
  return { buffer = bufnr, remap = false, desc = desc }
end

local function lsp_keymaps(bufnr)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts(bufnr, 'LSP: Go to declaration'))
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts(bufnr, 'LSP: Go to definition'))

  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts(bufnr, 'LSP: Go to implementation'))
  -- I don't use these really
  -- vim.keymap.set('n', '<C-sh>', vim.lsp.buf.signature_help, opts(bufnr, 'LSP: Signature help'))
  -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts(bufnr, 'LSP: Add workspace folder'))
  -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts(bufnr, 'LSP: Remove workspace folder'))
  -- vim.keymap.set('n', '<leader>wl', vim.lsp.buf.list_workspace_folders, opts(bufnr, 'LSP: List workspace folders'))
  -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts(bufnr, 'LSP: Type definition'))
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts(bufnr, 'LSP: Rename'))

  vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts(bufnr, 'LSP: Workspace symbols'))
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts(bufnr, 'LSP: Open diagnostics'))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts(bufnr, 'LSP: Next diagnostic'))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts(bufnr, 'LSP: Previous diagnostic'))
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts(bufnr, 'LSP: References'))
  vim.keymap.set('n', '<C-x>', vim.lsp.buf.format, opts(bufnr, 'LSP: Format'))
end

return {
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    event = 'BufReadPost',
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
    -- requires vimtex/treesitter
    'iurimateus/luasnip-latex-snippets.nvim',
    ft = 'tex',
    dependencies = { 'L3MON4D3/LuaSnip', 'nvim-treesitter/nvim-treesitter' },
    opts = {
      use_treesitter = true,
    }
  },
  {
    'lervag/vimtex',
    ft = 'tex',
    config = function()
      vim.g.vimtex_view_method = 'zathura'
    end
  },
  {
    'julian/lean.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    -- ft = 'lean',
    opts = function()
      local lean_on_attach = function(_, bufnr)
        lsp_keymaps(bufnr)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts(bufnr, 'LSP: Code action'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts(bufnr, 'LSP: Hover'))
      end

      return {
        abbreviations = { builtin = true },
        lsp = { on_attach = lean_on_attach },
      }
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    opts = function()
      local rust_tools_settings = {
        on_attach = function(client, bufnr)
          -- Disable semantic highlighting
          client.server_capabilities.semanticTokensProvider = nil
          lsp_keymaps(bufnr)

          vim.keymap.set('n', '<space>vca', require('rust-tools').code_action_group.code_action_group,
            opts(bufnr, 'LSP: Code action'))
          vim.keymap.set('n', 'K', require('rust-tools').hover_actions.hover_actions, opts(bufnr, 'LSP: Hover'))
        end,
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              allFeatures = true,
              command = 'clippy',
              extraArgs = { '--all', '--', '-W', 'clippy::all' },
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          }
        },
      }

      local rust_lsp = require('lsp-zero').build_options('rust_analyzer', rust_tools_settings)

      return {
        server = rust_lsp,
        tools = {
          inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = '',
            other_hints_prefix = '',
          },
        }
      }
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

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

      -- Neovim
      { 'folke/neodev.nvim', opts = { experimental = { pathStrict = true } } },
    },
    opts = function()
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      lsp.ensure_installed({
        'cssls',
        'eslint',
        'jsonls',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'svelte',
        'tailwindcss',
        'taplo',
        'texlab',
        'tsserver',
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
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
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
          elseif require('luasnip').jumpable(-1) then
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
        mapping = cmp_mappings,
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect'
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lua' },
        },
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = '',
          warn = '',
          info = '',
          hint = '',
        },
      })

      -- for all lsp not rust
      lsp.on_attach(function(_, bufnr)
        -- Disable semantic highlighting, looks worse on some filetypes, could manually apply it to
        -- some filetypes
        -- client.server_capabilities.semanticTokensProvider = nil
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts(bufnr, 'LSP: Code action'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts(bufnr, 'LSP: Hover'))
        lsp_keymaps(bufnr)
      end)

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
      })

      -- Show diagnostic in floating window when over current underlined diagnostic
      vim.api.nvim_create_autocmd('CursorHold', {
        pattern = '*',
        callback = function()
          vim.diagnostic.open_float(nil, {
            border = 'rounded',
            focusable = false,
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
            close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
          })
        end
      })
    end
  }
}
