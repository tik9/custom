zHome=.oh-my-zsh/custom
pts=pty
lsb=cygwin

home2=c:/cygwin64/home/itdlz-koer
db=$home2/$zHome/$db2
gb=$home2/$zHome/$gb2
gb3=$home2/$zHome/$gb4
cb=$home2/$zHome/$cb2
lb=$home2/$zHome/login_rp
pb=$home2/$zHome/$pb2
rb=$home2/$zHome/$rb2

bim=$(wmic OS get OSArchitecture)
arc=`uname -a |cut -d' ' -f 6`
dowDir=/cygdrive/C/Users/itdlz-koer/Downloads
mteDir=$home2/mte/my-app

zr=$home2/.zshrc

function b(){	
		notepad++ $1 &
}

function sho(){

		apt-cyg show `echo $1`;
}

alias ter='if [ $os != "CYGWIN_NT-6.1" ]; then;terminator &;else; mintty;fi'

alias acl='apt-cyg listall'
alias in='apt-cyg install'
alias op='cygstart'
alias rem='apt-cyg remove';
