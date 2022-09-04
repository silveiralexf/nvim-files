local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, 'packer')

if not ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
    prompt_border = 'single',
  },
  git = {
    clone_timeout = 600,
  },
  auto_clean = true,
  compile_on_sync = false,
}

return packer.startup(function(use)
  -- System
  use { 'wbthomason/packer.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'nathom/filetype.nvim' }

  -- UI
  use { 'rmehri01/onenord.nvim' }
  use { 'MunifTanjim/nui.nvim' }
  use { 'rcarriga/nvim-notify', config = require 'plugins.configs.notify' }
  use { 'kyazdani42/nvim-web-devicons', config = require 'plugins.configs.icons' }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require 'plugins.configs.alpha',
  }
  use { 'NTBBloodbath/galaxyline.nvim', config = require 'plugins.configs.galaxyline' }
  use {
    'sindrets/diffview.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = require 'plugins.configs.diffview'
  }
  use { 'yriveiro/termim.nvim' }
  use { 'norcalli/nvim-colorizer.lua', config = require 'plugins.configs.colorizer' }
  use { "ellisonleao/glow.nvim", branch = 'main' }

  -- Search and Navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require 'plugins.configs.telescope',
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-project.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'folke/which-key.nvim' }
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = require 'plugins.configs.neotree',
  }
  use { 'mg979/vim-visual-multi' }
  use { 'liuchengxu/vista.vim' }
  use {
    'folke/todo-comments.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require 'plugins.configs.todo',
  }

  -- Utilities
  use { 'windwp/nvim-autopairs', config = require 'plugins.configs.autopairs' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'McAuleyPenney/tidy.nvim' }
  use { 'amirali/yapf.nvim', config = require 'plugins.configs.autopairs' }
  use { 'mbbill/undotree' }
  use { 'wakatime/vim-wakatime' }
  use { 'terrortylor/nvim-comment', config = require 'plugins.configs.nvimcomment' }
  use { 'sychen52/smart-term-esc.nvim' }

  -- Debug
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      'yriveiro/dap-go.nvim',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = require 'plugins.configs.dap'
  }
  use {
    'nvim-telescope/telescope-dap.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap'
    },
  }

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require 'plugins.configs.treesitter',
  }

  use {
    'nvim-treesitter/playground',
    requires = { 'nvim-treesitter/nvim-treesitter' },
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require 'plugins.configs.gitsigns',
  }
  use { 'rbong/vim-flog' }
  use { 'tpope/vim-fugitive' }

  -- LSP
  use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = require 'plugins.configs.mason',
  }

  use { 'neovim/nvim-lspconfig' }
  use { 'aspeddro/lsp_menu.nvim' }

  use { 'j-hui/fidget.nvim', config = require 'plugins.configs.fidget' }
  use { 'b0o/SchemaStore.nvim' }

  -- Completion

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'dmitmel/cmp-cmdline-history',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'rafamadriz/friendly-snippets',
    },
    config = require 'plugins.configs.cmp',
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
