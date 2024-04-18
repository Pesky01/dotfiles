local Util = require("lazyvim.util")

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { Util.lualine.pretty_path() },
        },
        lualine_x = { { "encoding", separator = " ", padding = { left = 0, right = 1 } } },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", separator = " ", padding = { left = 0, right = 1 } },
        },
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "BufReadPost",
    opts = {
      text = {
        spinner = "dots",
      },
      timer = {
        spinner_rate = 50,
      },
      window = {
        blend = 0,
      },
    },
  },
}
