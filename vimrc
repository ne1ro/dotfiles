" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
set nocompatible " Use local vim mode
filetype off " Turn off file type detection
call plug#begin('~/.vim/plugged') " Use vim-plug for plugin management
  " Navigation
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " File browser
  Plug 'kien/ctrlp.vim' " File and buffers navigation
  Plug 'rking/ag.vim' " File searching
  Plug 'bling/vim-airline' " Custom status line
  Plug 'Lokaltog/vim-easymotion' " Easy motion for vim
  Plug 'gorkunov/smartgf.vim' " Quick method definition lookup

  " Completion
  Plug 'Shougo/neocomplete', { 'for': ['ruby', 'coffee', 'javascript', 'sass'] }  " Auto-completion
  Plug 'Shougo/neosnippet', { 'for': ['coffee', 'ruby', 'javascript', 'sass'] } " Vim snippets support
  Plug 'Shougo/neosnippet-snippets', { 'for':  ['coffee', 'ruby', 'javascript', 'sass'] } " Vim-neocomplete snippets

  " Code style
  Plug 'scrooloose/syntastic', { 'for': ['ruby', 'coffee', 'javascript'] } " Syntax checker
  Plug 'tpope/vim-endwise' " End certain structures automatically
  Plug 'Raimondi/delimitMate', { 'for': ['json', 'coffee', 'ruby', 'javascript'] } " Closing of quotes, parenthesis, brackets
  Plug 'bronson/vim-trailing-whitespace' " Highlight and remove trailing whitespaces
  Plug 'Chiel92/vim-autoformat', { 'for': ['json', 'html', 'javascript', 'eruby'] } " Code formatting
  Plug 'nathanaelkane/vim-indent-guides' " Show indents
  Plug 'tpope/vim-commentary' " Easy comments
  Plug 'kien/rainbow_parentheses.vim' " Colorize parentheses

  " Documentation
  Plug 'rizzatti/dash.vim'

  " Color scheme
  Plug 'altercation/vim-colors-solarized'

  " VCS integration
  Plug 'tpope/vim-fugitive' " Git
  Plug 'ludovicchabant/vim-lawrencium' " Mercurial

  " Tmux integration
  Plug 'benmills/vimux' " Tmux integration
  Plug 'jpalardy/vim-slime', { 'for': ['ruby', 'javascript', 'coffee'] } " Vim with REPL
  Plug 'christoomey/vim-tmux-navigator' " Move between Vim panes and tmux splits
  Plug 'edkolev/tmuxline.vim' " Airline integration with Tmux

  " Ruby
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' } " Navigation and syntax highlight
  Plug 'tpope/vim-rails', { 'for': 'ruby' } " Ruby on Rails syntax, navigation
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' } " Navigation and syntax highlight
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' } " Lightweight RSpec runner for Vim
  Plug 'osyo-manga/vim-monster', { 'for': 'ruby' } " Ruby completion

  " Javascript, Node.js
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " Improved JS support
  Plug 'jelera/vim-javascript-syntax', {'for': 'javascript' } " Imroved JS syntax support
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' } " Coffee-script syntax
  Plug 'moll/vim-node', { 'for': ['coffee', 'javascript'] } " Node.js support
  Plug 'elzr/vim-json', { 'for': 'json' } " JSON syntax and formatting

  " Frontend
  Plug 'mattn/emmet-vim', { 'for': 'html' } " HTML snippets
  Plug 'digitaltoad/vim-jade', { 'for': 'jade' } " Jade support
  Plug 'tpope/vim-haml', { 'for': ['sass', 'scss'] } " SASS / SCSS support
call plug#end() " End of vim-plug list


" -----------------------------------------------------------------------------
" Set custom params
" -----------------------------------------------------------------------------
set background=dark " Dark background
set t_Co=256 " Use 256 colors scheme
colorscheme solarized " Set default color scheme
set tabstop=2 shiftwidth=2 expandtab " Default tab params
set laststatus=2 " Display status line status
set number " Show line number
set colorcolumn=80 " Highlight 80 column to view max length of line
set autoindent
set nowrap
set cursorline
set mousehide
set mouse=nicr
set showmatch
set antialias
set ttyfast
set noswapfile
set expandtab
set relativenumber " Show relative line number
set smartcase
set gdefault
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/build/*,*/eggs/*,*.pyc,*bower_components*,*/_workspace/*,*/.sass-cache/*,*/coverage/*,*/vendor/*
set wrap
set encoding=utf-8 " Set default encoding to UTF-8
set cole=1
set foldmethod=indent " Fold by indents

syntax enable " Enable syntax highlighting by default


" -----------------------------------------------------------------------------
" Set custom parameters
" -----------------------------------------------------------------------------
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"} " Vim-slime default config
let g:ctrlp_show_hidden = 1 " Show hidden files in CtrlP
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:acp_enableAtStartup = 0 " Disable AutoComplPop
let g:javascript_conceal = 1 " Conceal javascript
let g:neocomplete#enable_at_startup = 1 " Use neocomplete
let g:neocomplete#enable_smart_case = 1 " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*' " Lock buffer
" Vim-monster ruby code completion
let g:neocomplete#sources#omni#input_patterns = {
  \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
  \}

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
let g:airline_theme = 'solarized' " Set vim-airline color scheme
let s:width = 80
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
let g:LargeFile=10
let g:indent_guides_enable_on_vim_startup = 1
let g:slime_target = "tmux" " Use vim-slime with tmux

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets'

" Syntastic symbols and checkers
let g:syntastic_auto_jump           = 1
let g:syntastic_error_symbol        = '✖'
let g:syntastic_warning_symbol      = '►'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers        = ['csslint']
let g:syntastic_ruby_checkers       = ['mri', 'rubocop']
let g:syntastic_coffee_checkers     = ['coffeelint']

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets'

" Rainbow Parentheses settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Fix indent guides colors
if !has("gui_running")
  au Syntax * let indent_guides_auto_colors = 0
  au Syntax * autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=black
  au Syntax * autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=10
end
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
autocmd FileType html set commentstring=<!--\ %s\ -->

autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1


" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------
imap jj <ESC>
noremap <F3> :Autoformat<CR><CR>

" Vim neocomplete key-mappings
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
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
