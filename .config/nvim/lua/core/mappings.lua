-- leader is set in init.lua
----- NORMAL MODE -----
vim.keymap.set('n', ';', ':', { desc = 'Enter command mode' })
vim.keymap.set('n', '<leader>bd', '<cmd> bd<CR>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left pane' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom pane' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top pane' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right pane' })

vim.keymap.set('n', '<leader>sv', '<cmd> vsplit<CR><C-w>w', { desc = 'Split pane vertically' })
vim.keymap.set('n', '<leader>sp', '<cmd> split<CR><C-w>w', { desc = 'Split pane horizontally' })

vim.keymap.set('n', '<C-Up>', '<cmd> resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd> resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Right>', '<cmd> vertical resize +2<CR>', { desc = 'Increase window width' })
vim.keymap.set('n', '<C-Left>', '<cmd> vertical resize -2<CR>', { desc = 'Decrease window width' })

-- better up/down
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

----- INSERT MODE -----
vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Escape to normal mode' })

vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Go to beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Go to end of line' })

vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Left' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Up' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Right' })

----- VISUAL MODE -----
vim.keymap.set('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'Paste without yanking' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual block down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual block up' })
vim.keymap.set('v', '<', '<gv', { desc = 'Shift left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Shift right' })
vim.keymap.set('v', ';', ':', { desc = 'Enter command mode' })


-- better search
vim.keymap.set('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
vim.keymap.set('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
