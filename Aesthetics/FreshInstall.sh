# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    FreshInstall.sh                                  |     ___________ | J    #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2019/12/07 20:18:57 by jeremy           | /_/    /____/   | M    #
#    Updated: 2020/10/23 23:09:57 by jeremy           |                 | Y    #
#                                                     -------------------      #
#                                                                              #
# **************************************************************************** #
#!/usr/bin/env bash

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
tmuxVersion=${tmuxVersion:4}

if [ $tmuxVersion = "3.0a" ]
then
    cp /home/$USER/Utilities/tmux\ Stuff/.tmux.conf-3.0a /home/$USER/
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
sudo cp CLISearch/CLISearch.py /usr/bin/search

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

mkdir -p /home/$USER/.vim/plugin

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing glances...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install glances -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Markdown Viewer...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo -H python3 -m pip install mdv

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
cp /home/$USER/Utilities/Helper/.Xmodmap /home/$USER
xmodmap /home/$USER/.Xmodmap

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Adding Gnome tweak tool...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Would you like to install the dircolors-solarized repository?${NC}"
echo "--------------------------------------------------------------------------------------"
read -p "[Y/n]"
if [[ "${REPLY}" = 'n' ]] || [[ "${REPLY}" = 'N' ]] ; then
    echo -e "${BLUE}Skipping installation...${NC}"
else
    git clone https://github.com/seebi/dircolors-solarized /home/$USER/Git\ Clones/dircolors-solarized
    echo 'eval `dircolors /home/$USER/Git\ Clones/dircolors-solarized/dircolors.256dark`' >> /home/$USER/.zshrc
fi

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Would you like to install Discord?${NC}"
echo "--------------------------------------------------------------------------------------"
read -p "[Y/n]"
if [[ "${REPLY}" = 'n' ]] || [[ "${REPLY}" = 'N' ]] ; then
    echo -e "${BLUE}Skipping installation...${NC}"
else
    sudo snap install discord
fi

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Would you like to install Spotify?${NC}"
echo "--------------------------------------------------------------------------------------"
read -p "[Y/n]"
if [[ "${REPLY}" = 'n' ]] || [[ "${REPLY}" = 'N' ]] ; then
    echo -e "${BLUE}Skipping installation...${NC}"
else
    sudo snap install spotify
fi

echo "--------------------------------------------------------------------------------------"
echo -e "${GREEN}Install complete!${NC}"
echo -e "${GREEN}Press enter to restart...${NC}"
echo "--------------------------------------------------------------------------------------"

read
shutdown -r now
