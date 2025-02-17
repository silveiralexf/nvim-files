---  - Felipe Silveira's vim configuration
---
--- fokerd from Yago Riveiro's (https://github.com/yriveiro/nvim-files)
--
-- Overarching Philosophy:
-- 1. Prefer the defaults
-- 2. Extend functionality where needed
-- 3. Change functionality only when it doesn't make sense

-- Leader key configuation
-- https://learnvimscriptthehardway.stevelosh.com/chapters/06.html
vim.g.mapleader = '\\'     -- Define leader key.
vim.g.localmapleader = ',' -- Define local leader.

-- Some plugins require termguicolor to be set before load.
vim.o.termguicolors = true -- Enable true colors
vim.o.laststatus = 3

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  ui = {
    icons = {
      cmd = '',
      config = ' ',
      event = ' ',
      ft = ' ',
      init = ' ',
      import = ' ',
      keys = ' ',
      lazy = ' ',
      loaded = '●',
      not_loaded = '○',
      plugin = ' ',
      runtime = ' ',
      source = ' ',
      start = ' ',
      task = '✔ ',
      list = {
        '●',
        '➜',
        '★',
        '‒',
      },
    },
  },
})

local sources = {
  'icons',    -- Load custom icons
  'settings', -- Vim settings
  'lsp',      -- LSP configuration
  'mappings', -- Vim mappings
  'autocmds', -- Magic from autocommands
  'commands', -- custom commands
}

for _, source in ipairs(sources) do
  local source_ok, err = pcall(require, source)
  if not source_ok then
    vim.api.nvim_err_writeln('Failed to load ' .. source .. '\n\n' .. err)
  end
end
