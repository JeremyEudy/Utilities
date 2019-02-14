#!/usr/bin/env bash
#Author: Jeremy Eudy

sudo apt update
sudo apt install zsh
sudo chsh -s /usr/local/bin/zsh

git clone https://github.com/robbyrussell/oh-my-zsh

sed -e "71s/git/git\n/"
sed -e "72s//zsh-syntax-highlighting\n/"
sed -e "73s//zsh-autosuggestinons/"
sed -e "16s/robbyrussel/fino/" ~/.zshrc
clear
source ~/.zshrc

