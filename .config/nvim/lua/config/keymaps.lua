local Util = require("lazyvim.util")

-- Stripped base keymaps --
vim.keymap.del({ "n", "x" }, "<Down>")
vim.keymap.del({ "n", "x" }, "<Up>")
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")
-- TODO: Add <leader> + buffer id keymap
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>cf")
vim.keymap.del("n", "<leader>uf")
vim.keymap.del("n", "<leader>uF")
vim.keymap.del("n", "<leader>uw")

----- NORMAL MODE -----
vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr><C-w>w", { desc = "Split pane vertically" })
vim.keymap.set("n", "<leader>sp", "<cmd>split<cr><C-w>w", { desc = "Split pane horizontally" })
vim.keymap.set("n", "<leader>nf", "<cmd>enew<cr>", { desc = "New file" })
vim.keymap.set("n", "<leader>fc", function()
  Util.format({ force = true })
end, { desc = "Format code" })

----- INSERT MODE -----
vim.keymap.set("i", "jj", "<ESC>", { desc = "Escape to normal mode" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Left" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Right" })

----- VISUAL MODE -----
vim.keymap.set("v", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("v", "p", 'p:let @+=@0<cr>:let @"=@0<cr>', { desc = "Paste without yanking" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move visual block down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move visual block up" })
vim.keymap.set("v", "<leader>fc", function()
  Util.format({ force = true })
end, { desc = "Format code" })
