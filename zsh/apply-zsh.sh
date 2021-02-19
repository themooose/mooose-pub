#!/bin/bash

# Sets common zsh config
# ensure that zsh and oh-my-zsh are installed

# Be sure to run this from the mooose-pub/zsh directory!
[ ! -f apply-zsh.sh ] && { echo "Be sure you are running this from the mooose-pub/zsh directory."; exit; }

# update this copy of .zshrc to reference the current user
sed -i "s/mooose/${USER}/g" .zshrc

# backup local .zshrc (if necessary) and replace it
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
cp .zshrc ~/.zshrc

# backup local .zshrc (if necessary) and replace it
[ -f ~/.p10k.zsh ] && mv ~/.p10k.zsh ~/.p10k.zsh.bak
cp .p10k.zsh ~/.p10k.zsh

. ~/.zshrc
echo "zsh config applied. Happy coding!"