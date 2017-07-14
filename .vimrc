"vim-plug packages
if has('nvim')
  call plug#begin('~/.vim/bundle')

  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'mileszs/ack.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'plasticboy/vim-markdown' "aparently needs: 'Plugin 'godlygeek/tabular'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'fatih/vim-go'
  Plug 'slim-template/vim-slim'

  call plug#end()
endif

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

if has('nvim')
  set termguicolors
endif

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
"Open on Control-N - note: <ESC> escapes mode
inoremap <silent><C-T> <ESC>:NERDTreeTabsToggle<CR>
nnoremap <silent><C-T> <ESC>:NERDTreeTabsToggle<CR>
vnoremap <silent><C-T> <ESC>:NERDTreeTabsToggle<CR>

"Plugin-specific settings
set runtimepath^=~/.vim/bundle/ctrlp.vim    "Ctrl-p
let g:ctrlp_working_path_mode = 0           "Ctrl-p
let g:vim_markdown_folding_disabled=1       "vim-markdown
let g:vim_markdown_new_list_item_indent = 2 "vim-markdown
let NERDTreeWinSize=30                      "NERDTree
let g:NERDTreeWinPos = "right"              "NERDTree

"Vim settings =========================================================

set nocompatible            "Turn off compatibility with vi (it's the 21st century)
set modelines=0             "Remove modelines for security reasons
set timeoutlen=3000         "Increase <leader> time

set tabstop=2               "Tab settings
set shiftwidth=2      
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=10
set autoindent
set showmode
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
nnoremap <leader>ft Vatzf
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"Colin instead of shift
nnoremap ; :

"Quickly exit insert mode
inoremap jj <ESC>

"Plugin specific mappings
map <Leader>n <plug>NERDTreeTabsToggle<CR>

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
