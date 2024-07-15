return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	opts = {
		ensure_installed = { "bash", "lua", "luadoc", "markdown", "vim", "vimdoc" },
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup(opts)
		-- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		-- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		-- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	end,
}
