arc=`uname -a |cut -d' ' -f 13`
lsb=`uname -a |cut -d' ' -f 14`

dt=$th/django/


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
	nr=`termux-sms-inbox | jq '.[0].number'`
	echo `sed -e 's/^"//' -e 's/"$//' <<<$nr` 
}

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
alias mu='$mu; l'
alias -g ds='$ds; l'

#apt
alias acs="apt-cache show"
alias aglu="apt list --upgradable "
alias aguu='apt-get update && apt-get upgrade'
alias allpkgs="apt list --installed "
alias in='apt install'
alias rem="apt remove"


alias km='ki play-audio'
alias kp='kill python3'
alias sd='sshd; ph; echo Letztes Oktett ;j' 
alias tb="termux-battery-status|sed -n 's/\"percentage\": \([0-9][0-9]\),/\1%/p'"
alias ti='termux-sms-inbox | less'
alias ts=termux-sms-send 
alias tsh='termux-sms-send -help' 
