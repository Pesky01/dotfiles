return {
	{
		"echasnovski/mini.comment",
		opts = {
			mappings = {
				comment_line = "<leader>/",
				comment_visual = "<leader>/",
			},
			--options = {
			--	custom_commentstring = function()
			--		return require("ts_context_commentstring.internal").calculate_commentstring()
			--			or vim.bo.commentstring
			--	end,
			--},
		},
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
