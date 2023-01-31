local km = vim.keymap
vim.g.mapleader = " "

-- Insert Mode
km.set('i', 'jj', '<ESC>')

km.set('i', '<C-b>', '<ESC>^i')
km.set('i', '<C-e>', '<End>')

km.set('i', '<C-h>', '<Left>')
km.set('i', '<C-j>', '<Down>')
km.set('i', '<C-k>', '<Up>')
km.set('i', '<C-l>', '<Right>')

-- Normal Mode
km.set('n', '<C-h>', '<C-w>h')
km.set('n', '<C-j>', '<C-w>j')
km.set('n', '<C-k>', '<C-w>k')
km.set('n', '<C-l>', '<C-w>l')

km.set('n', '<leader>sp', ':split<Return><C-w>w')
km.set('n', '<leader>sv', ':vsplit<Return><C-w>w')

-- km.set('n', '<C-d>', '<C-d>zz')
-- km.set('n', '<C-u>', '<C-u>zz')

-- Visual Mode
-- Don't copy the replaced text after pasting in visual mode
km.set('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>')

-- Move visual blocks up and down
km.set('v', 'J', ":m '>+1<CR>gv=gv")
km.set('v', 'K', ":m '<-2<CR>gv=gv")
