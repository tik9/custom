arc=`uname -a |cut -d' ' -f 6`

zHome=.oh-my-zsh/custom

home2=c:/cygwin64/home/itdlz-koer
cb=$home2/$zHome/$cb2
cyb=$home2/$zHome/$cy2
db=$home2/$zHome/$db2
gb=$home2/$zHome/$gb2
gb3=$home2/$zHome/$gb4
lb=$home2/$zHome/login
ob=$home2/ZSH/oh-my-zsh.sh
pb=$home2/$zHome/$pb2
rb=$home2/$zHome/$rb2

bim=$(wmic OS get OSArchitecture)

dowDir=/cygdrive/C/Users/itdlz-koer/Downloads
mteDir=$home2/mte/

zr=$home2/.zshrc

function b(){	
		notepad++ $1 &
}


function ci(){
		echo $1 > /dev/clipboard
}

function co(){
		cat /dev/clipboard
}


function pd(){

	cygcheck -c|less
}

function q(){
	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei 
	
	if [ -f $datei ];then ; rm $datei; echo "$datei wird gelöscht"; fi	
	echo Ende
}

function sho(){

		apt-cyg show `echo $1`;
}


alias agr='apt-cyg remove';
alias allpkgs='apt-cyg listall'
alias arc="echo $arc"

#plugins
alias cb="b $cb"
alias -g com="$cb"
alias cyb="b $cyb"

alias in='apt-cyg install'
alias lb="b $lb"
alias ob="b $ob"
alias op='cygstart'
alias so='cp /cygdrive/c/Users/itdlz-koer/AppData/Roaming/Microsoft/Bibliography/sources.xml $un'
alias ter='mintty'
