return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
      lazy = true,
    },
    {
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      lazy = true,
    },
    {
      'MunifTanjim/nui.nvim',
      lazy = true,
    },
  },
  config = function()
    local icons = require 'icons'

    require('neo-tree').setup {
      close_if_last_window = true,
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = icons.gitAdd,       -- or "✚", but this is redundant ino if you use git_status_colors on the name
            modified = icons.gitChange, -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = icons.gitDeleted, -- this can only be used in the git_status source
            renamed = icons.gitRenamed, -- this can only be used in the git_status source
            -- Status type
            untracked = icons.gitUntracked,
            ignored = icons.gitIgnored,
            unstaged = icons.gitUnstaged,
            staged = icons.gitStaged,
            conflict = icons.gitUnmerged,
          },
        },
      },
      window = {
        position = 'right',
        width = 50,
        mappings = {
          ['v'] = 'open_vsplit',
          ['h'] = 'open_split',
          ['s'] = 'open_with_window_picker',
          ['t'] = 'open_tabnew',
        },
      },
      filesystem = {
        follow_current_file = true,
        use_libuv_file_watcher = true,
        always_show = {
          '.gitignore',
          '.env',
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          '.DS_Store',
          'thumbs.db',
        },
        never_show_by_pattern = { -- uses glob style patterns
          '.null-ls_*',
        },
      },
      buffers = {
        follow_current_file = true,
      },
      source_selector = {
        winbar = true,
        statusline = true,
      },
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'Outline' },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { 'terminal', 'quickfix', 'nofile' },
        },
        wo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'Outline' },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { 'terminal', 'quickfix', 'nofile', 'Outline' },
        },
      },
      other_win_hl_color = '#e35e4f',
    }
  end,
}
