-- set space to <leader>
vim.g.mapleader = " "

----- INSERT MODE -----
vim.keymap.set('i', 'jj', '<ESC>', { desc = 'jj to escape to normal mode' })

vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Go to beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Go to end of line' })

-- normal (ctrl) + motions for insert mode
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Left' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Up' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Right' })

----- NORMAL MODE -----
-- move between vim panes using Ctrl + motions
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left pane' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom pane' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top pane' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right pane' })

-- split plane horizontally/vertically
vim.keymap.set('n', '<leader>sp', ':split<Return><C-w>w', { desc = 'Split pane horizontally' })
vim.keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w', { desc = 'Split pane vertically' })

-- go up/down page/half page? but cursor stays in middle
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')

----- VISUAL MODE -----
-- Don't copy the replaced text after pasting in visual mode
vim.keymap.set('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'Paste without yanking' })

-- Move visual blocks up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual block down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual block up' })
