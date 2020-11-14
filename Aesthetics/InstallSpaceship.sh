#!/usr/bin/env bash
echo "--------------------------------------------------------------------------------------"
echo -e "${BLUE}Installing Spaceship theme for ZSH...${NC}"
echo "--------------------------------------------------------------------------------------"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i -e 's/NEWLINE=true/NEWLINE=false/g' /home/$USER/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh
