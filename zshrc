# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"

DEFAULT_USER="neiro"
EDITOR="vim"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vundle git-flow gitignore node npm rake-fast bundler ruby rails capistrano coffee last-working-dir cabal osx brew colorize go postgres rbenv)

source $ZSH/oh-my-zsh.sh

# Commit and push in one command
function gt() {
     git add . && git commit -am "$1" && git push
}

# Commit to git and push to staging
function gts() {
     git add . && git commit -am "$1" && git push && cap staging update
}

function hgt() {
    hg addremove . && hg commit -m "$1" && hg push
}

# Commit, push and deploy in mercurial
function hgts {
    hg addremove . && hg commit -m "$1" && hg push && npm run deploy
}

export PATH="./node_modules/.bin:$PATH"
alias rake='noglob rake'
alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit"
alias gitstatus='git status -sb'
alias be='bundle exec'
alias http='http -v --pretty=all'
alias gitlog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
eval "$(rbenv init - --no-rehash)"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
