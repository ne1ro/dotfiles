" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
let g:ale_completion_enabled = 1
let g:ale_elixir_elixir_ls_release = '/Users/neiro/Projects/opensource/elixir-ls/rel'
set nocompatible " Use local vim mode
filetype off " Turn off file type detection
call plug#begin('~/.vim/plugged') " Use vim-plug for plugin management

" Navigation
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy search
Plug 'mileszs/ack.vim' " File searching
Plug 'vim-airline/vim-airline' " Custom status line
Plug 'vim-airline/vim-airline-themes' " Vim-airline themes
Plug 'Lokaltog/vim-easymotion' " Easy motion for vim

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code style
Plug 'tpope/vim-endwise' " End certain structures automatically
Plug 'bronson/vim-trailing-whitespace' " Highlight and remove trailing whitespaces
Plug 'nathanaelkane/vim-indent-guides' " Show indents
Plug 'tpope/vim-commentary' " Easy comments
Plug 'luochen1990/rainbow' " Highlight parentheses
Plug 'Chiel92/vim-autoformat' " Autoformatter
Plug 'w0rp/ale' " Syntax linter

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Color scheme
Plug 'iCyMind/NeoSolarized'
Plug 'blueyed/vim-diminactive'

" VCS integration
Plug 'tpope/vim-fugitive' " Git

" Tmux integration
Plug 'benmills/vimux' " Tmux integration
Plug 'jpalardy/vim-slime', { 'for': ['ruby', 'elixir'] } " Vim with REPL
Plug 'christoomey/vim-tmux-navigator' " Move between Vim panes and tmux splits
Plug 'edkolev/tmuxline.vim' " Airline integration with Tmux

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' } " Elixir support

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " Clojure support
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure'} " Edit parentheses
Plug 'venantius/vim-eastwood', { 'for': 'clojure'} " Linter
Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'} " Autocomplete
Plug 'venantius/vim-cljfmt', {'for': 'clojure'} " Autoformat

" DevOps
Plug 'hashivim/vim-terraform', { 'for': 'terraform' } " Vim terraform
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' } " Terraform completion support

" Misc
Plug 'junegunn/goyo.vim' " Distraction-free mode
Plug 'terryma/vim-expand-region' " Visually select increasingly larger regions using the same key combination
Plug 'kana/vim-textobj-user' " Text objects
Plug 'tpope/vim-surround' " Surroundings
Plug 'mattn/gist-vim' " Github gist
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
set nofoldenable

" True color support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" set antialias
set ttyfast
set noswapfile
set expandtab
set ignorecase
set smartcase
set relativenumber " Show relative line number
set smartcase
set gdefault
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/_build/*,*/,*/coverage/*,*/vendor/*,*/deps/*
set wrap
set encoding=utf-8 " Set default encoding to UTF-8
set cole=1
set foldmethod=indent " Fold by indents
set title
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

syntax enable " Enable syntax highlighting by default
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight Comment gui=italic
highlight Comment cterm=italic
highlight elixirStruct gui=bold
highlight elixirStruct cterm=bold

" -----------------------------------------------------------------------------
" Set custom parameters
" -----------------------------------------------------------------------------
let test#filename_modifier = ':~'
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:clj_fmt_autosave = 1
let g:syntastic_clojure_checkers = ['eastwood']
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"} " Vim-slime default config
let g:autoformat_autoindent = 0
let g:tmuxline_preset = {
      \'a'       : '#S',
      \'y'       : [ '%d-%m', '%H:%M' ],
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
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:rainbow_active = 1 " Enable Rainbow parentheses
let g:ale_linters = {'elixir': ['credo', 'mix', 'elixir-ls'], 'sh': ['language_server']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format']
\}
let g:ale_completion_enabled = 1
let g:ale_elixir_elixir_ls_release = '/Users/neiro/Projects/opensource/elixir-ls/rel'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 500
let g:ale_fix_on_save = 1
let g:prettier#exec_cmd_async = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --vimgrep --smart-case'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Use Ag instead of Ack
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets'

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()

" Fix indent guides colors
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEvent  ctermbg=black


" -----------------------------------------------------------------------------
" File types settings
" -----------------------------------------------------------------------------
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0 " Use tab in makefile
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic comment insertion
autocmd FileType elixir set commentstring=#\ %s
autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>
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
