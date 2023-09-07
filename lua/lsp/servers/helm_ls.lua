local lsp = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lsp.helm_ls.setup {
  capabilities = capabilities,
  filetypes = { 'helm' },
  cmd = { 'helm_ls', 'serve' },
}


