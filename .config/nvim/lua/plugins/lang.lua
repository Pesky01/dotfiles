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
    --@class PluginLspOpts
    opts = {
      servers = {
        ocamllsp = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
        ocaml = { "ocamlformat" },
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  },
  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      return {
        abbreviations = { builtin = true },
      }
    end,
  },
}
