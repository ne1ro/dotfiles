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
  hg-flow
  tmux
  mongodb
  mackup
  nmap
  hg
  flow
  ghc
  terminal-notifier
  htop
  nvm
  the_silver_searcher
  mplayer
  ansible
  docker
  vagrant
  hub
  tree
  rename
  syncthing
)

# Cask packages
apps=(
  alfred
  torbrowser
  vlc
  jeromelebel-mongohub
  seil
  transmission
  iterm2
  skype
  the-unarchiver
  hr
  google-chrome
  amethyst
  calibre
  flux
  worksnaps-client
  xmind
  dash
  mou
)

# Cask fonts
fonts=(
  font-m-plus
  font-roboto
  font-droid-sans
  font-open-sans
  font-pt-sans
  font-source-code-pro-for-powerline
  font-fira-mono-for-powerline
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
