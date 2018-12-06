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

# Aliases
alias ans='ansible-playbook'
alias be='bundle exec'
alias h='history 0'
alias http='http -v'
alias mux='tmuxinator start'
alias ph='iex -S mix phx.server'
alias tf='terraform'
alias v='nvim'
alias vim='nvim'

# iTerm hack
# Disables quit by Ctrl-S and Ctrl-Q
stty -ixon

export ECTO_EDITOR="nvim"
export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"
export ERL_AFLAGS="-kernel shell_history enabled"
export LC_ALL=en_US.UTF-8
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export TERM=xterm-256color-italic
export VISUAL="nvim"

eval "$(rbenv init -)"
fpath=(/usr/local/share/zsh-completions $fpath)

function task {
  git flow feature start $(echo "$1" | ruby -e "puts gets.downcase.gsub(/[^a-zA-Z0-9 ]/, '').gsub(' ', '-')")
}
