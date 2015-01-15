" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
set nocompatible " Use local vim mode
filetype off " Turn off file type detection
call plug#begin('~/.vim/plugged') " Use vim-plug for plugin management
  Plug 'Chiel92/vim-autoformat', { 'for': ['jade', 'json', 'html', 'javascript', 'go'] } " Code formatting
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " File browser
  Plug 'nathanaelkane/vim-indent-guides' " Show indents
  Plug 'tpope/vim-endwise' " End certain structures automatically
  Plug 'tpope/vim-jdaddy', { 'for': 'json' } " JSON formatting
  Plug 'kien/ctrlp.vim' " File and buffers navigation
  Plug 'Raimondi/delimitMate', { 'for': ['json', 'coffee', 'ruby', 'javascript', 'go', 'haskell'] } " Closing of quotes, parenthesis, brackets
  Plug 'tpope/vim-commentary' " Easy comments
  Plug 'scrooloose/syntastic', { 'for': ['ruby', 'coffee', 'javascript', 'go', 'haskell'] } " Syntax checker
  Plug 'bling/vim-airline' " Custom status line
  Plug 'kien/rainbow_parentheses.vim' " Colorize parentheses
  Plug 'Shougo/neocomplete', { 'for': ['ruby', 'coffee', 'go', 'javascript', 'haskell'] }  " Auto-completion
  Plug 'elzr/vim-json', { 'for': 'json' } " JSON syntax and formatting
  Plug 'tpope/vim-fugitive' " Git
  Plug 'ludovicchabant/vim-lawrencium' " Mercurial
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' } " Coffee-script syntax
  Plug 'tpope/vim-rails', { 'for': 'ruby' } " Ruby on Rails syntax, navigation
  Plug 'altercation/vim-colors-solarized' " Color scheme
  Plug 'mattn/emmet-vim', { 'for': 'html' } " HTML snippets
  Plug 'mileszs/ack.vim' " File search
  Plug 'digitaltoad/vim-jade', { 'for': 'jade' } " Jade syntax
  Plug 'mhinz/vim-startify' " Start screen
  Plug 'Keithbsmiley/investigate.vim' " Documentation
  Plug 'Shougo/neosnippet', { 'for': ['coffee', 'ruby', 'go', 'javascript', 'haskell'] } " Vim snippets support
  Plug 'Shougo/neosnippet-snippets', { 'for':  ['coffee', 'ruby', 'go', 'javascript', 'haskell'] } " Vim-neocomplete snippets
  Plug 'moll/vim-node', { 'for': ['coffee', 'javascript'] } " Node.js support
  Plug 'fatih/vim-go', { 'for': ['go'] } " Go support
  Plug 'peterhoeg/vim-qml', { 'for': ['qml'] } " QML support
  Plug 'Lokaltog/vim-easymotion' " Easy motion for vim
call plug#end() " End of vim-plug list


" -----------------------------------------------------------------------------
" Set default params
" -----------------------------------------------------------------------------
set tabstop=2 shiftwidth=2 expandtab " Default tab params
set laststatus=2 " Display status line status
set number " Show line number
colorscheme solarized " Set default color scheme
set colorcolumn=80 " Highlight 80 column to view max length of line
set autoindent
set nowrap
set cursorline
set mousehide
set showmatch
set antialias
set t_Co=256
set ttyfast
set noswapfile
set expandtab
set relativenumber " Show relative line number
set smartcase
set gdefault
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/build/*,*/eggs/*,*.pyc,*bower_components*
set wrap
set encoding=utf-8 " Set default encoding to UTF-8

syntax enable " Enable syntax highlighting by default


" -----------------------------------------------------------------------------
" Set custom parameters
" -----------------------------------------------------------------------------
let g:ctrlp_show_hidden = 1 " Show hidden files in CtrlP
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:acp_enableAtStartup = 0 " Disable AutoComplPop
let g:neocomplete#enable_at_startup = 1 " Use neocomplete
let g:neocomplete#enable_smart_case = 1 " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*' " Lock buffer

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

let g:airline_powerline_fonts = 1 " Use powerline font with vim-airline
let mapleader = ","
let g:airline_theme = 'solarized' " Set solarized vim-airline color scheme
let s:width = 80
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
let g:LargeFile=10
let g:indent_guides_enable_on_vim_startup = 1
let g:startify_bookmarks = ['~/Projects/control_panel/app.coffee', '~/Projects/flycats/app/app.coffee', '~/Projects/good_deeds/app/controllers/application_controller.rb', '~/dotfiles']

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets'

" Syntastic symbols and checkers
let g:syntastic_auto_jump           = 1
let g:syntastic_error_symbol        = '✖'
let g:syntastic_warning_symbol      = '►'
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_html_checkers       = ['jshint']
let g:syntastic_css_checkers        = ['csslint']
let g:syntastic_ruby_checkers       = ['mri', 'rubocop']
let g:syntastic_coffee_checkers     = ['coffeelint']

" Rainbow Parentheses settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Fix indent guides colors
au Syntax * let indent_guides_auto_colors = 0
au Syntax * autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=black
au Syntax * autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=10
" -----------------------------------------------------------------------------
" File types settings
" -----------------------------------------------------------------------------
autocmd FileType html,css EmmetInstall
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic comment insertion
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd FileType ruby set commentstring=#\ %s
autocmd FileType python set commentstring=#\ %s
autocmd FileType coffee set commentstring=#\ %s
autocmd FileType javascript set commentstring=//\ %s
autocmd FileType jade set commentstring=//\ %s
autocmd FileType html set commentstring=<!--\ %s\ -->

autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType jade :setlocal sw=2 ts=2 sts=2


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


" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------
imap jj <ESC>
nnoremap <F11> :call ToggleFullScreen()<CR>
inoremap <F11> :call ToggleFullScreen()<CR>
noremap <F3> :Autoformat<CR><CR>

" Vim neocomplete key-mappings
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Set Iterm2 cursors
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
