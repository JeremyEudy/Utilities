#!/usr/bin/env bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

VIMDIR="${HOME}/.vim"

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Vim and Pathogen...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install vim -y mkdir -p $VIMDIR/autoload $VIMDIR/bundle && \
curl -LSso $VIMDIR/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p $VIMDIR/plugin
mkdir -p $VIMDIR/colors
mkdir -p $VIMDIR/bundle

cp -r $HOME/Utilities/Vim\ Stuff/templates $VIMDIR/
cp $HOME/Utilities/Vim\ Stuff/.vimrc $HOME/

mkdir -p $VIMDIR/autoload $VIMDIR/bundle && \
    curl -LSso $VIMDIR/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing powerline fonts...${NC}"
echo "--------------------------------------------------------------------------------------"
git clone https://github.com/powerline/fonts powerline-fonts && bash powerline-fonts/install.sh

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
