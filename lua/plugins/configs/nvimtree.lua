local ok, t = pcall(require, 'nvim-tree')

if not ok then
    return
end

local g = vim.g
local signs = require 'utils'.signs
local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

t.setup {
    auto_reload_on_write = true,
    disable_netrw = true,
    sort_by = 'name',
    renderer = {
        add_trailing = true,
        indent_markers = {
            enable = true,
            icons = {
                corner = '└ ',
                edge = '│ ',
                none = '  ',
            },
        },
        icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = false,
            },
            webdev_colors = true,
            glyphs = {
              default = '',
              symlink = '',
              git = {
                  unstaged = '',
                  staged = 'ﰶ',
                  unmerged = '',
                  renamed = '➜',
                  untracked = '',
                  deleted = '﯀',
                  ignored = '',
              },
              folder = {
                  arrow_open = '',
                  arrow_closed = '',
                  default = '',
                  open = '',
                  empty = '',
                  empty_open = '',
                  symlink = '',
                  symlink_open = '',
              },
            },
        },
    },
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
        enable = false,
        icons = {
            hint = signs.Hint,
            info = signs.Info,
            warning = signs.Warning,
            error = signs.Error,
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {
            '^.git$',
        },
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        width = 35,
        height = 30,
        hide_root_folder = true,
        side = 'left',
        mappings = {
            custom_only = false,
            list = {
              { key = { "<CR>" }, cb = tree_cb("edit") },
              { key = { "+" }, cb = tree_cb("cd") },
              { key = "v", cb = tree_cb("vsplit") },
              { key = "h", cb = tree_cb("split") },
              { key = "t", cb = tree_cb("tabnew") },
              { key = "<", cb = tree_cb("prev_sibling") },
              { key = ">", cb = tree_cb("next_sibling") },
              { key = "P", cb = tree_cb("parent_node") },
              { key = "<BS>", cb = tree_cb("close_node") },
              { key = "<S-CR>", cb = tree_cb("close_node") },
              { key = "<Tab>", cb = tree_cb("preview") },
              { key = "K", cb = tree_cb("first_sibling") },
              { key = "J", cb = tree_cb("last_sibling") },
              { key = "I", cb = tree_cb("toggle_ignored") },
              { key = "H", cb = tree_cb("toggle_dotfiles") },
              { key = "R", cb = tree_cb("refresh") },
              { key = "a", cb = tree_cb("create") },
              { key = "d", cb = tree_cb("remove") },
              { key = "r", cb = tree_cb("rename") },
              { key = "<C-r>", cb = tree_cb("full_rename") },
              { key = "x", cb = tree_cb("cut") },
              { key = "c", cb = tree_cb("copy") },
              { key = "p", cb = tree_cb("paste") },
              { key = "y", cb = tree_cb("copy_name") },
              { key = "Y", cb = tree_cb("copy_path") },
              { key = "gy", cb = tree_cb("copy_absolute_path") },
              { key = "<c", cb = tree_cb("prev_git_item") },
              { key = ">c", cb = tree_cb("next_git_item") },
              { key = "-", cb = tree_cb("dir_up") },
              { key = "q", cb = tree_cb("close") },
              { key = "?", cb = tree_cb("toggle_help") },
            },
        },
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },
    trash = {
        cmd = 'trash',
        require_confirm = true,
    },
    actions = {
        change_dir = {
            global = false,
        },
        open_file = {
            quit_on_open = false,
        },
    },
}
