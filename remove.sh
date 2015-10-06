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
for var in "${mydotfiles[@]}"
do
	if [ -h ~/${var} ]
	then
    rm ~/${var}
		printf "${var} link is deleted \n"
	else
		printf "${var} is not a link or doesn't exist \n"
	fi
done

read -p "Do you want to remove Vim Bundle Directory? [y/N]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rm -rf ~/.vim/bundle
	printf "removed Vim Bundle Directory \n"
fi

read -p "Do you want to remove the Fonts Directory? [y/N]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rm -rf ~/.fonts
	printf "removed Fonts \n"
fi


unset mydotfiles
unset var
