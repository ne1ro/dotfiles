export PATH="./node_modules/.bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=~/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export NVM_DIR=~/.nvm
export KEYTIMEOUT=1
export HOMEBREW_BREWFILE="~/dotfiles/Brewfile"

source $ZSH/oh-my-zsh.sh
source $(brew --prefix nvm)/nvm.sh

alias rake='noglob rake'
alias http='http -v --pretty=all'

eval "$(rbenv init - --no-rehash)"
stty -ixon -ixoff # Hack for <c-s> in ITerm

[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
