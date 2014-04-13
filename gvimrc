set guioptions-=T " Removes top toolbar
set listchars=trail:~,extends:>,precedes:<
set guioptions-=r " Removes right hand scroll bar
set background=dark
set relativenumber
colorscheme solarized
set go-=L " Removes left hand scroll bar
set go-=m
set go-=M
set go-=B
set go-=t
set go-=b
set go-=l
set guifont=Menlo:h14
set encoding=utf8
set noerrorbells
set novisualbell
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1"
set lines=1000
set columns=1000
autocmd VimEnter * call ToggleFullScreen()
