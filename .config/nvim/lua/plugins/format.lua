return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>fc",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat [C]ode",
		},
	},
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter is found.
			javascript = { "biome" },
			typescript = { "biome" },
		},
	},
}
