arc=`uname -a |cut -d' ' -f 13`
lsb=`uname -a |cut -d' ' -f 14`


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
alias -g mu='$mu'
alias -g ds='$ds'

#apt
alias acs="apt-cache show"
alias aglu="apt list --upgradable "
alias aguu='apt-get update && apt-get upgrade'
alias allpkgs="apt list --installed "
alias in='apt install'
alias rem="apt remove"


alias arc="echo $arc"
alias b=vi
alias km='ki play-audio'
alias sd='sshd; ph' 
alias ti=termux-sms-inbox
alias ts=termux-sms-send 
alias tsh='termux-sms-send -help' 
