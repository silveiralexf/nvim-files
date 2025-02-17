return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
  },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
      },
      extensions = {
        'neo-tree',
        'nvim-dap-ui',
        'quickfix',
      },
      globalstatus = true,
    }
  end,
}
