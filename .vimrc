"    __  __                           _
"   / / / /___  _____________  _   __(_)___ ___
"  / /_/ / __ \/ ___/ ___/ _ \| | / / / __ `__ \
" / __  / /_/ / /  (__  )  __/| |/ / / / / / / /
"/_/ /_/\____/_/  /____/\___(_)___/_/_/ /_/ /_/
"
"

" making system VIM more useful {
set nocompatible
" }

" Vundle Setup

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles {
    " Let Vundle manage itself
        Plugin 'VundleVim/Vundle.vim'

    " General
        Plugin 'scrooloose/nerdtree'
        Plugin 'tpope/vim-surround'
        Plugin 'bling/vim-airline'
        Plugin 'justinmk/vim-sneak'
        Plugin 'Raimondi/delimitMate'
        Plugin 'ctrlpvim/ctrlp.vim'
        Plugin 'junegunn/fzf.vim'
        Plugin 'rking/ag.vim'
        Plugin 'myusuf3/numbers.vim'
        Plugin 'nathanaelkane/vim-indent-guides'
        Plugin 'SirVer/ultisnips'
        Plugin 'junegunn/vim-emoji'
        Plugin 'ervandew/supertab'

    " Programming
        Plugin 'tpope/vim-fugitive'
        Plugin 'scrooloose/syntastic'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'pangloss/vim-javascript'
        Plugin 'elzr/vim-json'
        Plugin 'ternjs/tern_for_vim'
        Plugin 'mattn/emmet-vim'
        Plugin 'groenewege/vim-less'
        Plugin 'mtscout6/syntastic-local-eslint.vim'
        Plugin 'mattn/gist-vim'
        Plugin 'leafgarland/typescript-vim'
        Plugin 'Quramy/vim-js-pretty-template'
        Plugin 'mhartington/vim-typings'
        Plugin 'ajh17/VimCompletesMe'

    " Colorschemes
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'w0ng/vim-hybrid'
        Plugin 'morhetz/gruvbox'
        Plugin 'yearofmoo/Vim-Darkmate'
        Plugin 'dracula/vim'
        Plugin 'connorholyday/vim-snazzy'
" }

call vundle#end()
filetype plugin indent on


" Local Directories {
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swaps
set undodir=~/.vim/tmp/undo
" }


" Formatting {

    set nowrap                      " Wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,gohp,javascriptython,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    " preceding line best in a plugin but here for now.

    " Workaround for making markdown work
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" }

" Vim UI {
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    set cursorline                  " Highlight current line
    set noerrorbells                " Disable error bells
    set ruler                       " Show the cursor position
    set visualbell                  " Use visual bell
    set noshowmode                  " Don't show the current mode (airline.vim takes care of us)
    set noswapfile                  " Don't set any swap files
" }

" Statusline {
    set laststatus=2
    let g:airline_theme='gruvbox'
    let g:airline_powerline_fonts=1
" }

" Key (re)Mappings {

    " The default leader is '\', but many people prefer ',' as it's in a standard
    " location. To override this behavior and set it back to '\' (or any other
    " character) add the following to your .vimrc.before.local file:
    "   let g:spf13_leader='\'
    if !exists('g:spf13_leader')
        let mapleader = ","
    else
        let mapleader=g:spf13_leader
    endif

    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    " If you prefer that functionality, add let g:spf13_no_easyWindows = 1
    " in your .vimrc.before.local file

    if !exists('g:spf13_no_easyWindows')
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    endif

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " ESC is antiquated! "
    inoremap jk <ESC>

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<CR>

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Shortcuts
    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " Code folding {
    set nofoldenable
    set foldlevelstart=10         " open most folds by default"
    set foldmethod=indent
    nnoremap <space> za
    " }

    " For when you forget to sudo.. Really Write the file.
    "cmap w!! w !sudo tee % >/dev/null
    noremap <leader>W :w !sudo tee %<CR>

    " Clear last search (,qs)
    map <silent> <leader>qs <Esc>:noh<CR>

    " Paste toggle
    set pastetoggle=<leader>p
    map <F12> :set invpaste paste?<CR>

    " Yank to clipboard toggle (,y)"
    vmap <leader>y "*y

    " Insert newline (,CR)
    map <leader><Enter> o<ESC>

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Easier vertical scrolling
    map <S-j> 15j
    map <S-k> 15k

    " Adjust increment command
    nnoremap <C-d> <C-a>
" }

" { Plugin Config

    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }

    " ctrlp {
        let g:ctrlp_working_path_mode = 'ra'
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
        \ }
    "}

    " indent_guides {
        if !exists('g:spf13_no_indent_guides_autocolor')
            let g:indent_guides_auto_colors = 1
        else
            " For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
            autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3
            autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
        endif
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 0
    " }

    " Syntastic {
        set statusline+=%warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_javascript_checkers = ['eslint']
        let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
        let g:syntastic_check_on_open = 0
        let g:syntastic_check_on_wq = 1
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_loc_list_height = 5
        let g:syntastic_error_symbol = '✗✗'
        let g:syntastic_style_error_symbol = '✠✠'
        let g:syntastic_warning_symbol = '∆∆'
        let g:syntastic_style_warning_symbol = '≈≈'
        let g:syntastic_mode_map = { "passive_filetypes": [ "less" ] }
    " }

    " Tern {
        let g:tern_map_keys = 1
        let g:tern_show_argument_hints = 'on_hold'
        let g:tern_map_prefix = '<leader>'
    " }

    " Git Gutter {
        "let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
        "let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
        "let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
        "let g:gitgutter_sign_modified_removed = emoji#for('collision')
    " }

    " Silver Searcher {
        if executable('ag')
            " Note we extract the column as well as the file and line number
            set grepprg=ag\ --nogroup\ --nocolor\ --column
            set grepformat=%f:%l:%c%m

            " Use ag in CtrlP for listing files. Lightning fast and respects
            " .gitignore
            unlet g:ctrlp_user_command
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

            " No need to cache since ag is fast
            let g:ctrlp_use_caching = 0

            "command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
        endif

        " bind \ to grep shortcut
        nnoremap \ :Ag<SPACE>

        " start ag in root directory always
        let g:ag_working_path_mode="r"

    " }

" }

" { Function

    " Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " To disable the stripping of whitespace, add the following to your
        " .vimrc.local file:
        "   let g:spf13_keep_trailing_whitespace = 1
        if !exists('g:spf13_keep_trailing_whitespace')
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endif
    endfunction
    " }

    " Buffer Magic {
    augroup buffer_control
        autocmd!

        " Prompt for buffer to select (,bs)
        nnoremap <leader>bs :CtrlPBuffer<CR>

        " Buffer navigation [,, gb gB ,ls]
        map <Leader>, <C-^>
        map <Leader>ls: :buffers<CR>
        map gb :bnext<CR>
        map gB :bprev<CR>
    augroup END
    " }

    " Shell command {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " }

    " YouCompleteMe {
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
        let g:ycm_server_use_vim_stdout = 0
        let g:ycm_server_keep_logfiles = 1
    " }"

    " UltiSnips {
        let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
    " }

    " making YCM and UltiSnips work together
        "let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
        "let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
        "let g:SuperTabDefaultCompletionType = '<C-n>'

        "let g:UltiSnipsExpandTrigger="<cr>"
        "let g:UltiSnipsJumpForwardTrigger="<c-j>"
        "let g:UltiSnipsJumpBackwardTrigger="<c-k>"
        let g:SuperTabDefaultCompletionType    = '<C-n>'
        let g:SuperTabCrMapping                = 0
        let g:UltiSnipsExpandTrigger           = '<tab>'
        let g:UltiSnipsJumpForwardTrigger      = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
        let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

    "}

" }

" Default Color Scheme
syntax enable
"let g:gruvbox_invert_selection=0
" let g:solarized_termcolors=256
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
set termguicolors
" set true colours
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" highlight Comment gui=italic
" highlight Comment cterm=italic
"highlight htmlArg gui=italic
"highlight htmlArg cterm=italic
"highlight Type gui=italic
"highlight Type cterm=italic

