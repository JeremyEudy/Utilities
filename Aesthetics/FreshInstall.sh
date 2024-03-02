# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    FreshInstall.sh                                                           #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2019/12/07 20:18:57 by jeremy           | /_/    /____/   | M    #
#    Updated: 2024/03/02 16:30:41 by jeremy                                    #
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

cp $HOME/Utilities/tmux\ Stuff/tmux.conf $HOME/.tmux.conf

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
echo -e "${BLUE}Would you like to install Docker (and compose)?${NC}"
echo "--------------------------------------------------------------------------------------"
read -p "[Y/n]"
if [[ "${REPLY}" = 'n' ]] || [[ "${REPLY}" = 'N' ]] ; then
    echo -e "${BLUE}Skipping installation...${NC}"
else
    echo -e "${BLUE}Uninstalling conflicting packages...${NC}"
    for pkg in docker.io docker-doc docker-compose podman-docker containerd runc
        do sudo apt-get remove $pkg
    done
    echo -e "${BLUE}Adding Docker GPG Key${NC}"
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo -e "${BLUE}Add repo to apt sources${NC}"
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    echo -e "${BLUE}Installing docker packages${NC}"
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    echo -e "${BLUE}Installing docker-compose plugin${NC}"
    sudo apt-get update
    sudo apt-get install docker-compose-plugin
fi

echo "--------------------------------------------------------------------------------------"
echo -e "${GREEN}Install complete!${NC}"
echo -e "${GREEN}Press enter to restart...${NC}"
echo "--------------------------------------------------------------------------------------"

read
shutdown -r now
