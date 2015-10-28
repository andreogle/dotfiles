#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
mv ~/.vimrc ~/dotfiles_old/
mv ~/.gvimrc ~/dotfiles_old/
mv ~/.jshintrc ~/dotfiles_old/
mv ~/.eslintrc ~/dotfiles_old/
mv ~/.config/fish/config.fish ~/dotfiles_old/
echo "Creating symlink to $file in home directory."
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vimrc ~/.nvimrc
ln -sf ~/dotfiles/.vim ~/.nvim
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.jshintrc ~/.jshintrc
ln -sf ~/dotfiles/.eslintrc ~/.eslintrc
ln -sf ~/dotfiles/config.fish ~/.config/fish/config.fish
