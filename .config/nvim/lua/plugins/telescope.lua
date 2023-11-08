local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/harpoon",
  },
  keys = function()
    return {
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Telescope: Command history" },
      { "<leader>ff", Util.telescope("files"), desc = "Telescope: Find Files (root dir)" },
      {
        "<leader>fF",
        Util.telescope("files", { cwd = false }),
        desc = "Telescope: Find Files (cwd)",
      },
      {
        "<leader>fd",
        "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
        desc = "Telescope: Find File/folder",
      },
      { "<leader>fg", Util.telescope("live_grep"), desc = "Telescope: Grep (root dir)" },
      {
        "<leader>fG",
        Util.telescope("live_grep", { cwd = false }),
        desc = "Telescope: Grep (cwd)",
      },
      { "<leader>km", "<cmd>Telescope keymaps<cr>", desc = "Telescope: Keymaps" },
      { "<leader>hm", "<cmd>Telescope harpoon marks<cr>", desc = "Telescope: Open harpoon marks" },
      {
        "<leader>th",
        Util.telescope("colorscheme", { enable_preview = true }),
        desc = "Telescope: Colorscheme with preview",
      },
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon: Harpoon a file",
      },
    }
  end,
  config = function()
    local actions = require("telescope.actions")

    local find_files_no_ignore = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      Util.telescope("find_files", { no_ignore = true, default_text = line })()
    end
    local find_files_with_hidden = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      Util.telescope("find_files", { hidden = true, default_text = line })()
    end

    require("telescope").setup({
      pickers = { colorscheme = { enable_preview = true } },
      defaults = {
        initial_mode = "normal",
        prompt_prefix = "  ",
        entry_prefix = "  ",
        selection_caret = " ",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.85,
          height = 0.8,
          preview_cutoff = 120,
        },
        -- open files in the first window that is an actual file.
        -- use the current window if no other window is available.
        get_selection_window = function()
          local wins = vim.api.nvim_list_wins()
          table.insert(wins, 1, vim.api.nvim_get_current_win())
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == "" then
              return win
            end
          end
          return 0
        end,
        mappings = {
          i = {
            -- ["<c-t>"] = open_with_trouble,
            -- ["<a-t>"] = open_selected_with_trouble,
            -- ["<a-i>"] = find_files_no_ignore,
            -- ["<a-h>"] = find_files_with_hidden,
            -- ["<C-Down>"] = actions.cycle_history_next,
            -- ["<C-Up>"] = actions.cycle_history_prev,
            -- ["<C-f>"] = actions.preview_scrolling_down,
            -- ["<C-b>"] = actions.preview_scrolling_up,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },

      extensions_list = { "harpoon" },
    })

    require("telescope").load_extension("harpoon")
  end,
}
