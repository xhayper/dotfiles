#!/bin/zsh

echo IF THIS SCRIPT BREAKS YOUR DOTFILES, I AM NOT RESPONSIBLE FOR IT.
read -n 1

## CONFIG ##

# keep a backup of user's zshrc
cp -f ~/.zshrc ~/.zshrc.backup
rm -f ~/.zshrc
echo "I made a copy of your zshrc in ~/.zshrc.backup!"

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

echo "FPATH=~/.zfunc:\$FPATH" >> ~/.zshrc
echo "" >> ~/.zshrc

## INSTALL ##

# Brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
"$(/opt/homebrew/bin/brew shellenv)"

brew install neovim
brew install volta
brew install miniforge
brew install fastfetch

brew install --cask warp
brew install --cask font-hack-nerd-font

# Node

VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"

volta install node

## CONFIG ##
cat .zshrc >> ~/.zshrc

echo "" >> ~/.zshrc
echo "VOLTA_HOME=\"\$HOME/.volta\"" >> ~/.zshrc
echo "PATH=\"\$VOLTA_HOME/bin:\$PATH\"" >> ~/.zshrc

conda init "$(basename "${SHELL}")"

## All done! ##
echo "Great! Everything is installed!"
