# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    Setup-tmux.sh                                    |     ___________ | J    #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2021/12/15 12:19:00 by jeremy           | /_/    /____/   | M    #
#    Updated: 2021/12/15 12:20:51 by jeremy           |                 | Y    #
#                                                     -------------------      #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing tmux...${NC}"
echo "--------------------------------------------------------------------------------------"
sudo apt install tmux -y

cp $HOME/Utilities/tmux\ Stuff/tmux.conf $HOME/.tmux.conf

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing powerline fonts...${NC}"
echo "--------------------------------------------------------------------------------------"
git clone https://github.com/powerline/fonts powerline-fonts && \
    bash powerline-fonts/install.sh && \
    rm -rf powerline-fonts

echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing tmux Themes...${NC}"
echo "--------------------------------------------------------------------------------------"
git clone https://github.com/jimeh/tmux-themepack ~/.tmux-themepack
