#!/bin/sh
# Homebrew packages
packages=(
  bcrypt
  coreutils
  dnscrypt
  dnsmask
  fasd
  findutils
  flow
  git-flow
  gnupg
  httpie
  hub
  imagemagick
  leiningen
  nmap
  nvim
  postgresql
  rename
  terminal-notifier
  terraform
  the_silver_searcher
  tmux
  tree
  wget
  xz
  yarn
  zsh
)

# Cask packages
apps=(
  iterm2
  java
  karabiner
  ngrok
  skype
  slack
  the-unarchiver
  torbrowser
  transmission
  vlc
  xmind
)

# Cask fonts
fonts=(
  hasklig
)

brew update
brew upgrade
brew install 'caskroom/cask/brew-cask'
brew tap caskroom/fonts

brew install --force ${packages[@]}
brew link --force ${packages[@]}
brew cask install --force ${apps[@]}
brew cask install --force ${fonts[@]}

brew doctor
brew cleanup
brew prune
brew cask doctor
