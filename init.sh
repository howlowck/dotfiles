#!/bin/bash
mydotfiles=(
	'.aliases'
	'.bash_profile'
	'.bash_prompt'
 	'.functions'
 	'.git-prompt.sh'
	'.gitconfig'
	'.gitignore_global'
	'.path'
	'.vimrc'
)

cd ~

if [ -d ~/.vim/bundle ]
then
	printf "bundle already exists! \n"
else
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	printf "\n remember to run :PluginInstall in vim \n"
fi



for var in "${mydotfiles[@]}"
do
	if [ -a ${var} ]
	then
		printf "${var} already exists! \n"
	else
		ln -s .dotfiles/${var} ./
	fi
done

unset mydotfiles
