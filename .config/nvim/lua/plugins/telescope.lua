return {
  {
    'nvim-telescope/telescope.nvim',
    -- cant lazy load to hijack netrw
    lazy = false,
    version = '0.1.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'ThePrimeagen/harpoon',
      'xiyaowong/telescope-emoji.nvim',
    },
    keys = {
      { '<leader>ff',  '<cmd> Telescope file_browser path=%:p:h <CR>',                           desc = 'Telescope: File browser' },
      { '<leader>fwd', '<cmd> Telescope file_browser <CR>',                                      desc = 'Telescope: File browser at pwd' },
      { '<leader>fz',  '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', desc = 'Telescope: File/folder fuzzy finder' },
      { '<leader>fw',  '<cmd> Telescope live_grep <CR>',                                         desc = 'Telescope: Live grep' },
      { '<leader>fb',  '<cmd> Telescope buffers <CR>',                                           desc = 'Telescope: Buffers' },
      { '<leader>fh',  '<cmd> Telescope help_tags <CR>',                                         desc = 'Telescope: Help tags' },
      { '<leader>fo',  '<cmd> Telescope oldfiles <CR>',                                          desc = 'Telescope: Old files' },
      { '<leader>tk',  '<cmd> Telescope keymaps <CR>',                                           desc = 'Telescope: Keymaps' },
      { '<leader>un',  '<cmd> Telescope undo <CR>',                                              desc = 'Telescope: Undo Tree' },
      { '<leader>ha',  '<cmd> Telescope harpoon marks <CR>',                                     desc = 'Telescope: Harpoon menu' },

      { '<leader>fp',  '<cmd> Telescope planets <CR>',                                           desc = 'Telescope: Planets' },
      { '<leader>fe',  '<cmd> Telescope emoji <CR>',                                             desc = 'Telescope: Emoji' },
      -- TODO: Figure out how to make this work for custom themes
      -- { '<leader>th',  '<cmd> Telescope colorscheme <CR>',                                       desc = 'Telescope: Themes' },
      { '<leader>cm',  '<cmd> Telescope git_commits <CR>',                                       desc = 'Telescope: Git commits' },
      { '<leader>gt',  '<cmd> Telescope git_status <CR>',                                        desc = 'Telescope: Git status' },
      -- harpoon
      { '<leader>m',   function() require('harpoon.mark').add_file() end,                        desc = 'Harpoon: Mark a file' },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
          prompt_prefix = '   ',
          selection_caret = '  ',
          entry_prefix = '  ',
          initial_mode = 'normal',
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          file_ignore_patterns = { 'node_modules' },
          generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
          path_display = { 'truncate' },
          winblend = 0,
          border = {},
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
          mappings = {
            n = { ['q'] = require('telescope.actions').close },
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            mappings = {
              ['i'] = {
                ['<C-r>'] = require('telescope').extensions.file_browser.actions.rename,
                ['<C-d>'] = require('telescope').extensions.file_browser.actions.remove,
                ['<C-n>'] = require('telescope').extensions.file_browser.actions.create,
              },
              ['n'] = {
                ['<C-r>'] = require('telescope').extensions.file_browser.actions.rename,
                ['<C-d>'] = require('telescope').extensions.file_browser.actions.remove,
                ['<C-n>'] = require('telescope').extensions.file_browser.actions.create,
              }
            }
          },
          undo = {
            entry_format = 'State #$ID | $STAT | $TIME',
            side_by_side = true,
            mappings = {
              ['i'] = {
                ['<cr>'] = require('telescope-undo.actions').yank_additions,
                ['<S-cr'] = require('telescope-undo.actions').yank_deletions,
                ['<C-cr>'] = require('telescope-undo.actions').restore,
              },
              ['n'] = {
                ['<cr>'] = require('telescope-undo.actions').yank_additions,
                ['<S-cr'] = require('telescope-undo.actions').yank_deletions,
                ['<C-cr>'] = require('telescope-undo.actions').restore,
              }
            }
          },
        },
        extensions_list = { 'file_browser', 'undo', 'harpoon' }
      }

      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('undo')
      require('telescope').load_extension('harpoon')
      require('telescope').load_extension('emoji')
    end
  },
}
