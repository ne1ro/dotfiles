" -----------------------------------------------------------------------------
" Vundle bundle
" -----------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()
  Bundle 'digitaltoad/vim-jade'
  Bundle 'dag/vim2hs'
  Bundle 'xolox/vim-session'
  Bundle 'xolox/vim-misc'
  Bundle 'nathanaelkane/vim-indent-guides'
  Bundle 'gmarik/vundle'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-endwise'
  Bundle 'kien/ctrlp.vim'
  Bundle 'Raimondi/delimitMate'
  Bundle 'tpope/vim-commentary'
  Bundle 'scrooloose/syntastic'
  Bundle 'bling/vim-airline'
  Bundle 'majutsushi/tagbar'
  Bundle 'kien/rainbow_parentheses.vim'
  Bundle 'Valloric/YouCompleteMe' 
  Bundle 'elzr/vim-json'
  Bundle 'jelera/vim-javascript-syntax'
  Bundle 'pangloss/vim-javascript'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'tpope/vim-haml'
  Bundle 'slim-template/vim-slim' 
  Bundle 'tpope/vim-rails'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'mattn/emmet-vim'
  Bundle 'mileszs/ack.vim'

" -----------------------------------------------------------------------------
" Set default params
" -----------------------------------------------------------------------------
set tabstop=2 shiftwidth=2 expandtab
set number
set autoindent
set nowrap
set cursorline
set mousehide
set showmatch
set antialias
set t_Co=256
set ttyfast
set noswapfile
set mousehide
set expandtab
set relativenumber
set smartcase
set gdefault
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/build/*
set wrap

" Enable syntax by default
syntax enable

" -----------------------------------------------------------------------------
" Set custom configuration
" -----------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let mapleader = ","
let g:airline_theme = 'solarized'
let g:haskell_conceal_wide = 1
let s:width = 80
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
let g:LargeFile=10

" Rainbow Parentheses settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" -----------------------------------------------------------------------------
" File types settings
" -----------------------------------------------------------------------------
autocmd FileType html,css EmmetInstall

autocmd FileType ruby set commentstring=#\ %s
autocmd FileType python set commentstring=#\ %s
autocmd FileType coffee set commentstring=#\ %s
autocmd FileType javascript set commentstring=//\ %s
autocmd FileType jade set commentstring=//\ %s
autocmd FileType html set commentstring=<!--\ %s\ -->

autocmd FileType html :setlocal sw=4 ts=4 sts=4
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType haskell :setlocal tabstop=8 softtabstop=4  shiftwidth=4  smarttab shiftround nojoinspaces

" -----------------------------------------------------------------------------
" Custom functions
" -----------------------------------------------------------------------------
function ToggleFullScreen()
    if &go =~ 'e'
        exec('silent !wmctrl -r :ACTIVE: -b add,fullscreen')
        exec('set go-=e')
    else
        exec('silent !wmctrl -r :ACTIVE: -b remove,fullscreen')
        exec('set go+=e')
    endif 
endfunction

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

function! HaskellModuleHeader(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Module: ")
    let note = 1 < a:0 ? a:2 : inputdialog("Note: ")
    let description = 2 < a:0 ? a:3 : inputdialog("Describe this module: ")
    
    return  repeat('-', s:width) . "\n" 
    \       . "-- | \n" 
    \       . "-- Module      : " . name . "\n"
    \       . "-- Note        : " . note . "\n"
    \       . "-- \n"
    \       . "-- " . description . "\n"
    \       . "-- \n"
    \       . repeat('-', s:width) . "\n"
    \       . "\n"

endfunction

function! HaskellModuleSection(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Section name: ")

    return  repeat('-', s:width) . "\n"
    \       . "--  " . name . "\n"
    \       . "\n"

endfunction

" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
imap jj <ESC>
nmap <silent> --h "=HaskellModuleHeader()<CR>:0put =<CR>
nmap <silent> --s "=HaskellModuleSection()<CR>gp
nnoremap <F11> :call ToggleFullScreen()<CR>
inoremap <F11> :call ToggleFullScreen()<CR>
