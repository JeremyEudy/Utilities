# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    Setup-Vim.sh                                     |     ___________ | J    #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2021/11/19 10:37:34 by jeremy           | /_/    /____/   | M    #
#    Updated: 2022/03/30 09:29:31 by jeremy           |                 | Y    #
#                                                     -------------------      #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

VIMDIR="${HOME}/.vim"

mkdir -p $VIMDIR/autoload $VIMDIR/bundle

mkdir -p $VIMDIR/plugin
mkdir -p $VIMDIR/colors
mkdir -p $VIMDIR/bundle

cp -r $HOME/Utilities/Vim\ Stuff/templates $VIMDIR/
cp $HOME/Utilities/Vim\ Stuff/vimrc $HOME/.vimrc

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Vim plugins...${NC}"
echo "--------------------------------------------------------------------------------------"
mkdir -p $VIMDIR/pack/NERDTree/start/
git clone --depth 1 https://github.com/preservim/nerdtree.git $VIMDIR/pack/NERDTree/start/nerdtree
git clone --recurse-submodules https://github.com/python-mode/python-mode $VIMDIR/bundle/python-mode
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
