#!/usr/bin/env bash
#Author: Jeremy Eudy

echo "Installing ZShell and startup commands..."
sudo apt update
sudo apt install zsh fortune cowsay lolcat -y
chsh -s /usr/bin/zsh

echo "Installing Oh-My-ZSH..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing glances..."
sudo apt install glances -y

echo "Install complete!"
