#!/bin/sh
# Homebrew packages
packages=(
  nvim
  coreutils
  findutils
  rbenv
  ruby-build
  zsh
  pngquant
  imagemagick
  openvpn
  wget
  httpie
  pwgen
  bcrypt
  xz
  fasd
  postgresql
  redis
  git-flow
  tmux
  nmap
  flow
  terminal-notifier
  htop
  the_silver_searcher
  hub
  tree
  rename
  reattach-to-user-namespace
  elixir
  elasticsearch
  node
)

# Cask packages
apps=(
  alfred
  vlc
  seil
  transmission
  iterm2
  skype
  the-unarchiver
  amethyst
  flux
  xmind
  dash
  torbrowser
  java
  android-file-transfer
  slack
)

# Cask fonts
fonts=(
  font-source-code-pro
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
