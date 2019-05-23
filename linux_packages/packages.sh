#!/bin/bash

echo "Run 'source packages.sh' to load variables into your current session"
echo "variables: cmd_tools, gui_apps"

cmd_tools="
  git
  curl
  wget
  neovim
  shellcheck
  tree
  htop
  fish
  zsh
  python3
  ruby
  sed
"

gui_apps="
  vscode
  slack-desktop
  mailspring
"

function install_pip() {
  wget https://bootstrap.pypa.io/get-pip.py
  python get-pip.py
  rm -f get-pip.py
}

function install_omf() {
  curl -L https://get.oh-my.fish | fish
  fish -c 'omf install fishbone'
  sudo echo "/usr/bin/fish" >> /etc/shells
  chsh -s /usr/bin/fish
}

function install_zsh() {
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  echo "plugins = (git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)" >> ~/.zshrc
}

function install_brew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

