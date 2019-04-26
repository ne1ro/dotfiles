" -----------------------------------------------------------------------------
" Initial configuration
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged') " Use vim-plug for plugin management

set nocompatible " Use local vim mode
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

filetype off " Turn off file type detection

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged') " Use vim-plug for plugin management

" Navigation
Plug 'vim-airline/vim-airline' " Custom status line
Plug 'vim-airline/vim-airline-themes' " Vim-airline themes
Plug 'Lokaltog/vim-easymotion' " Easy motion for vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code style
" Plug 'tpope/vim-endwise' " End certain structures automatically
Plug 'bronson/vim-trailing-whitespace' " Highlight and remove trailing whitespaces
Plug 'nathanaelkane/vim-indent-guides' " Show indents
Plug 'tpope/vim-commentary' " Easy comments
Plug 'luochen1990/rainbow' " Highlight parentheses
Plug 'sbdchd/neoformat' " Autoformatter

Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Autocomplete
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'honza/vim-snippets'

" Color scheme
Plug 'iCyMind/NeoSolarized'
Plug 'blueyed/vim-diminactive'

" VCS integration
Plug 'tpope/vim-fugitive' " Git

" Tmux integration
Plug 'benmills/vimux' " Tmux integration
Plug 'jpalardy/vim-slime', { 'for': ['elixir'] } " Vim with REPL
Plug 'christoomey/vim-tmux-navigator' " Move between Vim panes and tmux splits
Plug 'edkolev/tmuxline.vim' " Airline integration with Tmux

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' } " Elixir support

" Clojure
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " Clojure support
Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure'} " Edit parentheses
Plug 'venantius/vim-eastwood', { 'for': 'clojure'} " Linter
Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'} " Autocomplete
" Plug 'venantius/vim-cljfmt', {'for': 'clojure'} " Autoformat

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
set colorcolumn=80 " Highlight 80 column to view max length of line
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
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:clj_fmt_autosave = 1
let g:syntastic_clojure_checkers = ['eastwood']
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"} " Vim-slime default config
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
let s:width = 80
let g:LargeFile=10
let g:indent_guides_enable_on_vim_startup = 1
let g:slime_target = "tmux" " Use vim-slime with tmux
let g:neosolarized_italic = 1
let g:rainbow_active = 1 " Enable Rainbow parentheses
let g:prettier#exec_cmd_async = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:neoformat_try_formatprg = 1

" Fix indent guides colors
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEvent  ctermbg=black


" -----------------------------------------------------------------------------
" File types settings
" -----------------------------------------------------------------------------
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0 " Use tab in makefile
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic comment insertion
autocmd FileType elixir set commentstring=#\ %s
autocmd FileType terraform setlocal commentstring=#%s

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------
imap jj <ESC>
inoremap <F3> :Neoformat<CR><CR>
nnoremap <C-P> :GFiles<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Set Iterm2 cursors
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

if has('nvim')
  tmap <C-o> <C-\><C-n>
end

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
