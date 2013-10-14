set guioptions-=T " Removes top toolbar
set list
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
autocmd vimenter * NERDTree /home/neiro/Projects/
autocmd BufEnter * NERDTreeMirror
set guifont=Meslo\ LG\ S\ for\ Powerline\ 11
