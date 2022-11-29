#!/bin/bash

echo IF THIS SCRIPT BROKE YOUR DOTFILES, I AM NOT RESPONSIBLE FOR IT.
read -n 1

## CONFIG ##

# keep a backup of user's zshrc
cp -f ~/.zshrc ~/.zshrc-backup
rm -f ~/.zshrc

cp -f .config/* ~/.config
cp -f .gitconfig ~/
cp -f .condarc ~/

echo "if (( ! \${fpath[(I)/usr/local/share/zsh/site-functions]} )); then" >> ~/.zshrc
echo "    FPATH=\"/usr/local/share/zsh/site-functions:\$FPATH\"" >> ~/.zshrc
echo "fi" >> ~/.zshrc
echo "" >> ~/.zshrc

echo "if type brew &>/dev/null; then" >> ~/.zshrc
echo "    FPATH=\"\$(brew --prefix)/share/zsh/site-functions:\$FPATH\"" >> ~/.zshrc
echo "fi" >> ~/.zshrc
echo "" >> ~/.zshrc

echo "FPATH=~/.zfunc:$FPATH" >> ~/.zshrc
echo "" >> ~/.zshrc

## INSTALL ##

# Brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
"$(/opt/homebrew/bin/brew shellenv)"

brew tap homebrew/cask
brew tap homebrew/cask-versions
brew tap homebrew/command-not-found

brew install neovim
brew install asdf
brew install bat
# YOOO
brew install neofetch

brew install --cask iterm2
brew install --cask warp
brew install --cask firefox-developer-edition
brew install --cask authy

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# mambaforge (aka conda-forge but use mamba resolver)
sh -c "$(curl -fsSL "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh)")"

## CONFIG ##
cat .zshrc >> ~/.zshrc

## All done! ##

echo "Great! Everything is installed!"
echo "Now, add \"command-not-found\" to oh-my-zsh's plugin list! and you will be done!"
