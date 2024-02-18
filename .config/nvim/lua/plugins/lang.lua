return {
  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        on_initialized = function() end,
        inlay_hints = {
          show_parameter_hints = false,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ols = {
          mason = false,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {},
    },
  },
}
