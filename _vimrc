set langmenu=zh_CN.GBK
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
autocmd! bufwritepost _vimrc source %
colorscheme desertEX
set nocompatible
set number
filetype on
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
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936 

"set vim tabs
autocmd FileType html,python,vim,javascript setl shiftwidth=4
autocmd FileType html,python,vim,javascript setl tabstop=4
autocmd FileType java,php setl shiftwidth=4
autocmd FileType java,php setl tabstop=4

"set gui options
if has("gui_running")
"set guifont= YaHei Consolas Hybrid:h12
set guifont=Consolas:h11
endif

"set php funtion auto completion
set dictionary+=$VIM/ExtraVim/php_funclist.txt
set complete+=k
function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction
"Remap the tab key to select action with InsertTabWrapper
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

" markdown syntax settings
    augroup mkd
        autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
        autocmd BufNewFile,BufRead *.mkd set wrap nonumber
    augroup END


