vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_quickfix_enabled = 0
-- vim.opt.textwidth = 99
vim.g.maplocalleader = ' '

-- Text objects
vim.keymap.set('o', 'am', '<Plug>(vimtex-a$)')
vim.keymap.set('x', 'am', '<Plug>(vimtex-a$)')
vim.keymap.set('o', 'im', '<Plug>(vimtex-i$)')
vim.keymap.set('x', 'im', '<Plug>(vimtex-i$)')

vim.keymap.set('o', 'ai', '<Plug>(vimtex-am)')
vim.keymap.set('x', 'ai', '<Plug>(vimtex-am)')
vim.keymap.set('o', 'ii', '<Plug>(vimtex-im)')
vim.keymap.set('x', 'ii', '<Plug>(vimtex-im)')

-- Word count (texcount)
vim.keymap.set('n', '<leader>wc', '<cmd>VimtexCountWords<CR>')

-- Compile
vim.keymap.set('n', '<leader>co', '<cmd>VimtexCompile<CR>')

-- Other keymaps
vim.keymap.set('n', 'die', '<Plug>(vimtex-env-delete)')
-- dse -> delete surrounding environment
-- \begin{quote}                 dse
-- Using VimTeX is lots of fun!  -->  Using VimTeX is lots of fun!
-- \end{quote}

vim.keymap.set('n', 'cie', '<Plug>(vimtex-env-change)')
-- cse -> change surrounding environment
-- \begin{equation*}   cse align   \begin{align*}
--     % contents         -->          % contents
-- \end{equation*}                 \end{align*}

vim.keymap.set('n', 'dic', '<Plug>(vimtex-cmd-delete)')
-- dsc -> delete surrounding commands
--                       dsc
-- \textit{Hello, dsc!}  -->  Hello, dsc!

vim.keymap.set('n', 'cic', '<Plug>(vimtex-cmd-change)')
-- csc -> change surrounding commands
--                           csc textit
-- \textbf{Make me italic!}     -->      \textit{Make me italic!}


vim.keymap.set('n', 'did', '<Plug>(vimtex-delim-delete)')
-- dsd -> delete surrounding delimiters
--                     dsd
-- \left(X + Y\right)  -->  X + Y
--
--          dsd
-- (x + y)  -->  x + y

vim.keymap.set('n', 'cid', '<Plug>(vimtex-delim-change)')
-- csd -> change surrounding delimiters
--          csd [
-- (a + b)   -->   [b + b]
--
--                     csd [
-- \left(A + B\right)   -->   \left[A + B\right]

vim.keymap.set('n', 'dim', '<Plug>(vimtex-env-delete-math)')
-- ds$ -> delete surrounding math env
--                 ds$
-- $ 1 + 1 = 2 $   -->  1 + 1 = 2
--
-- \begin{equation*}                            ds$
-- Some text that shouldn't be in an equation!  --> Some text that shouldn't be in an equation!
-- \end{equation*}

vim.keymap.set('n', 'cim', '<Plug>(vimtex-env-change-math)')
-- cs$ -> change surrounding math env
--                cs$ equation
-- $ 1 + 1 = 2 $       -->       \begin{equation}
--                                   1 + 1 = 2
--                               \end{equation}
--
--                   cs$ $
-- \begin{equation}   -->  $x + y = z$
--     x + y = z
-- \end{equation}

vim.keymap.set('n', 'tic', '<Plug>(vimtex-cmd-toggle-star)')
vim.keymap.set('n', 'tie', '<Plug>(vimtex-env-toggle-star)')
-- tsc/tse -> toggle section command/equation
--                     tsc                       tsc
-- \section{Toggling}  -->  \section*{Toggling}  -->  \section{Toggling}
--
-- \begin{equation}   tse   \begin{equation*}   tse   \begin{equation}
--     x + y = z      -->        x + y = z      -->       x + y = z
-- \end{equation}           \end{equation*}           \end{equation}

vim.keymap.set('n', 'tim', '<Plug>(vimtex-env-toggle-math)')
-- ts$
--               ts$  \[              ts$   \begin{equation}
-- $1 + 1 = 2$   -->     1 + 1 = 2    -->       x + y = z
--                    \]                    \end{equation}

vim.keymap.set('n', 'tid', '<Plug>(vimtex-delim-toggle-modifier)')
-- tsd
--           tsd                        tsd
-- (x + y)   -->   \left(x + y\right)   -->   (x + y)

vim.keymap.set('n', 'tid', '<Plug>(vimtex-cmd-toggle-frac)')
-- tsf
--               tsf         tsf
-- \frac{a}{b}   -->   a/b   -->   \frac{a}{b}
