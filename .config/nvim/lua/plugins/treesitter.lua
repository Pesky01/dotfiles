---@class parser
local parser = require("nvim-treesitter.parsers").get_parser_configs()

parser.dart = {
  install_info = {
    url = "https://github.com/UserNobody14/tree-sitter-dart",
    files = { "src/parser.c", "src/scanner.c" },
    revision = "8aa8ab977647da2d4dcfb8c4726341bee26fbce4", -- The last commit before the snail speed
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    indent = {
      disable = { "dart", "ocaml" },
    },
  },
}
