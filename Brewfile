#!/bin/sh
# Homebrew packages
packages=(
  bcrypt
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
  nmap
  node
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
  zsh
)

# Cask packages
apps=(
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
  font-fira-code
)

brew tap d12frosted/emacs-plus
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
