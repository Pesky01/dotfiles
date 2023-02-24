-- set space to <leader>
vim.g.mapleader = " "

----- INSERT MODE -----
-- go to normal mode
vim.keymap.set('i', 'jj', '<ESC>')

-- beginning/end of line
vim.keymap.set('i', '<C-b>', '<ESC>^i')
vim.keymap.set('i', '<C-e>', '<End>')

-- normal motions for insert mode
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

----- NORMAL MODE -----
-- move between vim panes using motions
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- split plane horizontally/vertically
vim.keymap.set('n', '<leader>sp', ':split<Return><C-w>w')
vim.keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w')

-- go up/down page/half page? but cursor stays in middle
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')

----- VISUAL MODE -----
-- Don't copy the replaced text after pasting in visual mode
vim.keymap.set('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>')

-- Move visual blocks up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
