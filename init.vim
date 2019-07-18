let $NVIM_HOME="~/.config/nvim"
let $NVIM_PLUGGED= join([$NVIM_HOME, "plugged"], "/")
let $NVIM_CONFIG= join([$NVIM_HOME, "config.d"], "/")

"" Plug install packages¬
"
call plug#begin($NVIM_PLUGGED)

Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-startify'
Plug 'trevordmiller/nova-vim'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'scrooloose/nerdtree' | Plug 'xuyuanp/nerdtree-git-plugin'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'shougo/neosnippet.vim' | Plug 'shougo/neosnippet-snippets'
Plug 'wakatime/vim-wakatime'
Plug 'rickhowe/diffchar.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'pearofducks/ansible-vim'
Plug 'TaDaa/vimade'
Plug 'romainl/vim-qf' " Tame the quickfix window
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
Plug 'rbong/vim-flog' " A lightweight and powerful git branch viewer for vim

Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-clang', {'for': 'cpph'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'ruanyl/vim-fixmyjs', { 'for': 'javascript' }
Plug 'joonty/vdebug', { 'for': 'php' }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'jodosha/vim-godebug', { 'for': 'go' }
Plug 'sebdah/vim-delve', { 'for': 'go' }

call plug#end()

"" Load custom configurations for plugins
"
for config in split(globpath($NVIM_CONFIG, '*.vim'), '\n')
    exe 'source' config
endfor

" vim:set ft=vim et sw=2:
