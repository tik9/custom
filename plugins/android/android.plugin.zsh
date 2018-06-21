arc=`uname -a |cut -d' ' -f 13`
lsb=`uname -a |cut -d' ' -f 14`

dt=$th/django/
zr=$th/.zshrc


function ci(){
	termux-clipboard-set `$@`
}

function cj(){
	termux-clipboard-set $@
}


function co(){
	termux-clipboard-get

}

function install(){
	termux-api play-audio
	termux-setup-storage
}


function nr(){
	echo `termux-sms-inbox | jq -r '.[0].number'`
	#echo `sed -e 's/^"//' -e 's/"$//' <<<$nr` 
}

function int_trap(){ echo download ende }

function q(){
	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei 
	
	if [ -f $datei ];then ; rm $datei; echo "$datei wird gelöscht"; fi	
	echo Ende
}


function se(){
	echo `nr`
	termux-sms-send -n `nr` "$@"
}

function se2(){
	termux-sms-send -n $1 "${@:2}"
}


function z(){
	 cd $mu
	 play-audio $1
}
compdef _play_audio z


#cd
alias mu='$mu'
alias -g ds='$ds'
alias -g dc='$ds/DCIM/Camera'

#apt
alias ap="apt policy"
alias as="apt show"
alias ase="apt search"
alias aglu="apt list --upgradable "
alias aguu='apt-get update && apt-get upgrade'
alias pkg="apt list --installed "
alias in='apt install'
alias rem="apt remove"

alias ic='ifconfig'
alias km='ki play-audio'
alias sd='sshd; ph; echo Letztes Oktett ;j2' 
alias tb="termux-battery-status|sed -n 's/\"percentage\": \([0-9][0-9]\),/\1%/p'"
alias ts=termux-sms-send 
alias v='vi'
alias zr='vi $zr' 
