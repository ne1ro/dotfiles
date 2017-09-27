#!/bin/sh
# Homebrew packages
packages=(
  nvim
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
  node
  terraform
  ansible
  geth
)

# Cask packages
apps=(
  electrum
  ngrok
  mist
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
