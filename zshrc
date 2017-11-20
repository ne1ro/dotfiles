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
alias v='nvim'
alias vim='nvim'
export EDITOR="nvim"
export VISUAL="nvim"
export ECTO_EDITOR="nvim"

# Aliases
alias be='bundle exec'
alias h='history 0'
alias tf='terraform'
alias ans='ansible-playbook'
alias http='http -v'
alias tf='terraform'
alias mux='tmuxinator start'

# iTerm hack
# Disables quit by Ctrl-S and Ctrl-Q
stty -ixon

export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export TERM=xterm-256color-italic

eval "$(rbenv init -)"
fpath=(/usr/local/share/zsh-completions $fpath)

function task {
  git flow $($1) start $(echo "$2" | ruby -e "puts gets.downcase.gsub(/[^a-zA-Z0-9 ]/, '').gsub(' ', '-')")
}
