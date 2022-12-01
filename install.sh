#!/usr/bin/env bash

if [[ $HOME/.dotfiles != $PWD ]];
then
    echo "Script not run under $HOME/.dotfiles"
    exit 1
fi

for FILE in .config/*;
do

    if [[ -e $HOME/$FILE ]];
    then
        echo -n "Found $HOME/$FILE"

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

if [[ -e $HOME/.zshrc ]];
then
    echo "Found $HOME/.zshrc...creating backup"
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi

ln -s $PWD/.zshrc $HOME/.zshrc

if [[ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ]];
then
    echo "Would you like to install vim-plug? (Y/n) "
    read -r

    if [[ $REPLY =~ ^[Nn]$ ]];
    then
        echo "This neovim configuration requires vim-plug"
    else
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
fi

echo
echo "Done"
