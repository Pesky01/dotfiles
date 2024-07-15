return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	init = function()
		vim.cmd.colorscheme("tokyonight-night")

		-- vim.cmd.hi("Comment gui=none")
		vim.cmd.hi("ColorColumn ctermbg=0 guibg=#292e42")
	end,
}
