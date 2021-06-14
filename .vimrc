" Environment {{{
if has("win32") || has("win64") || has("win32unix")
    let g:OS#name = "win"
    let g:OS#win = 1
    let g:OS#mac = 0
    let g:OS#unix = 0
elseif has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        let g:OS#name = "mac"
        let g:OS#win = 0
        let g:OS#mac = 1
        let g:OS#unix = 0
    else
        let g:OS#name = "unix"
        let g:OS#win = 0
        let g:OS#mac = 0
        let g:OS#unix = 1
    endif
endif
if has("gui_running")
    let g:OS#gui = 1
else
    let g:OS#gui = 0
endif
" }}}
" Path {{{
if has("win32")
  set rtp+=$HOME/.vim/bundle/Vundle.vim/
  set rtp+=$HOME/.vim/

  let $DP = 'D:/Dropbox'
  call vundle#rc('$HOME/.vim/bundle/Vundle.vim')
elseif has("unix")
  set rtp+=~/.vim/bundle/Vundle.vim/
  set rtp+=$HOME/.vim/
  let $DP = '~/Dropbox'
  call vundle#rc()
endif
let $PANDOCT = $HOME.'/.vim/pandoc/vim-pandoc-templates'
autocmd! bufwritepost .vimrc source $HOME/.vimrc
map <silent> <leader>ss :source $HOME/.vimrc<cr>
map <silent> <leader>ee :e $HOME/.vimrc<cr>
map <silent> <leader>ll :e $DP/Dat/bc/ledger/wogong.beancount<cr>
map <silent> <leader>jj :e $DP/Dat/jrnl/journal.md<cr>
"}}}
"Vundle {{{
set nocompatible
filetype off

Plugin 'VundleVim/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'tmux-plugins/vim-tmux-focus-events'

Plugin 'nathangrigg/vim-beancount'

Plugin 'godlygeek/tabular'
Plugin 'easymotion/vim-easymotion'
Plugin 'plasticboy/vim-markdown'

"depends on vim-addon-mw-utils and tlib.
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'Shougo/deoplete.nvim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'bling/vim-airline'

Plugin 'vim-scripts/zoom.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-vinegar' "enhances netrw
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
"Plugin 'ycm-core/YouCompleteMe'
"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'dense-analysis/ale'
call vundle#end()
" }}}
" Encoding {{{
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set langmenu=zh_CN.UTF-8
set langmenu=en_US.UTF-8
set helplang=en
"set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936
"language messages zh_CN.utf-8
language messages en_US.utf-8
"}}}
" Font {{{
if g:OS#name=="win"
    set guifont=Consolas:h14
    set guifontwide="Hiragino Sans GB"
else
    set gfn=Monaco:h15
endif
"}}}
" Colors {{{
if has("win32")
  set background=dark
  colorscheme murphy
elseif has("unix")
  "set background=light
  set background=dark
  "colorscheme solarized
  "colorscheme juicy
  colorscheme murphy
endif
"}}}
" Misc {{{
syntax enable
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]

set modelines=1

set ruler
set cmdheight=2
set shortmess=atI
set fillchars=vert:\ ,stl:\ ,stlnc:\
set matchtime=5
set scrolloff=3
set list " 显示tab和空格
set lcs=tab:\|\ ,nbsp:%,trail:- " 设置tab和空格样式
highlight LeaderTab guifg=#666666 " 设定行首tab为灰色
match LeaderTab /^\t/ " 匹配行首tab

set go+=a" select to system paste board

set noeb
set history=10000
set gdefault
set viminfo+=!
set iskeyword+=_,$,@,%,#
set linespace=0
set backspace=2
set whichwrap+=<,>,h,l
set selection=exclusive
"set selectmode=mouse,key
set report=0

" Set to auto read when a file is changed from the outside
set autoread
set mouse=a " Have the mouse enabled all the time:

"set magic
set confirm
set noswapfile
set ai "autoindent
set cindent shiftwidth=4
set si "smartindent
set wrap
set lbr
set tw=0

set ignorecase
set nowrapscan

set undofile
set undodir=$HOME/.vim/undodir
set undolevels=1000

set tags=tags;
set autochdir
set nospell
"set spell spelllang=en_us

"}}}
" Spaces & Table {{{
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces"
set smarttab
"}}}
" UI {{{
set number
set showcmd " show command in bottom bar"
set cursorline " highlight current line"

filetype plugin on
filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch " highlight matching [{()}]
"}}}
" Search {{{
set hlsearch " highlight matches
set incsearch " search as characters are entered
"}}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
"}}}
" Plugins {{{
"
""""""""""""""""""""
"" ALE
""""""""""""""""""""
"let g:ale_pattern_options = {
"\   '.*archive.beancount$': {'ale_enabled': 0},
"\   '.*bw.beancount$': {'ale_enabled': 0},
"\}
""""""""""""""""""""
"" vimwiki
""""""""""""""""""""
let g:vimwiki_list = [{'path': '$WIKI', 'auto_toc': 1,
                       \ 'syntax': 'markdown', 'ext': '.md'}]
""""""""""""""""""""
"" Bufexplorer
""""""""""""""""""""
let g:bufExplorerDefaultHelp=0  " Do not show default help.
let g:bufExplorerShowRelativePath=1 " Show relative paths.
let g:bufExplorerSortBy='mru'     " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30 " Split width
let g:bufExplorerUseCurrentWindow=1 " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber


""""""""""""""""""""
"" vim-latex
""""""""""""""""""""
let g:tex_flavor='latex'
set shellslash


""""""""""""""""""""
"" Powerline
""""""""""""""""""""
set laststatus=2   " Always show the statusline
"let g:Powerline_symbols = 'unicode'
"let g:Powerline_colorscheme = 'skwp'
"let g:Powerline_symbols = 'fancy'


""""""""""""""""""""
"" vim-airline
""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1


""""""""""""""""""""
"" vim-beancount
""""""""""""""""""""
let b:beancount_root=$DP.'/Dat/bc/ledger/wogong.beancount'
nnoremap <buffer> <LocalLeader>c :GetContext<CR>

""""""""""""""""""""
"" multi-cursor
""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
"let g:multi_cursor_start_key='<F6>'

""""""""""""""""""""
"" vim-pandoc
""""""""""""""""""""
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#command#templates_file = $PANDOCT
""""""""""""""""""""
"" indentLine
""""""""""""""""""""
"vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
"" vimgrep
map <leader>l :copen<CR>
map <leader>n :cn<CR>
map <leader>p :cp<CR>
"}}}
" Tmux {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" Autogroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd FileType markdown,vimwiki setlocal nospell
augroup END
" }}}
" Custom Function{{{
" }}}
" Python {{{
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99
" }}}
" YCM {{{
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

" stop ask
let g:ycm_confirm_extra_conf = 0

" }}}
" Template {{{
" }}}
" vim:foldmethod=marker:foldlevel=0
