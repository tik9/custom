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