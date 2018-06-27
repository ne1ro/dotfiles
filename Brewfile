#!/bin/sh
# Homebrew packages
packages=(
  ansible
  asdf
  bcrypt
  coreutils
  dnscrypt
  dnsmask
  fasd
  findutils
  flow
  git-flow
  gnupg
  htop
  httpie
  hub
  imagemagick
  nmap
  nvim
  postgresql
  redis
  rename
  terminal-notifier
  terraform
  the_silver_searcher
  tmux
  tree
  wget
  xz
  zsh
)

# Cask packages
apps=(
  alfred
  dash
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
brew cask cleanup
