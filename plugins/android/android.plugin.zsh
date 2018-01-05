arc=`uname -a |cut -d' ' -f 13`
lsb=`uname -a |cut -d' ' -f 14`

function q(){

	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei 
	
	if [ -f $datei ];then ; rm $datei; echo "$datei wird gelöscht"; fi	
	echo Ende
}

function te(){
	printf %s `termux-sms-inbox` | jq '.[0].number' 	
}

#cd
alias dt='cd $dtm'
alias p='play-audio'
alias mu='cd $dtm'


alias agr='sudo apt-get remove'
alias aglu="apt list --upgradable "
alias aguu='apt-get update && sudo apt-get upgrade'      #adg
alias allpkgs="apt list --installed "
alias arc="echo $arc"
alias b="vi"
alias in='apt install'
alias lo="logcat -s 'syslog:*'"
alias p='play-audio'
alias rem="apt remove"

