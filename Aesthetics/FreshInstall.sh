# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    FreshInstall.sh                                  |     ___________ | J    #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2019/12/07 20:18:57 by jeremy           | /_/    /____/   | M    #
#    Updated: 2021/11/19 10:43:16 by jeremy           |                 | Y    #
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
echo -e "${BLUE}Running Setup-Vim.sh...${NC}"
echo "--------------------------------------------------------------------------------------"
bash $HOME/Utilities/Vim\ Stuff/Setup-Vim.sh

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Configuring utilities...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir -p $HOME/.ssh/
cp $HOME/Utilities/Aesthetics/.screenrc $HOME/
cp $HOME/Utilities/SSH/config $HOME/.ssh

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing tmux and .tmux.conf...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install tmux -y

cp $HOME/Utilities/tmux\ Stuff/.tmux.conf $HOME/

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Running Setup-ZSH.sh...${NC}"
echo "--------------------------------------------------------------------------------------"
bash $HOME/Utilities/ZSH/Setup-ZSH.sh

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Cloning CLISearch...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir $HOME/Git-Clones/
cd $HOME/Git-Clones/

git clone https://github.com/JeremyEudy/CLISearch/

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing pip...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install python3-pip -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing glances...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install glances -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Markdown Viewer...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo -H python3 -m pip install mdv

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing jq...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install jq -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Creating Xmodmap rule to make Caps Lock Escape...${NC}"
echo "--------------------------------------------------------------------------------------"
cp $HOME/Utilities/Helper/.Xmodmap $HOME
xmodmap $HOME/.Xmodmap

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
    git clone https://github.com/seebi/dircolors-solarized $HOME/Git-Clones/dircolors-solarized
    echo 'eval `dircolors $HOME/Git-Clones/dircolors-solarized/dircolors.256dark`' >> $HOME/.zshrc
fi

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Would you like to install Fira Code fonts?${NC}"
echo "--------------------------------------------------------------------------------------"
read -p "[Y/n]"
if [[ "${REPLY}" = 'n' ]] || [[ "${REPLY}" = 'N' ]] ; then
    echo -e "${BLUE}Skipping installation...${NC}"
else
    sudo apt install fonts-firacode -y
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
