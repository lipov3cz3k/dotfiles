#!/bin/bash

root_dotfiles=( ".bashrc"
                ".bash_profile"
                ".bash_aliases"
                # ".bash_logout"
                ".inputrc"
                ".gitconfig"
                ".tmux.conf")

for file in "${root_dotfiles[@]}"
do
    ln -is $HOME/.dotfiles/$file.symlink $HOME/$file
done


ln -is $HOME/.dotfiles/.ssh/config.symlink $HOME/.ssh/config
ln -is $HOME/.dotfiles/.config/mc/ini.symlink $HOME/.config/mc/ini
ln -is $HOME/.dotfiles/.config/htop/htoprc.symlink $HOME/.config/htop/htoprc
ln -is $HOME/.dotfiles/vs-code/settings.json.symlink $HOME/.vscode-server/data/Machine/settings.json
