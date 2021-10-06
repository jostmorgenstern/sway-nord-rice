set encoding=utf-8
set number 
syntax enable
set noswapfile
set scrolloff=7
set backspace=indent,eol,start
set hlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set ignorecase
set showmatch
set mouse=a


call plug#begin("~/.vim/plugged")

Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim' 
Plug 'ap/vim-css-color'

call plug#end()

if (has("termguicolors"))
set termguicolors
endif
syntax enable
colorscheme nord

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let NERDTreeStatusLine='NERDTree'
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-a> :NERDTreeToggle<CR>

