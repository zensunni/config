"Pathogen loader:
execute pathogen#infect()

"Allows plugins and indent files for syntax highlighting
filetype plugin indent on

"Determine OS
let OS = substitute(system('uname'), "\n", "", "")

"Turn on colorscheme if rich colors
if &t_Co >= 256 || has("gui_running")
  colorscheme molokai
endif

"Turn syntax highlighting on if the terminal has colours
if &t_Co > 2 || has("gui_running")
  syntax on
endif

"Copy to clipboard settings
if OS == "Darwin"
  set clipboard=unnamed
endif

if OS == "Linux"
  vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
endif

"NerdTree settings

"Open on Control-N - note: <ESC> escapes mode
inoremap <silent><C-N> <ESC>:NERDTreeTabsToggle<CR>
nnoremap <silent><C-N> <ESC>:NERDTreeTabsToggle<CR>
vnoremap <silent><C-N> <ESC>:NERDTreeTabsToggle<CR>
"Window Size, position, etc
let NERDTreeWinSize=30
let g:NERDTreeWinPos = "right"

"Mappings

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

"Autocomplete TODO
"inoremap <tab><tab> <c-n>


"Plugin-specific settings
set runtimepath^=~/.vim/bundle/ctrlp.vim    "Ctrl-p
"let g:vim_markdown_folding_disabled=1       "vim-markdown setting




"General settings
set nocompatible      "Turn off compatibility with vi (it's the 21st century)
set modelines=0       "Remove modelines for security reasons
set timeoutlen=3000   "Increase <leader> time
set pastetoggle=<F2>  "Pasting with indents TODO: Find better solution
set tabstop=2         "Tabs are two spaces
set shiftwidth=2      
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set relativenumber
set number
if version >= 703
  set undofile
endif
"set nobackup
"set noswapfile

let mapleader = ","
nmap <silent> ,/ :nohlsearch<CR>

"noremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

set lcs=trail:~,extends:>,precedes:<

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
nnoremap @ @:


"au FocusLost * :wa

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>a :Ack

nnoremap <leader>ft Vatzf

nnoremap <leader>v V`]

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

inoremap jj <ESC>

command! Cs :normal iconsole.log()<ESC>

"Bubble text, used for moving a line of text up & down inside of vim"
map <C-J> ddp
map <C-K> ddkP

"Stop TMUX background from bleeding into VIM
if &term =~ '256color'
  set t_ut=
endif
"Source: http://sunaku.github.io/vim-256color-bce.html
