
arc=`uname -a |cut -d' ' -f 6`

us=/cygdrive/e
cygd=/cygdrive/c

ho=home/itdlz-koer
home=c:/cygwin64/$ho
home2=$cygd/cygwin64/$ho

cHome=$home/.oh-my-zsh/custom

dp=/$ho/django
dt=/$ho/d_test

co=$cHome/$co2
cy=$cHome/$cy2
gi=$cHome/$gi2
zr=$home/.zshrc

dowDir=$cygd/users/itdlz-koer/downloads


function b(){	notepad++ $1 & }


function ci(){
		echo `$1` > /dev/clipboard
}

function co(){
		cat /dev/clipboard
}


function ki(){
		pkill $1;
		echo "Prozesse mit $1 \n"
		ps -ef|grep $1
}



function q(){
	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei 
	
	if [ -f $datei ];then ; rm $datei; echo "$datei wird gelöscht"; fi	
	echo Ende
}


#plugins
alias cb="b $co"
alias -g com="$co"
alias cyb="b $cy"
alias gb="b $gi"
alias zb="b $zr"

#tmux
alias ta="tmux attach"
alias tl="tmux ls"
alias tm=tmux


alias rem='apt-cyg remove';
alias allpkgs='apt-cyg listall'
alias arc="echo $arc"

alias in='apt-cyg install'
alias j='ipconfig'
alias kp='kill python'

alias -g us='$us'
