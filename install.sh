#!/usr/bin/env bash

#
# Check working directory
#
if [[ $HOME/.dotfiles != $PWD ]];
then
    echo "Script not run under $HOME/.dotfiles"
    exit 1
fi

#
# Prompt to install config dependencies
#
echo "Would you like to install dependencies? (y/N) "
read -r

if [[ $REPLY =~ ^[Yy]$ ]];
then

    if cat /etc/*-release | grep 'Ubuntu';
    then
        sudo apt update
        sudo apt install fd-find nodejs ripgrep unzip yarn tree &> /dev/null
        sudo apt install ranger zsh &> /dev/null
    elif cat /etc/*-release | grep 'Arch';
    then
        sudo pacman -Syy
        sudo pacman -S fd nodejs ripgrep unzip yarn tree ranger zsh &> /dev/null
    else
        echo "Could not identify Linux distro... skipping"
    fi
fi

#
# Create symbolic links for all directories under `.config/`
# Skip those that are already and prompt to delete regular types
#
for FILE in .config/*;
do

    if [[ -e $HOME/$FILE ]];
    then
        echo -n "Found $HOME/$FILE "

        if [[ -L $HOME/$FILE ]];
        then
            echo "...skipping (symbolic link)"
            continue
        fi

        echo -n "...delete folder? (y/N) "
        read -r

        if [[ $REPLY =~ ^[Yy]$ ]];
        then
            rm -r $HOME/$FILE
        else
            continue
        fi
    fi
    ln -s $PWD/$FILE $HOME/$FILE
done

#
# Create symbolic link for `.zshrc`
#
if [[ -e $HOME/.zshrc ]];
then
    echo "Found $HOME/.zshrc...creating backup"
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi
ln -s $PWD/.zshrc $HOME/.zshrc

#
# Create symbolic link for `.vimrc`
#
if [[ -e $HOME/.vimrc ]];
then
    echo "Found $HOME/.vimrc ...creating backup"
    mv $HOME/.zshrc $HOME/.vimrc.bak
fi
ln -s $PWD/.vimrc $HOME/.vimrc

#
# Prompt to install vim-plug if not installed
#
if [[ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ]];
then
    echo "Would you like to install vim-plug? (Y/n) "
    read -r

    if [[ $REPLY =~ ^[Nn]$ ]];
    then
        echo "NOTE: This neovim configuration requires vim-plug"
    else
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
fi

echo "Done"
