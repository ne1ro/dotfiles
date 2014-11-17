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
  hg-flow
  tmux
  mongodb
  mackup
  go
  nmap
]
packages[0] += ' --override-system-vi --with-lua'

apps = %w[
  alfred
  torbrowser
  vlc
  multibit
  robomongo
  gimp
  seil
  transmission
  iterm2
  skype
  bittorrent-sync
  the-unarchiver
  hr
  tomighty
  google-chrome
  amethyst
  dash
  calibre
  xmind
  flux
  worksnaps-client
]

`brew update && brew upgrade && brew install caskroom/cask/brew-cask && \
  brew tap caskroom/versions`

packages.each { |package| exec "brew install #{ package }"}
apps.each { |app| exec "brew cask install #{ app }"}

`brew cleanup && brew cask cleanup && brew cask alfred link`
