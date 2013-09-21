set nocompatible               " be iMproved
filetype off                   " required!
set tabstop=2 shiftwidth=2 expandtab
set number
set autoindent
set nowrap
set cursorline
set mousehide
set showmatch
set antialias
let g:Powerline_symbols = 'fancy'

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

  Bundle 'gmarik/vundle'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-rails'
  Bundle 'tpope/vim-endwise'
  Bundle 'kien/ctrlp.vim'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'Auto-Pairs'
  Bundle 'scrooloose/syntastic'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'mattn/zencoding-vim'
  Bundle 'scrooloose/nerdtree'
  Bundle 'ZoomWin'
  Bundle 'bling/vim-airline'
  Bundle 'majutsushi/tagbar'
  Bundle 'mintplant/vim-literate-coffeescript'
  Bundle 'mileszs/ack.vim'
  Bundle 'kien/rainbow_parentheses.vim'
  Bundle 'skammer/vim-css-color'
  Bundle 'Valloric/YouCompleteMe' 
  Bundle 'slim-template/vim-slim' 
  Bundle 'digitaltoad/vim-jade'
  Bundle 'wavded/vim-stylus'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'elzr/vim-json'

set ttyfast
set noswapfile
let NERDTreeShowHidden=1

set mousehide

" Key mappings
nmap <F8> :TagbarToggle<CR>
imap jj <ESC>

set expandtab
set relativenumber

set smartcase
set gdefault

set wrap

nnoremap &lt;up> &lt;nop>
nnoremap &lt;down> &lt;nop>
nnoremap &lt;left> &lt;nop>
nnoremap &lt;right> &lt;nop>
inoremap &lt;up> &lt;nop>
inoremap &lt;down> &lt;nop>
inoremap &lt;left> &lt;nop>
inoremap &lt;right> &lt;nop>
nnoremap j gj
nnoremap k gk

let mapleader = ","
syntax enable

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.js
let g:ctrlp_dont_split = 'nerdtree'
