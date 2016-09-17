#! /usr/bin/env bash

# print status local repertory for remote repertory
# shell the first args is directories that you need exe the git command

#git status
function echo_git_status(){
	cd $GIT_DIRECTORY
	git status
}

# 
function query_input_add() {
	echo ==== are you confirm to add? y or n? ====

	while [ 1 == 1 ] 
	do
	read answer
	if [ “${answer}” == “y” ]; then
		#echo ${answer}
		git add .
		break;
	elif [ “${answer}” == “n” ]; then	
		echo ==== sorry! your answer is ‘${answer}’, so we don’t solve ====
		exit 1
	else 
		echo ==== Please input again ‘y’ or ’n’ ====
	fi	
	done

	echo ==== git add it’s done ====
}

#git commit
function echo_git_commit(){
	echo ==== now input your ‘message’ for commit ====
	read message
	git commit -m ‘${message}’
	echo ==== git commit it’s done ====
}

#git pull 
function echo_git_pull(){
	echo ==== now input your remote repertory and which branch. eg: origin master ====
	read var1 var2
	git_remote_repertory_name=$var1
	git_branch_name=$var2
	echo ==== git pulling ! wait a minute====
	git pull $var1 $var2
	echo ==== git pull it’s done ====
}

#git push 
function echo_git_push(){
	echo ==== now push to $git_remote_repertory_name $git_branch_name ====
	git pull $git_remote_repertory_name $git_branch_name
	echo ==== git push it’s done ====
}

#exe
function solve(){
	echo_git_status
	# query do you confirm to the change add the local repertory
	query_input_add

	# query what message for commit
	echo_git_commit

	# pull the resource from remote repertory
	echo_git_pull

	# push the change to remote repertory
	echo_git_push

	echo ==== Finish the easy git operation ====
}

git_remote_repertory_name=
git_branch_name=
GIT_DIRECTORY=$1

echo “git $1”

#main
solve
