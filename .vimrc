set nocompatible
filetype off

" === Vundle ===
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" File navigation
Plugin 'preservim/nerdtree'

" LSP & Completion
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" Languages
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'othree/html5.vim'

" Editing
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tlib_vim'

call vundle#end()
filetype plugin indent on
syntax on

" === General Settings ===
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
set clipboard+=unnamed
set hidden

" === Folding ===
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" === Key Mappings ===
map j gj
map k gk
:command W w
:command WQ wq
:command -bang Q quit<bang>
cabbrev E Explore

" === Autocmds ===
if has("autocmd")
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufEnter * let &titlestring = expand("%:t") . " :: vim"

  " .launch files as XML
  autocmd BufNewFile,BufRead *.launch set syntax=xml
endif

" === Filetype Settings ===
autocmd FileType solidity setlocal shiftwidth=4 softtabstop=4 expandtab

" === LSP Configuration ===

" Rust language server
if executable('rls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'rls',
      \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
      \ 'whitelist': ['rust'],
      \ })
endif

" TypeScript / JavaScript language server
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'typescript-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(),
      \     ['tsconfig.json', 'package.json', '.git/']
      \   ))},
      \ 'whitelist': ['typescript', 'typescriptreact', 'javascript', 'javascriptreact'],
      \ })
endif

" Solidity language server (https://github.com/mmsaki/solidity-language-server)
" Uses wrapper to filter non-LSP log output from stdout
if executable('solidity-language-server')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'solidity-language-server',
      \ 'cmd': {server_info->[expand('~/.vim/bin/solidity-language-server-wrapper')]},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   empty(lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['foundry.toml', '.git']))
      \   ? getcwd()
      \   : lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['foundry.toml', '.git']))},
      \ 'whitelist': ['solidity'],
      \ })
endif

" LSP keybindings (applied per-buffer when LSP attaches)
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [d <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d <plug>(lsp-next-diagnostic)
  nmap <buffer> <leader>a <plug>(lsp-code-action)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_echo_cursor = 1
