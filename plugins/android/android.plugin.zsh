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
	printf %s `termux-sms-inbox` | jq '.[0].number' 	
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
	nr=`sed -e 's/^"//' -e 's/"$//' <<<\`$1\`` 
	echo alt: `$1`, neu: $nr

	termux-sms-send -n $nr "${@:2}"
}


function z(){
	 cd $dm 
	 play-audio $1
}
compdef _play_audio z


#cd
alias mu='cd $dtm'


alias aglu="apt list --upgradable "
alias aguu='apt-get update && apt-get upgrade'      #adg
alias allpkgs="apt list --installed "
alias arc="echo $arc"
alias b="vi"
alias dtm='$dtm;l'
alias in='apt install'
alias lo="logcat -s 'syslog:*'"
alias rem="apt remove"
alias sd='sshd;ph' 
alias tsi='termux-sms-inbox' 
alias tsh='termux-sms-send -help' 
alias ts='termux-sms-send' 
#alias z='play-audio' 


