return {
  'williamboman/mason.nvim',
  dependencies = {
    {
      'williamboman/mason-lspconfig.nvim',
    },
    {
      'neovim/nvim-lspconfig',
    },
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup {
      automatic_installation = true,
      ensure_installed = {
        'bashls',
        'dockerls',
        'dockerls',
        'gopls',
        'grammarly',
        'helm_ls',
        'jdtls',
        'jsonls',
        'lua_ls',
        'rust_analyzer',
        'sqls',
        'taplo',
        'terraformls',
        'tflint',
        'yamlls',
      },
    }
  end,
}
