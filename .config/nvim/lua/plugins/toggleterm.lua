return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{
			"<leader>ft",
			function()
				local dir = LazyVim.root()
				vim.cmd(string.format("ToggleTerm size=20 dir=%s direction=horizontal name=terminal", dir))
			end,
			desc = "Open Terminal",
		},
	},
	opts = {
		size = 20,
		shell = "fish",
	},
}
