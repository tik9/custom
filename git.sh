function gitman {
    home=/home/tk
    w_home=/mnt/c/Users/User
    elems=(tesseractToMarkdown further-skill-tests)
    repo=(
        # "$w_home/appdata/roaming/code/user"
        #  "$w_home/documents/WindowsPowerShell" 
        #  "$home/.oh-my-zsh/custom"
    )
    # echo ${#repo[@]} vz

    echo -e "\n[*** Start Gitman"

    # $home=\\wsl$\debian/home/tk

    commit='Newest commit'

    # cmd=pull
    # cmd=status
    # remote update
    cmd='add .'
    # cmd="commit -m '$commit'"
    # cmd=push
    # clone https://github.com/tik9/$elem.git $home/$elem

    for elem in ${elems[@]} ; do
    # git "$elem"
    echo $elem
    done


    # for elem in ${repo[@]} ; do
    #     echo done1
    #     # gi_do $elem
    # done

    cm_find=`find $home -maxdepth 1 -not -type f -and -not -name '.*'`

    for dir_home in $cm_find; do
        if [ -d $dir_home/.git ];
        then
            gi_do $dir_home
        fi
    done

    echo -e "\n[*** End Gitman"

}

function gi_do {
    cd $1
    echo -e "\n[***  Git $cmd: " $1
    git $cmd
}

function gtnew {
    repo=further-skill-tests
    dir=$HOME/$repo

    repogro=${repo^}
    echo Repogross $repogro
    exit

    mkdir ~/$repo
    echo "## $repogro" > $dir/README.md

    git init
    git add .
    git commit -m "first commit"
    git remote add origin 
    git push -u origin master
 
    userhost=https://github.com/tik9/$repo.git
    userhost=git@$ip:/gt/$repo
	git remote add origin $userhost
	git remote -v
}
}

function gtbare {
	ip=192.168.178.36
	repo=bilder
 	# ssh $ip \
	# 'dir=/gt/bilder.git
	# description='Beschreibung '
	# mkdir $dir
	# cd $dir
	# touch /gt/$dir/t      
	# echo description > description   
	# git init --bare
	# ls -a $dir'
}

function fork {
    repogit=$1
    repogit=AlexZeitler/posh-git-alias
    user=$(echo $repogit|cut -d'/' -f1)
    repo=$(echo $repogit|cut -d'/' -f2)

    # user=''
    # repo=''

    cl=https://github.com/tik9/$repo.git
    cl_maintainer=https://github.com/$user/$repo.git
    # echo $repo
    git clone $cl ~
    # repo=${repo:0:-4}
    cd $repo
    git remote add upstream $cl_maintainer
    # git pull upstream master

    #~ git checkout -b branch

    #~ git push origin branch
}