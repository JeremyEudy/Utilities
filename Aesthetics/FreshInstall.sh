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
echo -e "${BLUE}Installing tmux and .tmux.conf...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install tmux -y
tmuxVersion=`tmux -V`
tmuxVersion=${tmuxVersion:1}
if (( $(echo "tmuxVersion >= 2.6" |bc -l) ))
then
    cp /home/$USER/Utilities/tmux\ Stuff/.tmux.conf-2.6 /home/$USER/.tmux.conf
else
    cp /home/$USER/Utilities/tmux\ Stuff/.tmux.conf /home/$USER/
fi

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
echo -e "${BLUE}Installing Spaceship theme for ZSH...${NC}"
echo "--------------------------------------------------------------------------------------"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i -e 's/NEWLINE=true/NEWLINE=false/g' /home/$USER/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Copying .zshrc...${NC}"
echo "--------------------------------------------------------------------------------------"
cp /home/$USER/Utilities/Aesthetics/.zshrc /home/$USER
source /home/$USER/.zshrc

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Creating Xmodmap rule to make Caps Lock Escape...${NC}"
echo "--------------------------------------------------------------------------------------"
cp /home/$USER/Utilities/Helper/.Xmodmap/ /home/$USER
xmodmap ~/.Xmodmap

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Adding System76 PopOS theme, icons, and Gnome tweak tool...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo add-apt-repository ppa:system76/pop -y
sudo apt update
sudo apt install pop-theme -y
sudo apt install pop-icon-theme -y
sudo apt install gnome-tweak-tool -y

echo "--------------------------------------------------------------------------------------"
echo -e "${GREEN}To swap themes, open up the gnome tweak tool and change the theme and icons to Pop${NC}"
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
echo -e "${GREEN}Install complete!${NC}"
echo -e "${GREEN}Press enter to restart...${NC}"
echo "--------------------------------------------------------------------------------------"

read
shutdown -r now
