arc=`uname -a |cut -d' ' -f 13`
lsb=`uname -a |cut -d' ' -f 14`
ipadr=`ip addr show wlan0 | sed -n -E 's/^[ ]*inet ([0-9.]*).*/\1/p'`


function i {
	if [[ `echo $ipadr | cut -f -3 -d .` = 192.168.0 ]]; then
	
		ssh root@$ir
	else
		irr=`curl -s ipinfo.io/ip`
		ec $irr
		ssh root@$irr
	fi
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
	termux-sms-send -n `nr $1 | sed -e 's/ //g' ` "${@:2}"
}

function se2(){
	termux-sms-send -n $1 "${@:2}"
}

function vid_sc {
		scp $ds/DCIM/Camera/"*" root@$ir:/root/django/media 
}


function z(){
	 cd $mua
	 play-audio $1
}
compdef _play_audio z


#cd
alias ds='$ds; l'
alias bca='$bca; l'
alias mu='$mu; l'
alias bwa='$bwa;l'
alias vwa='$wa/WhatsApp\ Video; l'

#apt
alias aar='apt autoremove -y'
alias ali="apt list --installed "
alias ap="apt policy"
alias as="apt show"
alias ase="apt search"
alias auu='apt-get update && apt-get upgrade'
alias in='apt install'
alias pkg="apt list --upgradable "
alias re="apt remove"

#ips
alias j='ec $ipadr'
alias j2='ec $ipadr|cut -d. -f4'


alias ab='b $a'
alias ic='ifconfig'
alias mua=$mua
alias sd='sshd; ph; echo Letztes Oktett ;j2' 
alias tb="termux-battery-status|sed -n 's/\"percentage\": \([0-9][0-9]\),/\1%/p'"
alias ti=termux-sms-inbox 
alias ts=termux-sms-send 
alias v='vi'
alias zr='vi $zr' 
