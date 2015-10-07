#!/bin/bash
mydotfiles=(
	'.aliases'
	'.bash_profile'
	'.bash_prompt'
 	'.functions'
	'.gitconfig'
	'.gitignore_global'
	'.path'
	'.vimrc'
)

read -p "What is your Dotfile Directory? [.dotfiles] " dotfiledir
dotfiledir=${dotfiledir:-.dotfiles}

read -p "Do you want to install fonts? [y/N]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
   printf "\n /*** INSTALLING FONTS ***/ \n"
   git clone https://github.com/powerline/fonts ~/.fonts
   bash ~/.fonts/install.sh
   printf "\n !!! Don't forget to set your fonts in your terminal !!! \n"
fi

read -p "Do you want to install Vim Bundle? [y/N]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
   printf "\n /*** INSTALLING VIM Bundle ***/ \n"
   if [ -d ~/.vim/bundle ]
   then
	   printf "bundle already exists! \n"
   else
	   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	   printf "\n !!!  remember to run :PluginInstall in vim !!! \n"
   fi
fi

printf "\n /*** INSTALLING Dotfiles ***/ \n\n"

read -p "Would you like to copy the files to home? (or Symlink?) [y=copy/N=Symlink]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	for var in "${mydotfiles[@]}"
	do
		if [ -a ~/${var} ]
		then
			printf "${var} already exists! \n"
		else
			cp ${dotfiledir}/${var} ~/
			printf "${var} is copied to ~ \n"
		fi
	done
else
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
fi

printf "\n /*** OK DONE!!! ***/ \n\n"

unset REPLY
unset dotfiledir
unset mydotfiles
unset var
