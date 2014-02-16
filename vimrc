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
  
  Bundle 'nathanaelkane/vim-indent-guides'
  Bundle 'gmarik/vundle'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-endwise'
  Bundle 'kien/ctrlp.vim'
  Bundle 'Raimondi/delimitMate'
  Bundle 'tpope/vim-commentary'
  Bundle 'scrooloose/syntastic'
  Bundle 'mattn/zencoding-vim'
  Bundle 'ZoomWin'
  Bundle 'bling/vim-airline'
  Bundle 'majutsushi/tagbar'
  Bundle 'kien/rainbow_parentheses.vim'
  Bundle 'skammer/vim-css-color'
  Bundle 'Valloric/YouCompleteMe' 
  Bundle 'elzr/vim-json'
  Bundle 'nathanaelkane/vim-indent-guides'
  Bundle 'jelera/vim-javascript-syntax'
  Bundle 'pangloss/vim-javascript'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'tpope/vim-haml'
  Bundle 'slim-template/vim-slim' 
  Bundle 'tpope/vim-rails'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'mattn/emmet-vim'
  Bundle 'mileszs/ack.vim'

set t_Co=256
set ttyfast
set noswapfile
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
let g:airline_theme = 'solarized'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*

function ToggleFullScreen()
    if &go =~ 'e'
        exec('silent !wmctrl -r :ACTIVE: -b add,fullscreen')
        exec('set go-=e')
    else
        exec('silent !wmctrl -r :ACTIVE: -b remove,fullscreen')
        exec('set go+=e')
    endif 
endfunction

nnoremap <F11> :call ToggleFullScreen()<CR>
inoremap <F11> :call ToggleFullScreen()<CR>

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

" set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

" the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

" after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

" right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

return s
endfunction

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let label = fnamemodify(bufname(buflist[winnr - 1]), ':t')

if label == ''
        if &buftype == 'quickfix'
          let label = '[Quickfix List]'
        else
          let label = 'NoName'
        endif
    endif

if getbufvar(buflist[winnr - 1], "&modified")
        let label = "+".label
    endif

let label = a:n.":".label

return label
endfunction

set tabline=%!MyTabLine()

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

autocmd FileType ruby set commentstring=#\ %s
autocmd FileType coffee set commentstring=#\ %s
autocmd FileType javascript set commentstring=//\ %s
autocmd FileType html set commentstring=<!--\ %s\ -->
