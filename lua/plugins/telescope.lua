return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },
  config = function()
    local telescope = require 'telescope'
    telescope.setup {
      picker = {
        hidden = false,
      },
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--no-ignore',
          '--smart-case',
          '--hidden',
        },
        prompt_prefix = '     ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
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
          width = 0.80,
          height = 0.85,
          preview_cutoff = 120,
        },
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = { 'node_modules', '.git/', 'dist/' },
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        path_display = { 'absolute' },
        winblend = 0,
        border = {},
        borderchars = { '' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' },
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
        mappings = {
          i = {
            ['<Tab>'] = 'move_selection_next',
            ['<S-Tab>'] = 'move_selection_previous',
          },
          n = {
            ['<Tab>'] = 'move_selection_next',
            ['<S-Tab>'] = 'move_selection_previous',
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
        file_browse = {
          hijack_netrw = true,
          depth = false,
        },
        project = {
          display_type = 'full',
        },
      },
      pickers = {
        find_files = {
          find_command = {
            'rg',
            '--files',
            '--no-ignore',
            '--smart-case',
            '--hidden',
          },
        },
      },
    }

    telescope.load_extension 'dap'
    telescope.load_extension 'fzf'
    telescope.load_extension 'notify'
    telescope.load_extension 'project'
    telescope.load_extension 'file_browser'
    telescope.load_extension 'git_worktree'
    telescope.load_extension 'ui-select'
    telescope.load_extension 'cheat'
  end,
}
