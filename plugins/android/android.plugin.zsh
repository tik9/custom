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


function j2(){
	letztes=''
	if [ -z $1 ]; then ; letztes='cut -d. -f4'; fi
	ip addr show wlan0 | sed  -n -E 's/inet ([0-9.]*).*/\1/p'| eval $letztes
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

function vid_sc {
		scp $ds/DCIM/Camera/"*" root@$ir:/root/django/media 
}


function z(){
	 cd $mu
	 play-audio $1
}
compdef _play_audio z


#cd
alias ds='$ds; l'
alias dc='$ds/DCIM/Camera; l'
alias mu='$mu; l'
alias wi='$wa/WhatsApp\ Images; l'
alias wi='$wa/WhatsApp\ Video; l'

#apt
alias ap="apt policy"
alias as="apt show"
alias ase="apt search"
alias aglu="apt list --upgradable "
alias aguu='apt-get update && apt-get upgrade'
alias pkg="apt list --installed "
alias in='apt install'
alias rem="apt remove"

alias ab='b $a'
alias ic='ifconfig'
alias km='ki play-audio'
alias sd='sshd; ph; echo Letztes Oktett ;j2' 
alias tb="termux-battery-status|sed -n 's/\"percentage\": \([0-9][0-9]\),/\1%/p'"
alias ts=termux-sms-send 
alias v='vi'
alias zr='vi $zr' 
