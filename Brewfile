#!/bin/sh
# Homebrew packages
packages=(
  bcrypt
  cmake
  coreutils
  dnscrypt
  dnsmask
  emacs-plus
  fasd
  findutils
  flow
  git-flow
  gnupg
  httpie
  hub
  imagemagick
  leiningen
  libvterm
  nmap
  npm
  postgresql
  rbenv
  rename
  terminal-notifier
  terraform
  the_silver_searcher
  tree
  wget
  xz
  yarn
  zsh
)

# Cask packages
apps=(
  java
  ngrok
  skype
  slack
  the-unarchiver
  transmission
  vlc
  xmind
)

# Cask fonts
fonts=(
  fira-code-mono
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
