#!/usr/bin/env zsh

# Enable TouchID for PAM
grep -q pam_tid.so /etc/pam.d/sudo || sudo sed -i '.bak' $'2i\\\nauth       sufficient     pam_tid\.so\n' /etc/pam.d/sudo

# Install Xcode
xcode-select --install

# Install Homebrew
export CI=
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew taps
brew install datawire/blackbird/telepresence
brew install twpayne/taps/chezmoi

# Install Homebrew formulae
brew install awscli bash-completion coreutils fzf gawk git gnu-sed go helmfile jq kube-ps1 kubernetes-cli kubernetes-helm make mysql@5.7 node@10 python redis ripgrep sceptre sipcalc stern watch wget yq
brew link --force mysql@5.7 node@10

# Install Homebrew casks
for cask in docker google-chrome osxfuse spectacle visual-studio-code
do
  brew cask install $cask
done
