# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    FreshInstall.sh                                                           #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2019/12/07 20:18:57 by jeremy           | /_/    /____/   | M    #
#    Updated: 2021/11/18 19:23:57 by jeremy                                    #
#                                                     -------------------      #
#                                                                              #
# **************************************************************************** #
#!/usr/bin/env bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

VIMDIR="${HOME}/.vim"

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing curl...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install curl -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Vim and Pathogen...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install vim -y
mkdir -p $VIMDIR/autoload $VIMDIR/bundle && \
curl -LSso $VIMDIR/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Configuring utilities...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir -p $HOME/.ssh/
mkdir -p $VIMDIR/plugin
mkdir -p $VIMDIR/colors
mkdir -p $VIMDIR/bundle
cp $HOME/Utilities/Aesthetics/.screenrc $HOME/
cp $HOME/Utilities/SSH/config $HOME/.ssh
cp -r $HOME/Utilities/Vim\ Stuff/templates $VIMDIR/
cp $HOME/Utilities/Vim\ Stuff/.vimrc $HOME/

mkdir -p $VIMDIR/autoload $VIMDIR/bundle && \
    curl -LSso $VIMDIR/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Vim plugins...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir -p $VIMDIR/pack/NERDTree/start/
git clone --depth 1 https://github.com/preservim/nerdtree.git $VIMDIR/pack/NERDTree/start/nerdtree
git clone --recurse-submodules https://github.com/python-mode/python-mode $VIMDIR/bundle/python-mode
git clone https://github.com/plasticboy/vim-markdown $VIMDIR/bundle/vim-markdown
git clone https://github.com/joshdick/onedark.vim $HOME/Git-Clones/onedark.vim
cp $HOME/Git-Clones/onedark.vim/colors/onedark.vim $VIMDIR/colors/onedark.vim
cp $HOME/Git-Clones/onedark.vim/autoload/onedark.vim $VIMDIR/autoload/onedark.vim
git clone https://github.com/vim-airline/vim-airline $VIMDIR/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes $VIMDIR/bundle/vim-airline-themes

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Would you like to install a blank Vim header?${NC}"
echo "--------------------------------------------------------------------------------------"
read -p "[Y/n]"
if [[ "${REPLY}" = 'n' ]] || [[ "${REPLY}" = 'N' ]] ; then
    echo -e "${BLUE}Skipping installation...${NC}"
else
    cp $HOME/Utilities/Vim\ Stuff/Headers/blank-header.vim $VIMDIR/plugin/header.vim
fi

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Would you like to set Vim textwidth to 80?${NC}"
echo "--------------------------------------------------------------------------------------"
read -p "[Y/n]"
if [[ "${REPLY}" = 'n' ]] || [[ "${REPLY}" = 'N' ]] ; then
    echo -e "${BLUE}Skipping...${NC}"
else
    sed -i 's/" set textwidth=80/set textwidth=80/g' $HOME/.vimrc
fi

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing tmux and .tmux.conf...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install tmux -y
tmuxVersion=`tmux -V`
tmuxVersion=${tmuxVersion:4}

if [ $tmuxVersion = "3.0a" ]
then
    cp $HOME/Utilities/tmux\ Stuff/.tmux.conf-3.0a $HOME/
else
    cp $HOME/Utilities/tmux\ Stuff/.tmux.conf $HOME/
fi

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing ZShell...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt update
sudo apt install zsh fortune cowsay lolcat -y
chsh -s /usr/bin/zsh

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing oh-my-zsh...${NC}"
echo "--------------------------------------------------------------------------------------"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Cloning Repos (CLISearch and Powerline Fonts)...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir $HOME/Git-Clones/
cd $HOME/Git-Clones/

git clone https://github.com/JeremyEudy/CLISearch/
git clone https://github.com/powerline/fonts

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
echo -e "${BLUE}Installing powerline fonts...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install fonts-powerline -y

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Configuring ZSH plugins...${NC}"
echo "--------------------------------------------------------------------------------------"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing powerlevel10k for oh-my-zsh...${NC}"
echo "--------------------------------------------------------------------------------------"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Copying .zshrc...${NC}"
echo "--------------------------------------------------------------------------------------"
cp $HOME/Utilities/Aesthetics/.zshrc $HOME
source $HOME/.zshrc

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
