local servers = {
  'bashls',
  'dockerls',
  'gopls',
  'helm_ls',
  'groovyls',
  'jdtls',
  'jsonls',
  'lua_ls',
  'pyright',
  'rust_analyzer',
  'sqlls',
  'taplo',
  'terraformls',
  'tflint',
  'tsserver',
  'yamlls',
}

for _, server in ipairs(servers) do
  require('lsp.servers.' .. server)
end

-- Load diagnostic settings
require 'lsp.diagnostics'
