#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR="vim"
export VISUAL="vim"

alias be='bundle exec'
alias h='history'

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# iTerm hack
# Disables quit by Ctrl-S and Ctrl-Q
stty -ixon

# Node.js local executables
export PATH="./node_modules/.bin:$PATH"

# Go PATH
export GOPATH="~/Projects/go"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
