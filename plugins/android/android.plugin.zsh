arc=`uname -a |cut -d' ' -f 13`
lsb=`uname -a |cut -d' ' -f 14`


function ci(){
	termux-clipboard-set $@
}

function co(){
	termux-clipboard-get

}

function install(){
	termux-api play-audio
	termux-setup-storage
}


function q(){

	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei 
	
	if [ -f $datei ];then ; rm $datei; echo "$datei wird gelöscht"; fi	
	echo Ende
}

function inb(){
	printf %s `termux-sms-inbox` | jq '.[0].number' 	
}

function sen(){
	termux-sms-send -n $1 "${@:2}"
}

#cd
alias dt='cd $dtm'
alias mu='cd $dtm'


alias aglu="apt list --upgradable "
alias aguu='apt-get update && apt-get upgrade'      #adg
alias allpkgs="apt list --installed "
alias arc="echo $arc"
alias b="vi"
alias in='apt install'
alias lo="logcat -s 'syslog:*'"
alias rem="apt remove"
alias sd='sshd;ph' 
alias z='play-audio' 


