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
  nvm
  the_silver_searcher
  mplayer
  hub
  tree
  rename
  reattach-to-user-namespace
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
  hr
  amethyst
  calibre
  flux
  xmind
  dash
  mou
)

# Cask fonts
fonts=(
  font-hack
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
