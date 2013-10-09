set guioptions-=T " Removes top toolbar
set list
set listchars=trail:~,extends:>,precedes:<
set guioptions-=r " Removes right hand scroll bar
set background=dark
set relativenumber
colorscheme base16-eighties
set go-=L " Removes left hand scroll bar
set go-=m
set go-=M
set go-=B
set go-=t
set go-=b
set go-=l
autocmd vimenter * NERDTree /home/neiro/Projects/
autocmd BufEnter * NERDTreeMirror
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12

