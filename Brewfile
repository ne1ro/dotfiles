#!/bin/sh
# Homebrew packages
packages=(
  'vim --override-system-vi --with-lua --with-ruby'
  elixir
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
  elasticsearch
  node
  terraform
)

# Cask packages
apps=(
  ngrok
  alfred
  vlc
  seil
  transmission
  iterm2
  skype
  the-unarchiver
  amethyst
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

brew install ${packages[@]}
brew cask install ${apps[@]}
brew cask install ${fonts[@]}

brew doctor
brew cleanup
brew prune
brew cask doctor
brew cask cleanup
