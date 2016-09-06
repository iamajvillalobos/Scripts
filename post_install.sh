brew_cask_expand_alias() {
  brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_is_installed() {
  local NAME=$(brew_cask_expand_alias "$1")
  brew cask list -1 | grep -Fqx "$NAME"
}

brew_cask_install() {
  if ! brew_cask_is_installed "$1"; then
    brew cask install "$@"
  fi
}

brew_cask_install_or_upgrade() {
  if brew_cask_is_installed "$1"; then
    echo "$1 is already installed, brew cask upgrade is not yet implemented"
  else
    brew cask install "$@"
  fi
}

brew tap caskroom/cask
brew_cask_install_or_upgrade 'brew-cask'

brew_cask_install_or_upgrade 'telegram'
brew_cask_install_or_upgrade 'spectacle'
brew_cask_install_or_upgrade 'seil'
brew_cask_install_or_upgrade 'google-chrome'
brew_cask_install_or_upgrade '1password'
brew_cask_install_or_upgrade 'caffeine'
brew_cask_install_or_upgrade 'slack'
brew_cask_install_or_upgrade 'sequel-pro'
brew_cask_install_or_upgrade 'omnifocus'
