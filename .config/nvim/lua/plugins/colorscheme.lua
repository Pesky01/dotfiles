return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night",
    transparent = false,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      -- sidebars = "transparent",
      -- floats = "transparent",
    },
    on_highlights = function(hl, c)
      -- Borderless Telescope
      local prompt = "#2d3149"
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      -- highlight current line number
      hl.CursorLineNr = {
        fg = c.orange,
      }
      -- remove currentline highlight bg so it looks transparent
      hl.CursorLine = {
        bg = "NONE"
      }
    end,
  },
}
