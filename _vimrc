set langmenu=zh_CN
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set fileencoding=chinese
else 
    set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
set imcmdline
"设定_vimrc即时生效
autocmd! bufwritepost _vimrc source %
colorscheme desertEX
set nocompatible
set number
filetype on
filetype plugin on
filetype indent on
syntax on
set autoindent
set smartindent
set expandtab
set et sw=4 ts=4 sts=4
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
set ruler
set incsearch
set nobackup
set hls
set wrap
set linebreak
set backspace=indent,eol,start
"set encoding=utf-8
"set fileencoding=utf-8
"set fileencodings=utf-8,gb18030,gbk,gb2312,cp936 

" set vim tabs
autocmd FileType html,python,vim,javascript setl shiftwidth=4
autocmd FileType html,python,vim,javascript setl tabstop=4
autocmd FileType java,php setl shiftwidth=4
autocmd FileType java,php setl tabstop=4

" set gui options
if has("gui_running")
" set guifont= YaHei Consolas Hybrid:h12
set guifont=Consolas:h11
endif

" beging php funtion auto completion setting
au FileType php call Php_func_autocomp()
function Php_func_autocomp()
    set dictionary+=$VIM\ExtraVim\php-funclist.txt
    set complete+=k
endfunction
"Auto completion using the TAB key
"This function determines, wether we are on
"the start of the line text(then tab indents)
"or if we want to try auto completion
function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
"end php funtion auto completion setting 

" markdown syntax settings
    augroup mkd
        autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
        autocmd BufNewFile,BufRead *.mkd set wrap nonumber
    augroup END
" set fuzzyfinder preview height
nnoremap <C-p> :FufFile <CR>
let g:fuf_previewHeight=0 
" bufexplorer setting
let g:bufExplorerDefaultHelp=0       " Do not show default help. 
let g:bufExplorerShowRelativePath=1  " Show relative paths. 
let g:bufExplorerSortBy='mru'        " Sort by most recently used. 
let g:bufExplorerSplitRight=0        " Split left. 
let g:bufExplorerSplitVertical=1     " Split vertically. 
let g:bufExplorerSplitVertSize = 30  " Split width 
let g:bufExplorerUseCurrentWindow=1  " Open in new window. 
autocmd BufWinEnter \[Buf\ List\] setl nonumber 
" NERDTree setting
map <F3> :NERDTreeToggle<CR>

