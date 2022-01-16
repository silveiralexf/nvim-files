local servers = require'nvim-lsp-installer.servers'

local ok, server = servers.get_server('yamlls')
if ok then
  server:on_ready(function ()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local opts = {
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = require('schemastore').json.schemas {
            select = {
              'docker-compose.yml',
            },
          },
        },
      }
    }
    server:setup(opts)
  end)
  if not server:is_installed() then
      -- Queue the server to be installed
      server:install()
  end
end
