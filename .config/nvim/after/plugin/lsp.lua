local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
  'sumneko_lua',
  'rust_analyzer',
  'pyright',
  'texlab',
})

-- Fix undefined global 'vim'
lsp.configure('sumneko_lua', {
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
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
    elseif vim.b._copilot_suggestion ~= nil then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
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
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
    elseif vim.b._copilot_suggestion ~= nil then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
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

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  -- Disable semantic highlighting
  client.server_capabilities.semanticTokensProvider = nil

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
  vim.keymap.set('i', '<C-sh>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<C-x>', vim.lsp.buf.format, opts)
end)

local lean_on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<space>vca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
  vim.keymap.set('i', '<C-sh>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<C-x>', vim.lsp.buf.format, opts)
end

local rt = require('rust-tools')
local rust_analyzer_settings = {
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    -- Disable semantic highlighting
    client.server_capabilities.semanticTokensProvider = nil

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, opts)
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<space>vca', rt.code_action_group.code_action_group, opts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-sh>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<C-x>', vim.lsp.buf.format, opts)
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

local rust_lsp = lsp.build_options('rust_analyzer', rust_analyzer_settings)

lsp.setup()

require('lean').setup({
  abbreviations = { builtin = true },
  lsp = { on_attach = lean_on_attach },
})

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

vim.diagnostic.config({
  virtual_text = true,
})
