" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
set nocompatible " Use local vim mode
filetype off " Turn off file type detection
call plug#begin('~/.vim/plugged') " Use vim-plug for plugin management

" Navigation
Plug 'tpope/vim-vinegar' " File browsing
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy search
Plug 'rking/ag.vim' " File searching
Plug 'vim-airline/vim-airline' " Custom status line
Plug 'vim-airline/vim-airline-themes' " Vim-airline themes
Plug 'Lokaltog/vim-easymotion' " Easy motion for vim
Plug 'gorkunov/smartgf.vim' " Quick method definition lookup

" Code style
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-endwise' " End certain structures automatically
Plug 'Raimondi/delimitMate' " Closing of quotes, parenthesis, brackets
Plug 'bronson/vim-trailing-whitespace' " Highlight and remove trailing whitespaces
Plug 'nathanaelkane/vim-indent-guides' " Show indents
Plug 'tpope/vim-commentary' " Easy comments
Plug 'kien/rainbow_parentheses.vim' " Colorize parentheses
Plug 'Chiel92/vim-autoformat', { 'for': ['javascript', 'html', 'css', 'elixir', 'eelixir'] } " Autoformatter

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Documentation
Plug 'rizzatti/dash.vim'

" Color scheme
Plug 'iCyMind/NeoSolarized'

" VCS integration
Plug 'tpope/vim-fugitive' " Git
Plug 'airblade/vim-gitgutter' " Git diff

" Testing
Plug 'janko-m/vim-test'

" Tmux integration
Plug 'benmills/vimux' " Tmux integration
Plug 'jpalardy/vim-slime', { 'for': ['ruby', 'elixir'] } " Vim with REPL
Plug 'christoomey/vim-tmux-navigator' " Move between Vim panes and tmux splits
Plug 'edkolev/tmuxline.vim' " Airline integration with Tmux

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' } " Elixir support
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' } " Elixir support

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' } " Navigation and syntax highlight
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'elixir'] } " Ruby code blocks
Plug 'osyo-manga/vim-monster', { 'for': 'ruby' } " Ruby autocomplete

Plug 'hashivim/vim-terraform' " Vim terraform
Plug 'pearofducks/ansible-vim' " Ansible support

" Misc
Plug 'terryma/vim-expand-region' " Visually select increasingly larger regions using the same key combination
Plug 'kana/vim-textobj-user' " Text objects
Plug 'tpope/vim-surround' " Surroundings
Plug 'mattn/gist-vim' " Github gist
Plug 'neomake/neomake' " Execute code checks, find mistakes, in the background
Plug 'powerman/vim-plugin-AnsiEsc' " Ansi escape sequences concealed
call plug#end() " End of vim-plug list


" -----------------------------------------------------------------------------
" Set custom params
" -----------------------------------------------------------------------------
set background=dark " Dark background
colorscheme NeoSolarized " Set default color scheme
set tabstop=2 shiftwidth=2 expandtab " Default tab params
set laststatus=2 " Display status line status
set number " Show line number
set colorcolumn=100 " Highlight 100 column to view max length of line
set autoindent
set nowrap
set cursorline
set mousehide
set mouse=nicr
set showmatch
" set antialias
set ttyfast
set noswapfile
set expandtab
set ignorecase
set smartcase
set relativenumber " Show relative line number
set smartcase
set gdefault
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/build/*,*/_build/*,*/,*/coverage/*,*/vendor/*,*/deps/*
set wrap
set encoding=utf-8 " Set default encoding to UTF-8
set cole=1
set foldmethod=indent " Fold by indents
set foldlevel=3
set title
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

syntax enable " Enable syntax highlighting by default
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight Comment gui=italic
highlight Comment cterm=italic
highligh elixirStruct gui=bold
highligh elixirStruct cterm=bold

" -----------------------------------------------------------------------------
" Set custom parameters
" -----------------------------------------------------------------------------
let test#filename_modifier = ':~'
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"} " Vim-slime default config
let g:tmuxline_preset = {
      \'a'       : '#S',
      \'y'       : [ '%d-%m', '%H:%M' ],
      \'z'       : [ '⧗ #(cat ~/.thyme-tmux)' ],
      \'win'     : [ '#I', '#W' ],
      \'cwin'    : [ '#I', '#W' ],
      \'options' : { 'status-justify': 'left'} }
let g:acp_enableAtStartup = 0 " Disable AutoComplPop
let g:terraform_align=1
let g:airline_powerline_fonts = 1 " Use powerline font with vim-airline
let mapleader = ","
let g:airline_theme = 'solarized' " Set vim-airline color scheme
let s:width = 100
let g:LargeFile=10
let g:indent_guides_enable_on_vim_startup = 1
let g:slime_target = "tmux" " Use vim-slime with tmux
let g:neosolarized_italic = 1
let g:alchemist#elixir_erlang_src = "~/.asdf/shims"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let test#strategy = "neovim"

" Run Neomake when I save any buffer
augroup localneomake
  autocmd! BufWrite * Neomake
  autocmd BufWrite * if test#exists() |
    \   TestFile |
    \ endif
augroup END

" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Mix and Credo setup
" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []

" Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
let g:neomake_elixir_enabled_makers = ['mycredo']
function! NeomakeCredoErrorType(entry)
  if a:entry.type ==# 'F'      " Refactoring opportunities
    let l:type = 'W'
  elseif a:entry.type ==# 'D'  " Software design suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'W'  " Warnings
    let l:type = 'W'
  elseif a:entry.type ==# 'R'  " Readability suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'C'  " Convention violation
    let l:type = 'W'
  else
    let l:type = 'M'           " Everything else is a message
  endif
  let a:entry.type = l:type
endfunction

let g:neomake_elixir_mycredo_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
      \ 'postprocess': function('NeomakeCredoErrorType')
      \ }


" Rainbow Parentheses settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Autoformat
au BufWrite * :Autoformat

" Fix indent guides colors
hi IndentGuidesOdd  guibg=gray ctermbg=0
hi IndentGuidesEven  guibg=gray ctermbg=0


" -----------------------------------------------------------------------------
" File types settings
" -----------------------------------------------------------------------------
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0 " Use tab in makefile
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic comment insertion
autocmd FileType ruby set commentstring=#\ %s
autocmd FileType elixir set commentstring=#\ %s

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType terraform setlocal commentstring=#%s


" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------
imap jj <ESC>
inoremap <F3> :Autoformat<CR><CR>
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : deoplete#manual_complete()

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Set Iterm2 cursors
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

nmap <leader>h :!thyme -d -r 9<cr>
nmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:prettier#exec_cmd_async = 1

if has('nvim')
  tmap <C-o> <C-\><C-n>
end

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
