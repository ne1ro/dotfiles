" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
set nocompatible " Use local vim mode
filetype off " Turn off file type detection
call plug#begin('~/.vim/plugged') " Use vim-plug for plugin management
  " Navigation
  Plug 'tpope/vim-vinegar' " File browsing
  Plug 'Shougo/denite.nvim' " Unite all interfaces
  Plug 'rking/ag.vim' " File searching
  Plug 'vim-airline/vim-airline' " Custom status line
  Plug 'vim-airline/vim-airline-themes' " Vim-airline themes
  Plug 'Lokaltog/vim-easymotion' " Easy motion for vim
  Plug 'gorkunov/smartgf.vim' " Quick method definition lookup

  " Code style
  Plug 'editorconfig/editorconfig-vim'
  Plug 'scrooloose/syntastic' " Syntax checker
  Plug 'tpope/vim-endwise' " End certain structures automatically
  Plug 'Raimondi/delimitMate' " Closing of quotes, parenthesis, brackets
  Plug 'bronson/vim-trailing-whitespace' " Highlight and remove trailing whitespaces
  Plug 'nathanaelkane/vim-indent-guides' " Show indents
  Plug 'tpope/vim-commentary' " Easy comments
  Plug 'kien/rainbow_parentheses.vim' " Colorize parentheses

  " Autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Documentation
  Plug 'rizzatti/dash.vim'

  " Color scheme
  Plug 'frankier/neovim-colors-solarized-truecolor-only'

  " VCS integration
  Plug 'tpope/vim-fugitive' " Git
  Plug 'airblade/vim-gitgutter' " Git diff

  " Tmux integration
  Plug 'benmills/vimux' " Tmux integration
  Plug 'jpalardy/vim-slime', { 'for': ['ruby', 'elixir'] } " Vim with REPL
  Plug 'christoomey/vim-tmux-navigator' " Move between Vim panes and tmux splits
  Plug 'edkolev/tmuxline.vim' " Airline integration with Tmux

  " Ruby
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' } " Navigation and syntax highlight
  Plug 'tpope/vim-rails', { 'for': 'ruby' } " Ruby on Rails syntax, navigation
  Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'elixir'] } " Ruby code blocks
  Plug 'osyo-manga/vim-monster', { 'for': 'ruby' } " Ruby autocomplete

  " Elixir
  Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' } " Elixir support
  Plug 'slashmili/alchemist.vim', { 'for': 'elixir' } " Elixir support

  " Misc
  Plug 'terryma/vim-expand-region' " Visually select increasingly larger regions using the same key combination
  Plug 'hashivim/vim-terraform' " Vim terraform
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
" set antialias
set termguicolors
set ttyfast
set noswapfile
set expandtab
set ignorecase
set smartcase
set relativenumber " Show relative line number
set smartcase
set gdefault
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/build/*,*/_build/*,*/_workspace/*,*/coverage/*,*/vendor/*,*/deps/*,*/.bundle/*
set wrap
set encoding=utf-8 " Set default encoding to UTF-8
set cole=1
set foldmethod=syntax " Fold by syntax
set foldlevel=1 " Do not fold top level
set title

syntax enable " Enable syntax highlighting by default


" -----------------------------------------------------------------------------
" Set custom parameters
" -----------------------------------------------------------------------------
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
let s:width = 80
let g:LargeFile=10
let g:indent_guides_enable_on_vim_startup = 1
let g:slime_target = "tmux" " Use vim-slime with tmux

" Run Neomake when I save any buffer
augroup localneomake
  autocmd! BufWritePost * Neomake
augroup END
" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets'

" Syntastic symbols and checkers
let g:syntastic_auto_jump               = 1
let g:syntastic_error_symbol            = '✖'
let g:syntastic_warning_symbol          = '►'
let g:syntastic_ruby_checkers           = ['rubocop', 'mri']
let g:syntastic_enable_elixir_checker   = 1

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

" Fix indent guides colors
if !has("gui_running")
  au Syntax * let indent_guides_auto_colors = 0
  au Syntax * autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=black
  au Syntax * autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey   ctermbg=10
end


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

nmap <leader>t :!thyme -d -r 16<cr>
nmap <silent> <leader>d <Plug>DashSearch

call denite#custom#option('default', {
      \ 'prompt': 'λ'
      \ })

call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
      \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
      \'noremap')

nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

hi link deniteMatchedChar Special

" Denite-extra

nnoremap <leader>o :<C-u>Denite location_list -mode=normal -no-empty<CR>
nnoremap <leader>hs :<C-u>Denite history:search -mode=normal<CR>
nnoremap <leader>hc :<C-u>Denite history:cmd -mode=normal<CR>
