#!/usr/bin/env bash
#Author: Jeremy Eudy

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing ZShell and startup commands...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt update
sudo apt install zsh fortune cowsay lolcat -y
chsh -s /usr/bin/zsh

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Oh-My-ZSH...${NC}"
echo -e "${BLUE}(You'll need to type 'exit' into the new oh-my-zsh prompt)${NC}"
echo "--------------------------------------------------------------------------------------"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Cloning git repos...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir ~/Git\ Clones/
cd ~/Git\ Clones/

git clone https://github.com/JeremyEudy/Utilities/
git clone https://github.com/JeremyEudy/CLISearch/

cp Utities/Aesthetics/.zshrc ~
source ~/.zshrc

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Configuring utilities...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir -p ~/.ssh/
cp Utilities/Aesthetics/.screenrc ~
cp Utilities/SSH/config ~/.ssh
cp -r Utilities/Vim\ Stuff/templates ~/.vim/
cp Utilities/Vim\ Stuff/.vimrc ~
cp Utilities/tmux\ Stuff/.tmux.conf ~

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing glances...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install glances -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing powerline fonts...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install fonts-powerline -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Configuring ZSH plugins...${NC}"
echo "--------------------------------------------------------------------------------------"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

echo "--------------------------------------------------------------------------------------"
echo -e "${GREEN}Install complete!${NC}"
echo -e "${GREEN}If your .zshrc is not working appropriately, copy the one contained in Utilities/Aesthetics/.zshrc into ~${NC}"
echo "--------------------------------------------------------------------------------------"
