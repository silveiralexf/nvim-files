return {
  'nathom/filetype.nvim',
  lazy = false,
  config = true,
  opts = {
    overrides = {
      extensions = {
        sh = 'sh',
        xml = 'xml',
        sls = 'sls',
      },
      shebang = {
        -- Set the filetype of files with a dash shebang to sh
        dash = 'sh',
      },
    },
  },
}
