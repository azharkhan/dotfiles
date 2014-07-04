set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Add Bundles here:
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/syntastic'
Bundle 'Townk/vim-autoclose'
Bundle 'plasticboy/vim-markdown'
Bundle 'tomtom/tcomment_vim'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'ervandew/supertab'
Bundle 'junegunn/vim-easy-align'
Bundle 'digitaltoad/vim-jade'
Bundle 'alfredodeza/pytest.vim'
Bundle 'davidhalter/jedi-vim'
"
" vim-scripts repos
"

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
filetype plugin indent on
execute pathogen#infect()
let &t_Co=256
syntax on
colorscheme Tomorrow-Night-Eighties
syntax enable
"set background=dark
"colorscheme solarized
set ls=2
set hlsearch
set ts=4
set incsearch
set ruler
set number
set ignorecase
set title
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set smartcase
set cursorline
set showcmd
set showmode
" NERDTree Toggle
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Syntastic Configuration
let g:syntastic_python_flake8_post_args='--ignore=E501'
let g:syntastic_javascript_checkers = ['jshint']

" NumberToggle Keymap
let g:NumberToggleTrigger="<C-m>"

" Filetype Specific Settings
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Moving Faster
map <C-j> 15j
map <C-k> 15k

" Mapping CtrlP
let g:ctrlp_map = '<c-t>'
