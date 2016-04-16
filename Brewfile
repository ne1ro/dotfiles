#!/bin/sh
# Homebrew packages
packages=(
  'vim --override-system-vi --with-lua --with-ruby'
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
  phantomjs
  exercism
  ansible
  docker
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
  hipchat
)

# Cask fonts
fonts=(
  font-source-code-pro
)

brew update
brew upgrade
brew install 'caskroom/cask/brew-cask'
brew tap caskroom/fonts

brew install ${packages[@]}
brew cask install ${apps[@]}
brew cask install ${fonts[@]}

brew cleanup
brew doctor
brew prune
brew cask doctor
brew cask cleanup
