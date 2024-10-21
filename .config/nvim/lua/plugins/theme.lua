-- don't override tokyonight highlights, append italic property to existing highlight
local function update_hl(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend("force", old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("tokyonight-moon")
		update_hl("@keyword.function", { italic = true })
		update_hl("@keyword.repeat", { italic = true })
		update_hl("@keyword.conditional", { italic = true })
	end,
	opts = {
		style = "moon",
	},
}
