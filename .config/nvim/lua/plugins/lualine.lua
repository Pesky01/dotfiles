return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			vim.o.statusline = " "
		else
			vim.o.laststatus = 0
		end
	end,
	opts = {
		options = {
			theme = "auto",
			global_status = vim.o.laststatus == 3,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				{
					"diagnostics",
					symbols = {
						error = require("config").defaults.icons.diagnostics.Error,
						warn = require("config").defaults.icons.diagnostics.Warn,
						info = require("config").defaults.icons.diagnostics.Info,
						hint = require("config").defaults.icons.diagnostics.Hint,
					},
				},
				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				{ LazyVim.lualine.pretty_path() },
			},
			lualine_x = { { "encoding", separator = " ", padding = { left = 0, right = 1 } } },
			lualine_y = {
				{ "progress", separator = " ", padding = { left = 1, right = 0 } },
				{ "location", separator = " ", padding = { left = 0, right = 1 } },
			},
		},
	},
}
