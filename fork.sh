verz=~/lt
cl=https://github.com/tik9/repo
cl_maintainer=https://github.com/account/repo

git clone $cl $verz 
cd $verz

git remote add upstream $cl_maintainer
git pull upstream master


#~ git checkout -b branch

#~ git push origin branch
