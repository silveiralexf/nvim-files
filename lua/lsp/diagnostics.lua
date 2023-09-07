local d = vim.diagnostic
local sign_define = vim.fn.sign_define

d.config({
  severity_sort = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  virtual_lines = true,
  virtual_text = true, -- lsp_line will do this.
}, nil)

-- custom signs
sign_define('DiagnosticSignError', {
  text = '',
  texthl = 'DiagnosticError',
  numhl = '',
})

sign_define('DiagnosticSignWarn', {
  text = '⚑',
  texthl = 'DiagnosticSignWarn',
  numhl = '',
  linehl = '',
})

sign_define('DiagnosticSignInfo', {
  text = 'ℹ',
  texthl = 'DiagnosticSignInfo',
  numhl = '',
})

sign_define('DiagnosticSignHint', {
  text = '',
  texthl = 'DiagnosticHint',
  numhl = '',
})
