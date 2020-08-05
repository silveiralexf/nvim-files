"" Configurations
"

set mouse=a                       " enable mouse
set showcmd                       " Show (partial) command in status line.
set number                        " Line numbers
set relativenumber                " Line relative numbers
set termguicolors                 " Enable true colors
set synmaxcol=2048                " Set a limit for syntax highlights
set laststatus=2                  " Display the status line always
set linespace=0                   " Set line-spacing to minimum.
set showmode                      " Show current mode.
set cursorline                    " Highlight the screen line of the cursor.
set splitbelow
set splitright                    " Split configurations
set dir=/tmp/neovim
set wildmode=list:longest,list:full
set completeopt=menuone,longest
set autoread
set exrc                          " load per project configuration if exists.
set listchars=eol:¬
set viewoptions=cursor,folds,slash,unix
set secure                        " prevent run autocmd not owned by you.
set clipboard=unnamedplus

hi NonText ctermfg=7 guifg=gray

" Themes
"
colorscheme nova

if (exists('+colorcolumn'))
  set colorcolumn=80,120
  highlight ColorColumn ctermbg=7 guibg=red
endif

" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

autocmd BufWritePost,BufEnter * Neomake

" Make search result appear in the middle of the screen but not affect the
" Terminal buffer
au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=5

""" Experimental
au FocusGained,BufEnter * :checktime

" vim:set ft=vim et sw=2:
