#!/usr/bin/env bash

# Install Xcode
xcode-select --install

# Install Homebrew
export CI=
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew formulae
brew install awscli bash-completion chezmoi coreutils gawk git gnu-sed go jq kops kubernetes-cli kubernetes-helm kubetail make node python redis ripgrep sceptre sipcalc watch wget yq

# Install Homebrew casks
brew cask install docker google-chrome spectacle visual-studio-code
