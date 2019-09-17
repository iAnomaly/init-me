#!/usr/bin/env zsh

# Enable TouchID for PAM
grep -q pam_tid.so /etc/pam.d/sudo || sudo sed -i '.bak' $'2i\\\nauth       sufficient     pam_tid\.so\n' /etc/pam.d/sudo

if ! command -v brew &>/dev/null
then
  # Install Xcode
  command -v xcode-select &>/dev/null || xcode-select --install

  # Install Homebrew
  export CI=
  /usr/bin/ruby -e "$(curl --fail --location https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Homebrew taps
brew install datawire/blackbird/telepresence
brew install twpayne/taps/chezmoi

# Install Homebrew formulae
brew install awscli bash-completion coreutils fd fzf gawk git gnu-sed go helmfile highlight jq kubectx kubernetes-cli kubernetes-helm make mysql@5.7 node@10 python redis ripgrep sceptre sipcalc stern tmux tree watch wget yq
brew link --force mysql@5.7 node@10

# Install Homebrew casks
for cask in docker google-chrome osxfuse spectacle visual-studio-code
do
  brew cask install $cask
done
