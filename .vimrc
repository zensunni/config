"Pathogen loader:
execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set modelines=0

if &t_Co >= 256 || has("gui_running")
    colorscheme molokai
endif

if &t_Co > 2 || has("gui_running")
    "switch syntax highlighting on, when the terminal has colours
    syntax on
endif

"Copy-paste
"set cb=unnamed


"autopen NERDTree and focus cursor in new document <- not loading because of ease of use
"autocmd VimEnter * NERDTree  
"autocmd VimEnter * NERDTreeMirrorToggle
"autocmd VimEnter * NERDTreeTabsToggle
"autocmd VimEnter * wincmd p

" NerdTree on Control-N
inoremap <silent><C-N> <ESC>:NERDTreeTabsToggle<CR>
nnoremap <silent><C-N> :NERDTreeTabsToggle<CR>
vnoremap <silent><C-N> :NERDTreeTabsToggle<CR>

noremap tl :tabnext<CR>
noremap th :tabprev<CR>
noremap tn :tabnew<CR>
noremap td :tabclose<CR>

"Show hidden files in NerdTree  
"let NERDTreeShowHidden=1

"Window Size, position, etc
let NERDTreeWinSize=30
let g:NERDTreeWinPos = "right"

"Pasting (doesn't work) for some reason
set pastetoggle=<C-p>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Colors
let g:molokai_original = 1

set tabstop=2
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
set nobackup
set noswapfile

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
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

"au FocusLost * :wa

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>a :Ack

nnoremap <leader>ft Vatzf

nnoremap <leader>v V`]

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

inoremap jj <ESC>

