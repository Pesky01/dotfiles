return {
	"ggandor/leap.nvim", -- Lazy loads itself
	config = function()
		-- require('leap').create_default_mappings()
		-- required to not conflict with Lazy.nvim keys
		vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
		vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
		vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
	end,
}
