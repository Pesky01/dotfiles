-- START: Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.zig_fmt_parse_errors = 0
-- END: Globals

-- START: Keymaps
vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr><C-w>w", { desc = "Split pane vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr><C-w>w", { desc = "Split pane horizontally" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlighted search" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "{", "<C-u>zz", { desc = "Move up a page and center" })
vim.keymap.set("n", "}", "<C-d>zz", { desc = "Move down a page and center" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

vim.keymap.set("i", "jj", "<ESC>", { desc = "Escape to normal mode" })

vim.keymap.set("v", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("v", "p", 'p:let @+=@0<cr>:let @"=@0<cr>', { desc = "Paste without yanking" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move visual block down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move visual block up" })
vim.keymap.set("v", ">", ">gv", { desc = "Keep visual mode after indenting", noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { desc = "Keep visual mode after indenting", noremap = true, silent = true })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Enter normal mode" })
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
-- END: Keymaps

-- START: Options
vim.opt.laststatus = 3
vim.opt.termguicolors = true
vim.opt.numberwidth = 2
vim.opt.textwidth = 120
vim.opt.colorcolumn = "120"
vim.opt.timeout = true
vim.opt.conceallevel = 0 -- disable conceal (hides quotes for json files)
vim.opt.tabstop = 4 -- TAB character looks like 4 spaces
-- NOTE: Add way to disable this for Odin and Go
-- vim.opt.expandtab = true -- pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- number of spaces inserted when indenting
vim.opt.relativenumber = false
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
-- vim.opt.cursorline = true -- highlight current line
vim.opt.scrolloff = 10 -- minimum # of lines to keep above/below cursor
vim.opt.hlsearch = true
-- case insensitive searching, unless capitals included in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- END: Options

-- START: Autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Corrretly sets commentstring for the Odin programming language",
	group = vim.api.nvim_create_augroup("FixOdinCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "// %s"
	end,
	pattern = { "odin" },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Set filetype of .ispc/.isph files to ISPC",
	pattern = { "*.ispc", "*.isph" },
	callback = function()
		vim.bo.filetype = "ispc"
	end,
})
-- END: Autocommands

-- START: Diagnostics UI Configuration
local Icons = {
	diagnostics = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	},
}

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border("CmpBorder")
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "■", -- or you can use '■' or any other character
		source = "always", -- Or "if_many"
	},
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = true,
	float = {
		border = "rounded",
		source = true,
	},
})

for type, icon in pairs(Icons.diagnostics) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- END: Diagnostics UI Configuration

-- START: Utilities
local function setup_root()
	local function realpath(path)
		if path == "" or path == nil then
			return nil
		end
		path = vim.loop.fs_realpath(path) or path
		return path
	end

	local function get_buffer_path(buf)
		return realpath(vim.api.nvim_buf_get_name(assert(buf)))
	end

	local function get_lsp_roots(buf)
		local buffer_path = get_buffer_path(buf)
		if not buffer_path then
			return {}
		end

		local roots = {}
		local clients = vim.lsp.get_active_clients({ bufnr = buf })

		for _, client in pairs(clients) do
			local workspace = client.config.workspace_folders
			for _, ws in pairs(workspace or {}) do
				roots[#roots + 1] = vim.uri_to_fname(ws.uri)
			end

			if client.config.root_dir then
				roots[#roots + 1] = client.config.root_dir
			end
		end

		return vim.tbl_filter(function(path)
			path = realpath(path)
			return path and buffer_path:find(path, 1, true) == 1
		end, roots)
	end

	local function find_root_by_patterns()
		local patterns = {
			-- Build/Config files
			"Cargo.toml", -- Rust
			"package.json", -- JavaScript/TypeScript
			"elm.json", -- Elm
			"build.odin", -- Odin
			"Makefile", -- C
			-- Version Control
			".git", -- Git directory
			-- Common project files
			".gitignore",
			"README.md",
		}

		local current_buf = vim.api.nvim_get_current_buf()
		local buffer_path = get_buffer_path(current_buf)

		local path = buffer_path or vim.loop.cwd()

		local root = vim.fs.find(function(name)
			for _, pattern in ipairs(patterns) do
				if name == pattern then
					return true
				end
			end
			return false
		end, { path = path, upward = true })[1]

		return root and vim.fs.dirname(root) or nil
	end

	local root_cache = {}

	vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter", "DirChanged" }, {
		group = vim.api.nvim_create_augroup("custom_root_cache", { clear = true }),
		callback = function(event)
			root_cache[event.buf] = nil
		end,
	})

	local function get_root()
		local buf = vim.api.nvim_get_current_buf()
		local cached = root_cache[buf]

		if not cached then
			local lsp_roots = get_lsp_roots(buf)
			if #lsp_roots > 0 then
				cached = lsp_roots[1] -- Use the first LSP root
			else
				-- Fall back to pattern matching
				cached = find_root_by_patterns() or vim.loop.cwd()
			end

			root_cache[buf] = cached
		end

		if vim.fn.has("win32") == 1 then
			return cached:gsub("/", "\\")
		end

		return cached
	end

	return get_root
end

local get_root = setup_root()
local function create_pretty_path(opts)
	opts = vim.tbl_extend("force", {
		relative = "cwd",
		modified_hl = "MatchParen",
		directory_hl = "",
		filename_hl = "Bold",
		modified_sign = "",
		readonly_icon = " 󰌾 ",
		length = 3,
	}, opts or {})

	return function(self)
		local path = vim.fn.expand("%:p")

		local win_config = vim.api.nvim_win_get_config(0)
		if win_config.relative ~= "" then -- This is a floating window
			return ""
		end

		local filetype = vim.bo.filetype
		local ignore_filetypes = {
			"help",
			"quickfix",
			"prompt",
			"hover",
			"mason",
			"notify",
			"terminal",
			"TelescopePrompt",
			"TelescopeResults",
		}

		-- Check if current filetype should be ignored
		for _, ft in ipairs(ignore_filetypes) do
			if filetype == ft then
				return ""
			end
		end

		if path == "" then
			return ""
		end

		-- Rest of your existing function code...
		-- Normalize path
		path = path:gsub("\\", "/")
		local cwd = vim.fn.getcwd():gsub("\\", "/")

		-- Make path relative to cwd if needed
		if opts.relative == "cwd" and path:find(cwd, 1, true) == 1 then
			path = path:sub(#cwd + 2)
		end

		local sep = package.config:sub(1, 1)
		local parts = vim.split(path, "[\\/]")

		-- Truncate path if needed
		if opts.length > 0 and #parts > opts.length then
			parts = { parts[1], "…", unpack(parts, #parts - opts.length + 2, #parts) }
		end

		-- Format filename with highlights
		local format_hl = function(text, hl_group)
			if not hl_group or hl_group == "" then
				return text
			end

			self.hl_cache = self.hl_cache or {}
			local lualine_hl_group = self.hl_cache[hl_group]

			if not lualine_hl_group then
				local utils = require("lualine.utils.utils")
				local gui = vim.tbl_filter(function(x)
					return x
				end, {
					utils.extract_highlight_colors(hl_group, "bold") and "bold",
					utils.extract_highlight_colors(hl_group, "italic") and "italic",
				})

				lualine_hl_group = self:create_hl({
					fg = utils.extract_highlight_colors(hl_group, "fg"),
					gui = #gui > 0 and table.concat(gui, ",") or nil,
				}, "PP_" .. hl_group)
				self.hl_cache[hl_group] = lualine_hl_group
			end

			return self:format_hl(lualine_hl_group) .. text .. self:get_default_hl()
		end

		-- Format the filename part (last part)
		if opts.modified_hl and vim.bo.modified then
			parts[#parts] = parts[#parts] .. opts.modified_sign
			parts[#parts] = format_hl(parts[#parts], opts.modified_hl)
		else
			parts[#parts] = format_hl(parts[#parts], opts.filename_hl)
		end

		-- Format directory part
		local dir = ""
		if #parts > 1 then
			dir = table.concat({ unpack(parts, 1, #parts - 1) }, sep)
			dir = format_hl(dir .. sep, opts.directory_hl)
		end

		-- Add readonly icon if needed
		local readonly = ""
		if vim.bo.readonly then
			readonly = format_hl(opts.readonly_icon, opts.modified_hl)
		end

		return dir .. parts[#parts] .. readonly
	end
end
-- END: Utilities

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- START: Plugins
		{
			"Bekaboo/deadcolumn.nvim",
			event = "VeryLazy",
			opts = {
				scope = "line", ---@type string|fun(): integer
				modes = { "n", "i", "v" },
				blending = {
					threshold = 1.0, -- only show line when at max line length
					colorcode = "#000000",
					hlgroup = { "Normal", "bg" },
				},
				warning = {
					alpha = 0.4,
					offset = 0,
					colorcode = "#FF0000",
					hlgroup = { "Error", "bg" },
				},
				extra = {
					---@type string?
					follow_tw = nil,
				},
			},
		},

		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				local function my_on_attach(bufnr)
					local api = require("nvim-tree.api")

					-- Default mappings
					api.config.mappings.default_on_attach(bufnr)

					-- Remove the filter keybinds
					vim.keymap.del("n", "F", { buffer = bufnr })
					vim.keymap.del("n", "f", { buffer = bufnr })
				end

				require("nvim-tree").setup({
					sort = {
						sorter = "case_sensitive",
					},
					view = {
						width = 30,
					},
					renderer = {
						group_empty = true,
						icons = {
							show = {
								file = true,
								folder = true,
								folder_arrow = true,
								git = false,
							},
						},
					},
					filters = {
						dotfiles = true,
					},
					actions = {
						open_file = {
							window_picker = {
								enable = false,
							},
						},
					},
					ui = {
						confirm = {
							remove = true, -- Confirm before deleting files
							default_yes = false,
						},
					},
					-- root_dirs = { "src" },
					prefer_startup_root = true,
					sync_root_with_cwd = true,
					respect_buf_cwd = true,
					on_attach = my_on_attach,
				})

				-- Set keymaps
				vim.keymap.set("n", "fe", ":NvimTreeToggle<CR>", { silent = true })
			end,
		},

		{
			"ggandor/leap.nvim", -- Lazy loads itself
			config = function()
				-- require('leap').create_default_mappings()
				-- required to not conflict with Lazy.nvim keys
				vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
				vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			end,
		},

		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			main = "nvim-treesitter.configs",
			opts = {
				ensure_installed = { "lua", "luadoc", "vim", "vimdoc" },
				auto_install = false,
				highlight = { enable = true },
			},
		},

		{
			"nvim-treesitter/nvim-treesitter-context",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			opts = {
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				multiwindow = false, -- Enable multiwindow support.
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 4, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			},
		},

		{
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
					ignore_focus = { "NvimTree", "toggleterm" },
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ create_pretty_path(), separator = "", padding = { left = 0, right = 1 } },
					},
					lualine_x = { { "encoding", separator = " ", padding = { left = 0, right = 1 } } },
					lualine_y = {},
					lualine_z = {},
				},
			},
		},

		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			init = function()
				local function update_hl(group, tbl)
					local old_hl = vim.api.nvim_get_hl_by_name(group, true)
					local new_hl = vim.tbl_extend("force", old_hl, tbl)
					vim.api.nvim_set_hl(0, group, new_hl)
				end

				vim.cmd.colorscheme("tokyonight-moon")
				update_hl("@keyword.function", { italic = true })
				update_hl("@keyword.repeat", { italic = true })
				update_hl("@keyword.conditional", { italic = true })
			end,
			opts = {
				style = "moon",
				on_colors = function(colors)
					colors.bg_statusline = colors.bg
				end,
				on_highlights = function(hl, c)
					hl.StatusLine = {
						bg = c.bg,
					}
					hl.StatusLineNC = {
						bg = c.bg,
					}
				end,
			},
		},

		{
			"mfussenegger/nvim-lint",
			lazy = false,
			config = function()
				local lint = require("lint")

				lint.linters_by_ft = {
					-- javascript = { "oxlint" },
					-- javascriptreact = { "oxlint" },
					-- typescript = { "oxlint" },
					-- typescriptreact = { "oxlint" },
				}

				vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
					group = vim.api.nvim_create_augroup("lint", { clear = true }),
					callback = function()
						lint.try_lint()
					end,
				})
			end,
		},

		{
			"echasnovski/mini.pairs",
			version = "*",
			event = "VeryLazy",
			config = function()
				require("mini.pairs").setup({
					-- In which modes mappings from this `config` should be created
					modes = { insert = true, command = false, terminal = false },

					-- Global mappings. Each right hand side should be a pair information, a
					-- table with at least these fields (see more in |MiniPairs.map|):
					-- - `action` - one of "open", "close", "closeopen".
					-- - `pair` - two-character string for pair to be used.
					-- By default pair is not inserted after `\`, quotes are not recognized by
					-- `<` and `>`, `{` and `}` are not recognized by `<` and `>`
					mappings = {
						["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
						["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
						["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

						[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
						["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
						["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

						['"'] = {
							action = "closeopen",
							pair = '""',
							neigh_pattern = "[^\\].",
							register = { cr = false },
						},
						["'"] = {
							action = "closeopen",
							pair = "''",
							neigh_pattern = "[^%a\\].",
							register = { cr = false },
						},
						["`"] = {
							action = "closeopen",
							pair = "``",
							neigh_pattern = "[^\\].",
							register = { cr = false },
						},
					},
				})
			end,
		},

		{
			"stevearc/conform.nvim",
			lazy = false,
			keys = {
				{
					"fc",
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
					typescript = { "biome" },
					typescriptreact = { "biome" },
					javascript = { "biome" },
					javascriptreact = { "biome" },
					zig = { "zigfmt" },
				},
			},
		},

		{
			"echasnovski/mini.statusline",
			version = "*",
			config = function()
				require("mini.statusline").setup({
					use_icons = true, -- Requires a Nerd Font
					set_vim_settings = true,
				})
			end,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				"lewis6991/gitsigns.nvim",
			},
		},

		{
			"nvim-telescope/telescope.nvim",
			event = "VimEnter",
			branch = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
					cond = function()
						return vim.fn.executable("make") == 1
					end,
				},
				{ "nvim-telescope/telescope-ui-select.nvim" },
				{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
				{
					"stevearc/aerial.nvim",
					opts = {},
					dependencies = {
						"nvim-treesitter/nvim-treesitter",
						"nvim-tree/nvim-web-devicons",
					},
				},
			},
			config = function()
				require("telescope").setup({
					defaults = {
						vimgrep_arguments = {
							"rg",
							"-L",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
						},
						prompt_prefix = "   ",
						selection_caret = "  ",
						entry_prefix = "  ",
						initial_mode = "normal",
						selection_strategy = "reset",
						sorting_strategy = "ascending",
						layout_strategy = "horizontal",
						layout_config = {
							horizontal = {
								prompt_position = "top",
								preview_width = 0.6,
								results_width = 0.4,
							},
							vertical = {
								mirror = false,
							},
							width = 0.85,
							height = 0.85,
							preview_cutoff = 120,
						},
						file_sorter = require("telescope.sorters").get_fuzzy_file,
						file_ignore_patterns = { "node_modules" },
						generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
						path_display = { "truncate" },
						winblend = 0,
						border = {},
						borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						color_devicons = true,
						set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
						file_previewer = require("telescope.previewers").vim_buffer_cat.new,
						grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
						qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
						buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
						mappings = {
							n = {
								["q"] = require("telescope.actions").close,
								["x"] = require("telescope.actions").delete_buffer,
							},
						},
					},
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown(),
						},
						["aerial"] = {
							col1_width = 4,
							col2_width = 30,
							format_symbol = function(symbol_path, filetype)
								if filetype == "json" or filetype == "yaml" then
									return table.concat(symbol_path, ".")
								else
									return symbol_path[#symbol_path]
								end
							end,
							show_columns = "both",
						},
					},
				})

				-- Enable telescope extensions
				pcall(require("telescope").load_extension, "fzf")
				pcall(require("telescope").load_extension, "ui-select")
				pcall(require("telescope").load_extension, "aerial")

				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
				vim.keymap.set("n", "fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
				vim.keymap.set("n", "ff", builtin.find_files, { desc = "[F]ind [F]iles" })
				vim.keymap.set("n", "fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
				vim.keymap.set("n", "fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
				vim.keymap.set("n", "fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
				-- vim.keymap.set("n", "fr", builtin.resume, { desc = "[F]ind [R]esume" })
				vim.keymap.set("n", "fo", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
				vim.keymap.set("n", "fb", builtin.buffers, { desc = "[F]ind existing [b]uffers" })
				vim.keymap.set("n", "co", "<cmd>AerialToggle!<CR>", { desc = "[F]ind existing [b]uffers" })
			end,
		},

		{ -- LSP Configuration
			"neovim/nvim-lspconfig",
			dependencies = {
				-- Automatically install LSPs and related tools to stdpath for Neovim
				{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				"Saghen/blink.cmp",

				-- Useful status updates for LSP.
				{ "j-hui/fidget.nvim", opts = {} },
			},
			config = function()
				--  This function gets run when an LSP attaches to a particular buffer.
				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
					callback = function(event)
						local map = function(keys, func, desc)
							vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
						end

						-- Jump to the definition of the word under your cursor.
						--  This is where a variable was first declared, or where a function is defined, etc.
						--  To jump back, press <C-t>.
						map("<leader>gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

						-- Find references for the word under your cursor.
						map("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

						-- Jump to the implementation of the word under your cursor.
						--  Useful when your language has ways of declaring types without an actual implementation.
						map("<leader>gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

						-- Jump to the type of the word under your cursor.
						--  Useful when you're not sure what type a variable is and you want to see
						--  the definition of its *type*, not where it was *defined*.
						map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

						-- Fuzzy find all the symbols in your current document.
						--  Symbols are things like variables, functions, types, etc.
						map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

						-- Fuzzy find all the symbols in your current workspace.
						--  Similar to document symbols, except searches over your entire project.
						map(
							"<leader>ws",
							require("telescope.builtin").lsp_dynamic_workspace_symbols,
							"[W]orkspace [S]ymbols"
						)

						-- Rename the variable under your cursor.
						--  Most Language Servers support renaming across files, etc.
						map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

						-- Execute a code action, usually your cursor needs to be on top of an error
						-- or a suggestion from your LSP for this to activate.
						map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

						-- Opens a popup that displays documentation about the word under your cursor
						--  See `:help K` for why this keymap.
						map("K", vim.lsp.buf.hover, "Hover Documentation")

						-- WARN: This is not Goto Definition, this is Goto Declaration.
						--  For example, in C this would take you to the header.
						map("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

						-- The following two autocommands are used to highlight references of the
						-- word under your cursor when your cursor rests there for a little while.
						--    See `:help CursorHold` for information about when this is executed
						--
						-- When you move your cursor, the highlights will be cleared (the second autocommand).
						local client = vim.lsp.get_client_by_id(event.data.client_id)

						client.server_capabilities.semanticTokensProvider = nil
						if client and client.server_capabilities.documentHighlightProvider then
							local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
							vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.document_highlight,
							})

							vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.clear_references,
							})

							vim.api.nvim_create_autocmd("LspDetach", {
								group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
								callback = function(event2)
									vim.lsp.buf.clear_references()
									vim.api.nvim_clear_autocmds({
										group = "lsp-highlight",
										buffer = event2.buf,
									})
								end,
							})
						end

						-- The following autocommand is used to enable inlay hints in your
						-- code, if the language server you are using supports them
						--
						-- This may be unwanted, since they displace some of your code
						if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
							map("<leader>th", function()
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
							end, "[T]oggle Inlay [H]ints")
						end
					end,
				})

				-- LSP servers and clients are able to communicate to each other what features they support.
				--  By default, Neovim doesn't support everything that is in the LSP specification.
				--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
				--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

				-- Enable the following language servers
				--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
				--
				--  Add any additional override configuration in the following tables. Available keys are:
				--  - cmd (table): Override the default command used to start the server
				--  - filetypes (table): Override the default list of associated filetypes for the server
				--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
				--  - settings (table): Override the default settings passed when initializing the server.
				--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

				-- See `:help lspconfig-all` for a list of all the pre-configured LSPs
				local servers = {
					rust_analyzer = {
						settings = {
							["rust-analyzer"] = {
								check = {
									command = "clippy",
										-- stylua: ignore
										extraArgs = {
											"--",
											"--no-deps",
											"-W", "clippy::pedantic",
											-- "-A", "unused_variables",
											-- "-A", "dead_code",
											"-A", "clippy::struct_excessive_bools",
											"-A", "clippy::struct_field_names",
											"-A", "clippy::module_name_repetitions",
										},
								},
								checkOnSave = true,
								procMacro = {
									enable = true,
								},
							},
						},
					},
					tailwindcss = {},
					lua_ls = {
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								-- completion = {
								-- 	callSnippet = "Replace",
								-- },
								-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
								-- diagnostics = { disable = { 'missing-fields' } },
							},
						},
					},
					-- ts_ls = {
					-- 	settings = {
					-- 		implicitProjectConfiguration = {
					-- 			checkJs = true,
					-- 		},
					-- 	},
					-- },
				}

				require("mason").setup()

				-- Auto Install these:
				local ensure_installed = vim.tbl_keys(servers or {})
				vim.list_extend(ensure_installed, {
					"stylua",
				})
				require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

				require("mason-lspconfig").setup({
					handlers = {
						function(server_name)
							local server = servers[server_name] or {}
							-- This handles overriding only values explicitly passed
							-- by the server configuration above. Useful when disabling
							-- certain features of an LSP (for example, turning off formatting for tsserver)
							server.capabilities =
								vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
							require("lspconfig")[server_name].setup(server)
						end,
					},
				})
			end,
		},

		{
			"folke/neodev.nvim",
			ft = "lua",
			opts = {
				library = {
					types = true,
				},
			},
		},

		{
			"akinsho/toggleterm.nvim",
			version = "*",
			keys = {
				{
					"ft",
					function()
						local dir = get_root()
						vim.cmd(string.format("ToggleTerm size=20 dir=%s direction=horizontal name=terminal", dir))
					end,
					desc = "Open Terminal",
				},
			},
			opts = {
				size = 20,
				shell = "fish",
			},
		},

		{
			"echasnovski/mini.comment",
			opts = {
				mappings = {
					comment_line = "<leader>/",
					comment_visual = "<leader>/",
				},
			},
		},

		{
			"folke/todo-comments.nvim",
			event = "VimEnter",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = { signs = false },
		},

		{
			"saghen/blink.cmp",
			lazy = false,
			version = "v0.*",
			opts = {
				keymap = {
					["<Tab>"] = { "select_next", "fallback" },
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<CR>"] = { "accept", "fallback" },
					-- Keep other useful default mappings
					["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
					["<C-e>"] = { "hide" },
					["<C-y>"] = { "select_and_accept" },
					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },
				},

				completion = {
					trigger = {
						show_on_keyword = true,
						show_on_trigger_character = true,
						show_on_insert_on_trigger_character = false,
					},
					list = {
						selection = { preselect = false, auto_insert = false },
						cycle = {
							from_bottom = true,
							from_top = true,
						},
					},
				},

				sources = {
					default = { "lsp", "path", "buffer" },
				},

				appearance = {
					nerd_font_variant = "mono",
					use_nvim_cmp_as_default = true,
				},

				fuzzy = {
					use_frecency = true,
					use_proximity = true,
				},
			},
		},
		-- END: Plugins
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})
