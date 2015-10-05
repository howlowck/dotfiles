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

read -p "What is your Dotfile Directory? [.dotfiles] " dotfiledir 
dotfiledir=${dotfiledir:-.dotfiles}

printf "\n /*** INSTALLING FONTS ***/ \n"
git clone https://github.com/powerline/fonts ~/.fonts
bash ~/.fonts/install.sh
printf "\n !!! Don't forget to set your fonts in your terminal !!! \n"

printf "\n /*** INSTALLING VIM Bundle ***/ \n"
if [ -d ~/.vim/bundle ]
then
	printf "bundle already exists! \n"
else
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	printf "\n !!!  remember to run :PluginInstall in vim !!! \n"
fi

printf "\n /*** INSTALLING Dotfiles ***/ \n"

for var in "${mydotfiles[@]}"
do
	if [ -a ~/${var} ]
	then
		printf "${var} already exists! \n"
	else
		ln -s ${dotfiledir}/${var} ~/
		printf "${var} is linked to ~ \n"
	fi
done

printf "\n /*** OK DONE!!! ***/ \n\n"

unset dotfiledir
unset mydotfiles
unset var
