" Yago Riveiro's vim configuration

"  Overarching Philosophy:
" 1. Prefer the defaults
" 2. Extend functionality where needed
" 3. Change functionality only when it doesn't make sense

let $NVIM_HOME="~/.config/nvim"
let $NVIM_PLUGGED= join([$NVIM_HOME, "plugged"], "/")
let $NVIM_CONFIG= join([$NVIM_HOME, "config.d"], "/")

" Plug install packages¬
"
call plug#begin($NVIM_PLUGGED)

" Sanitizers Linters Formaters and Code Style
"
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'windwp/nvim-autopairs'
Plug 'embear/vim-localvimrc'

" Navigation
"
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons' | Plug 'kyazdani42/nvim-tree.lua'

" UI
"
Plug 'glepnir/galaxyline.nvim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'voldikss/vim-floaterm'
Plug 'connorholyday/vim-snazzy'
Plug 'sindrets/diffview.nvim'

" Git
"
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog' " A lightweight and powerful git branch viewer for vim
Plug 'airblade/vim-gitgutter'


" Search
"
Plug 'jremmen/vim-ripgrep'

" Folding
"
Plug 'pierreglaser/folding-nvim'

" Others
"
Plug 'scrooloose/nerdcommenter'
Plug 'wakatime/vim-wakatime'
Plug 'rickhowe/diffchar.vim'
Plug 'folke/which-key.nvim', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'TaDaa/vimade'
Plug 'romainl/vim-qf' " Tame the quickfix window
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}

" Markdown
"
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}

"" Golang
"
Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries' }
Plug 'sebdah/vim-delve', { 'for': 'go' }

" Python
"
Plug 'petobens/poet-v'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' , 'for': 'python' }

" CSS
"
Plug 'ap/vim-css-color', {'for': 'css' }

" TOML
"
Plug 'cespare/vim-toml'

" Terraform
"
Plug 'hashivim/vim-terraform'

" Helm
"
Plug 'towolf/vim-helm'

" LSP server
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'onsails/lspkind-nvim'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

lua require("")

" Load custom configurations for plugins
"
for config in split(globpath($NVIM_CONFIG, '*.vim'), '\n')
    exe 'source' config
endfor

" vim:set ft=vim et sw=2:
