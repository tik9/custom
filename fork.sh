#! /bin/bash

user=$1
repo=$2
cl=https://github.com/tik9/$2
cl_maintainer=https://github.com/$1/$2
echo $repo
git clone $cl ~
repo=${repo:0:-4}
echo $repo

git remote add upstream $cl_maintainer
git pull upstream master

#~ git checkout -b branch

#~ git push origin branch
