set t_Co=256

nnoremap <silent> gn "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>

set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

set ignorecase smartcase

set nocp " non vi compatible mode
filetype plugin on " enable plugins
set tags+=./tags


set modelines=0         " no modelines [http://www.guninski.com/vim1.html]
let c_no_curly_error = 1
set tabline=3

set nocompatible                " vim defaults, not vi!
syntax on                       " syntax on
set hidden                      " allow editing multiple unsaved buffers
set more                        " the 'more' prompt
filetype on                     " automatic file type detection
set autoread                    " watch for file changes by other programs
set vb t_vb=
set visualbell t_vb=

set noautowrite                 " don't automatically write on :next, etc
let maplocalleader=','          " all my macros start with ,
set wildmenu                    " : menu has tab completion, etc
"set cursorline
set scrolloff=5                 " keep at least 5 lines above/below cursor
set sidescrolloff=5             " keep at least 5 columns left/right of cursor
set history=300                 " remember the last 300 commands
set showcmd
set number

set expandtab
set shiftwidth=2
set softtabstop=2

set cmdheight=1                 " make command line two lines high
set ruler                       " show the line number on bar
set lazyredraw                  " don't redraw when running macros

nmap s :set relativenumber<CR>
map <LocalLeader>w+ 100<C-w>+  " grow by 100
map <LocalLeader>w- 100<C-w>-  " shrink by 100
map <c-d> :shell<CR>
" ,p and shift-insert will paste the X buffer, even on the command line
nmap  s i<S-MiddleMouse><ESC>
imap <S-Insert> <S-MiddleMouse>
cmap <S-Insert> <S-MiddleMouse>
set pastetoggle=<F2>


" global editing settings

set autoindent smartindent cindent     " turn on auto/smart indenting
set expandtab                   " use spaces, not tabs
set smarttab                    " make <tab> and <backspace> smarter
set tabstop=2                  " tabstops of 2
set shiftwidth=2                " indents of 2
set backspace=eol,start,indent  " allow backspacing over indent, eol, & start
set undolevels=1000             " number of forgivable mistakes
set updatecount=100             " write swap file to disk every 100 chars
set complete=.,w,b,u,U,t,i,d    " do lots of scanning on tab completion

set hlsearch                   " enable search highlight globally
set incsearch                  " show matches as soon as possible
set showmatch                  " show matching brackets when typing

set diffopt=filler,iwhite       " ignore all whitespace and sync

if has('autocmd')
  filetype plugin indent on
  syntax on

  autocmd BufReadPost *
        \ if line("'\"") > 0|
        \       if line("'\"") <= line("$")|
        \               exe("norm '\"")|
        \       else|
        \               exe "norm $"|
        \       endif|
        \ endif

  au BufRead quickfix setlocal nobuflisted wrap number

  let git_diff_spawn_mode=2
endif


let s:snippets = {} | let s:multi_snips = {}

if !exists('snippets_dir')
  let snippets_dir = substitute(globpath(&rtp, 'snippets/'), "\n", ',', 'g')
endif

"" Title hack
set title
let &titleold=getcwd()

"" Linum
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber


"" Pathogen
execute pathogen#infect()
au BufRead,BufNewFile *.eliom setfiletype ocaml

"" Strip whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"" OCaml stuff

autocmd VimEnter * set vb t_vb=

let g:ocp_indent_vimfile = system("opam config var share")
let g:ocp_indent_vimfile = substitute(g:ocp_indent_vimfile, '[\r\n]*$', '', '')
let g:ocp_indent_vimfile = g:ocp_indent_vimfile . "/vim/syntax/ocp-indent.vim"

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"


au BufEnter *.ml setf ocaml
au BufEnter *.eliom setf ocaml
au BufEnter *.eliomi setf ocaml
au BufEnter *.mli setf ocaml
au BufEnter *.jinja2 setf html
let mapleader=","
set timeout timeoutlen=1500

colorscheme baskerville


if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'

let g:syntastic_ocaml_checkers=['merlin']

map <c-t> :TypeOf<CR>
vmap <c-t> :TypeOfSel<CR>

tnoremap <C-w><Left> <C-\><C-n><C-w><Left>
tnoremap <C-w><Right> <C-\><C-n><C-w><Right>
tnoremap <Esc> <C-\><C-n>

let g:python_host_prog='/usr/bin/python2.7'
"" let g:ycm_autoclose_preview_window_after_completion=1
"" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
