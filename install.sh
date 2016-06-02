#! /bin/sh
#
# install.sh
# Copyright (C) 2016 Subho Halder <subho.halder@gmail.com>
#
# Distributed under terms of the MIT license.
#



if [[ -d "$HOME/.vim" && ! -L "$HOME/.vim" ]]; then
  echo -e "moving and backing up ~/.vim to ~/.vim_backup"
  mv ~/.vim ~/.vim_backup
fi

git clone --recursive git@github.com:subho007/dotvim.git $HOME/.vim

PWD=$HOME/.vim

# .vimrc is a file, use the -f flag
if [[ -f "$HOME/.vimrc" && ! -L "$HOME/.vimrc" ]]; then
  echo -e "moving and backing up ~/.vimrc to ~/.vimrc_backup"
  mv ~/.vimrc ~/.vimrc_backup
fi

ln -s "$PWD/.vimrc" ~/.vimrc

echo -e "Installing font"

open "$PWD/Fonts/InconsolataDz/Inconsolata-dz for Powerline.otf"
