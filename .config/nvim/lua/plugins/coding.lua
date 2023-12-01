local cmp = require("cmp")
local luasnip = require("luasnip")

return {
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment_line = "<leader>/",
        comment_visual = "<leader>/",
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      suggestion = {
        accept = false,
        auto_trigger = true,
      },
      filetypes = {
        lua = true,
        typescript = true,
        rust = false,
        dart = false,
        lean = false,
        ocaml = false,
      },
    },
  },
  {
    -- Make tab completion work with cmp and copilot
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          elseif luasnip.expandable() then
            luasnip.expand()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          elseif luasnip.expandable() then
            luasnip.expand()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      experimental = {
        ghost_text = false,
      },
    },
  },
}
