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

function gtfork {
    repogit=$1
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