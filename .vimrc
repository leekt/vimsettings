execute pathogen#infect()
filetype indent on
filetype plugin on
syntax on

set nocompatible
set title
set ruler
set number
set esckeys
set hlsearch
set showmode
set showmatch
set expandtab
set tabstop=2
set scrolloff=2
set shiftwidth=2
set softtabstop=2
set encoding=UTF-8
set fileencodings=UTF-8
set backspace=eol,start,indent
" Use clipboard instead of vim buffer
set clipboard+=unnamed

map j gj
map k gk
:command W w
:command WQ wq
:command -bang Q quit<bang>
"map <Up> <NOP>
"map <Down> <NOP>
"map <Left> <NOP>
"map <Right> <NOP>
"imap <Up> <NOP>
"imap <Down> <NOP>
"imap <Left> <NOP>
"imap <Right> <NOP>

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

cabbrev E Explore

if has("autocmd") 
  " When editing a file, always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside an event handler 
  " (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 

  autocmd BufEnter * let &titlestring = expand("%:t") . " :: vim"

  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Set syntax color for .launch files
  autocmd BufNewFile,BufRead *.launch set syntax=xml

  " Coquille plugin for coq in vim
  :map J :CoqNext<Enter>
  :map K :CoqUndo<Enter>
  :map H :CoqToCursor<Enter>
  autocmd BufNewFile,BufRead *.v CoqLaunch
  autocmd BufNewFile,BufRead *.v let g:coq = bufnr("%")
  autocmd BufWinLeave        *.v wqa!
  autocmd BufNewFile,BufRead *.v vertical resize +30
endif
