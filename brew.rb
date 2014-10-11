#!/usr/bin/env ruby
# Install / update Homebrew and Cask packages
packages = %w[
  vim
  coreutils
  findutils
  rbenv
  ruby-build
  zsh
  pngquant
  imagemagick
  openvpn
  ack
  wget
  bcrypt
  xz
  node
  autojump
  nginx
  sqlite
  postgresql
  redis
  git-flow
  tmux
  mongodb
  mackup
  go
  nmap
]
packages[0] += ' --override-system-vi --with-lua'

apps = %w[
  alfred
  macvim
  torbrowser
  vlc
  multibit
  robomongo
  gimp
  seil
  transmission
  iterm2
  flash
  skype
  bittorrent-sync
  the-unarchiver
  hr
]

`brew update && brew upgrade && brew install caskroom/cask/brew-cask && \
  brew tap caskroom/versions`

packages.each { |package| exec "brew install #{ package }"}
apps.each { |app| exec "brew cask install #{ app }"}

`brew cleanup && brew cask cleanup && brew cask alfred link`
