"Pathogen loader:
execute pathogen#infect()

"Allows plugins and indent files for syntax highlighting
filetype plugin on "indent - Removes annoying vim-markdown indent. Add back if having indent problems

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

"Plugin-specific settings
set runtimepath^=~/.vim/bundle/ctrlp.vim    "Ctrl-p
let g:ctrlp_working_path_mode = 0           "Ctrl-p
let g:vim_markdown_folding_disabled=1       "vim-markdown
let NERDTreeWinSize=30                      "NERDTree
let g:NERDTreeWinPos = "right"              "NERDTree

"Vim settings =========================================================

"Map leader key
let mapleader = " "

set pastetoggle=<leader>p   "Toggle the paste mode for insert
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

"Plugin specific mappings
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"Tab management
noremap tl :tabnext<CR>
noremap th :tabprev<CR>
noremap tn :tabnew<CR>
noremap td :tabclose<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Bubble text, used for moving a line of text up & down inside of vim
map <C-J> ddp
map <C-K> ddkP

nmap <silent> ,/ :nohlsearch<CR>

"noremap / /\v
"vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

"au FocusLost * :wa

nnoremap <leader>a :Ack
nnoremap <leader>ft Vatzf
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
inoremap jj <ESC>
command! Cs :normal iconsole.log()<ESC>
