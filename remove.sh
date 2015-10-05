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

rm -rf ~/.vim/bundle
printf "removed Vim Bundle Directory \n"

rm -rf ~/.fonts
printf "removed Fonts \n"

unset mydotfiles
unset var
