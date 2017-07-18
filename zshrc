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

# Aliases
alias be='bundle exec'
alias h='history 0'
alias tf='terraform'
alias ans='ansible-playbook'
alias http='http -v'
alias tf='terraform'
alias mux='tmuxinator start'
alias vim='nvim'

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# iTerm hack
# Disables quit by Ctrl-S and Ctrl-Q
stty -ixon

export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
eval "$(rbenv init -)"
fpath=(/usr/local/share/zsh-completions $fpath)
