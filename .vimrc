"vim-plug auto-install:
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"source https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

"vim-plug packages
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'plasticboy/vim-markdown' "aparently needs: 'Plugin 'godlygeek/tabular'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'fatih/vim-go'
Plug 'slim-template/vim-slim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

"OS-specific settings =================================================

"Determine OS
let OS = substitute(system('uname'), "\n", "", "")

"Copy to clipboard settings
if OS == "Darwin"
  set clipboard=unnamed
endif

if OS == "Linux"
  "TODO Make this easier than CTRL+C
  vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
endif

"Coloring settings ====================================================

"Turn on colorscheme if rich colors
if &t_Co >= 256 || has("gui_running")
  colorscheme molokai
endif

"Turn syntax highlighting on if the terminal has colours
if &t_Co > 2 || has("gui_running")
  syntax on
endif

"Stop TMUX background from bleeding into VIM
if &term =~ '256color'
  set t_ut=
endif
"Source: http://sunaku.github.io/vim-256color-bce.html

"Plugin settings ======================================================

"NerdTree
"Open on Control-T - note: <ESC> escapes mode
inoremap <silent><C-T> <ESC>:NERDTreeTabsToggle<CR>
nnoremap <silent><C-T> <ESC>:NERDTreeTabsToggle<CR>
vnoremap <silent><C-T> <ESC>:NERDTreeTabsToggle<CR>
"Open on Leader-T - note: <ESC> escapes mode
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"FZF map over ctrl-p
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

"Lightline
"let g:lightline = {
      "\ 'colorscheme': 'powerline',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      "\ },
      "\ 'component_function': {
      "\   'gitbranch': 'fugitive#head()'
      "\ },
      "\ }

"Plugin-specific settings
let g:vim_markdown_folding_disabled=1       "vim-markdown
let g:vim_markdown_new_list_item_indent = 2 "vim-markdown
let NERDTreeWinSize=50                      "NERDTree
let g:NERDTreeWinPos = "right"              "NERDTree

"Vim settings =========================================================

set nocompatible            "Turn off compatibility with vi (it's the 21st century)
set modelines=0             "Remove modelines for security reasons
set timeoutlen=1000         "Increase <leader> time

set tabstop=2               "Tab settings
set shiftwidth=2      
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=10
set autoindent
set noshowmode              "Shows the current vim mode. Off due to lightline
set showcmd
set hidden                  "Hides buffers instead of closing them
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast                 "Redraws terminal faster
set ruler                   "Displayes line/percentage on bottom-right
set backspace=indent,eol,start
set laststatus=2            "Always display status bar
set number                  "Show line number
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
"set nobackup
"set noswapfile
set lcs=trail:~,extends:>,precedes:<
if version >= 703
  set undofile
endif

"Key Mappings =========================================================

"Map leader key
let mapleader = "\<Space>"

"Map Leader Mappings
nnoremap <leader>a :Ack 

"Colin instead of shift
nnoremap ; :

"Quickly exit insert mode
inoremap jj <ESC>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Tab management
noremap tl :tabnext<CR>
noremap th :tabprev<CR>
noremap tn :tabnew<CR>
noremap td :tabclose<CR>

"Easy indent/outdent
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <

"Yank current file (not sure if work in linux)
nmap <C-f> :let @+ = expand("%")<cr>

"???
nmap <silent> ,/ :nohlsearch<CR>
command! Cs :normal iconsole.log()<ESC>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"Tell vim to syntax highlight Jenkinsfile as groovy
au BufNewFile,BufRead Jenkinsfile setf groovy
