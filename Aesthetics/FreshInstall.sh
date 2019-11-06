#!/usr/bin/env bash
#Author: Jeremy Eudy

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing curl...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install curl -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Vim and Pathogen...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install vim -y
mkdir -p /home/$USER/.vim/autoload /home/$USER/.vim/bundle && \
curl -LSso /home/$USER/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing ZShell...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt update
sudo apt install zsh fortune cowsay lolcat -y
chsh -s /usr/bin/zsh

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Oh-My-ZSH...${NC}"
echo "--------------------------------------------------------------------------------------"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing CLI Search...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir /home/$USER/Git\ Clones/
cd /home/$USER/Git\ Clones/

git clone https://github.com/JeremyEudy/CLISearch/


echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Configuring utilities...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir -p /home/$USER/.ssh/
cp /home/$USER/Utilities/Aesthetics/.screenrc /home/$USER/
cp /home/$USER/Utilities/SSH/config /home/$USER/.ssh
cp -r /home/$USER/Utilities/Vim\ Stuff/templates /home/$USER/.vim/
cp /home/$USER/Utilities/Vim\ Stuff/.vimrc /home/$USER/
cp /home/$USER/Utilities/tmux\ Stuff/.tmux.conf /home/$USER/

mkdir -p /home/$USER/.vim/autoload /home/$USER/.vim/bundle && \
    curl -LSso /home/$USER/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

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
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Copying .zshrc...${NC}"
echo "--------------------------------------------------------------------------------------"
cp /home/$USER/Utilities/Aesthetics/.zshrc /home/$USER
source /home/$USER/.zshrc

echo "--------------------------------------------------------------------------------------"
echo -e "${GREEN}Install complete!${NC}"
echo -e "${GREEN}Press enter to restart...${NC}"
echo "--------------------------------------------------------------------------------------"
read
shutdown -r now
