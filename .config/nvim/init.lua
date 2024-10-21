-- Globals
vim.g.have_nerd_font = true
vim.g.autoformat = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

_G.LazyVim = require("lazyvim.util")

require("lazy").setup({
	{
		import = "plugins",
		ui = {
			icons = vim.g.have_nerd_font and {} or {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				require = "🌙",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
	},
})

-- Keymaps
-- Normal Mode
vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr><C-w>w", { desc = "Split pane vertically" })
vim.keymap.set("n", "<leader>sp", "<cmd>split<cr><C-w>w", { desc = "Split pane horizontally" })
vim.keymap.set("n", "<leader>nf", "<cmd>enew<cr>", { desc = "New file" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlighted search" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Insert Mode
vim.keymap.set("i", "jj", "<ESC>", { desc = "Escape to normal mode" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Left" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Right" })

-- Visual Mode
vim.keymap.set("v", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("v", "p", 'p:let @+=@0<cr>:let @"=@0<cr>', { desc = "Paste without yanking" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move visual block down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move visual block up" })
-- Keep visual mode after indenting
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

-- Terminal Mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Enter normal mode" })
-- Terminal Mappings
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Options
vim.opt.numberwidth = 2
vim.opt.textwidth = 100
vim.opt.colorcolumn = "100"
vim.opt.timeout = true
vim.opt.conceallevel = 0 -- disable conceal (hides quotes for json)
vim.opt.tabstop = 4 -- TAB character looks like 4 spaces
-- vim.opt.expandtab = true -- pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- number of spaces inserted when indenting
vim.opt.relativenumber = true
vim.opt.number = true -- absolute line # for current line
vim.opt.mouse = "a" -- enable mouse
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus" -- sync OS and Neovim clipboard
vim.opt.breakindent = true
vim.opt.undofile = true -- save undo history
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true -- sets default split behavior
vim.opt.splitbelow = true -- sets default split behavior
vim.opt.inccommand = "split" -- view substitutions live
vim.opt.cursorline = true -- highlight current line
vim.opt.scrolloff = 10 -- minimum # of lines to keep above/below cursor
vim.opt.hlsearch = true

-- Display certain whitespace characters
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- case insensitive searching, unless capitals included in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("FixOdinCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "// %s"
	end,
	pattern = { "odin" },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.ispc", "*.isph" },
	callback = function()
		vim.bo.filetype = "ispc"
	end,
})
