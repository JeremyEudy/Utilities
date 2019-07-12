#!/usr/bin/env bash
#Author: Jeremy Eudy

echo "Installing ZShell and startup commands..."
sudo apt update
sudo apt install zsh fortune cowsay lolcat -y
sudo chsh -s /usr/local/bin/zsh

echo "Installing Oh-My-ZSH..."
git clone https://github.com/robbyrussell/oh-my-zsh

echo "Configuring ZSH add-ons and cloning git repos..."
mkdir ~/Git\ Clones/
cd ~/Git\ Clones/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


git clone https://github.com/JeremyEudy/Utilities/
git clone https://github.com/JeremyEudy/CLISearch/

cp Utities/Aesthetics/.zshrc ~
source ~/.zshrc

echo "Configuring utilities..."
mkdir -p ~/.ssh/
cp Utilities/Aesthetics/.screenrc ~
cp Utilities/SSH/config ~/.ssh
cp -r Utilities/Vim\ Stuff/templates ~/.vim/
cp Utilities/Vim\ Stuff/.vimrc ~
cp Utilities/tmux\ Stuff/.tmux.conf ~

echo "Installing glances..."
sudo apt install glances -y

echo "Install complete!"
