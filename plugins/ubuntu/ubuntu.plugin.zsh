dt=/root/django
dp=/home/pi/django


ht=/home/t
dow=$ht/Downloads
is='/run/user/1000/gvfs/mtp:host=%5Busb%3A002%2C034%5D/Interner\ gemeinsamer\ Speicher'
wa='WhatsApp/Media/WhatsApp\ Images'

arc=`uname -a |cut -d' ' -f 14`


function am(){
	amixer get Master |sed -n 5p |cut -d ' ' -f6 |sed -e 's/\[\([1-9][1-9]%\)]/\1/'
}

function amix(){
	if [[ -n $1 ]];then
	arg=10%$1
	else ;echo zero Argumente; arg=30% ; fi;
	amixer -q sset Master $arg
	am
}

function apt-history () {
  case "$1" in
    install)
      zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
      ;;
    upgrade|remove)
      zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
      ;;
    liste)
      zgrep --no-filename '' $(ls -rt /var/log/dpkg*)
      ;;
    *)
      echo " e.g liste - Listet dpkg logs"
      ;;
  esac
}

function as(){
	apt show $1 |less
}


function b(){
	if [[ `lsb_release -i|cut -d: -f2|sed -e 's/[[:blank:]]//'` = Ubuntu ]]; then; /root/src/src_geany-1.28/usr/bin/geany $1 &
	else;vim $1;fi
}


function ci(){
		#`$@` | xclip -selection clipboard
		$1 | xclip -selection clipboard
}

function cj(){
		echo $@ |xclip -selection clipboard
}

function co(){
		xclip -o -selection clipboard
}

function in(){
	apt install $1 -y	
}

function j2(){
	letztes=''
	if [ -z $1 ]; then ; letztes='cut -d. -f4'; fi
	ip addr show wlan0 | sed  -n -E 's/inet ([0-9.]*).*/\1/p'| eval $letztes
}

function kp(){
	(( $USER = pi )) && sudo pkill python3 || pkill python3 
	
}

function ma(){
	zparseopts -A arg b: t: a:
		
	printf "Subject:$2\n${@:3}" |msmtp $1
	tail -n5 ~/.msmtp.log
}


function ml(){
	cd ~/musik
	ffprobe $1 2> >(grep Duration)
	mplayer $1
	cd -  
}
compdef _ml ml


function mp(){
	mupdf $1 &
}



function q(){
	datei=test100.zip
	wget http://speedtest.wdc01.softlayer.com/downloads/$datei --output-document=/dev/null
}

function rem(){
	apt remove $1 -y
}

function schieb(){
	((!$#)) && 	nr=1 || nr=$1
	echo "`ls -t $dow | head -n $nr` \n"

	for i in `seq 1 $nr`
		mv $dow/"`ls -t $dow | head -n1`" .
}

#apt
alias ase='apt search'
alias ali='apt list --installed'
# List available updates only
alias aar='sudo apt autoremove -y'
alias ap='apt policy' 
alias au='sudo apt update'   
alias aud='sudo apt update && sudo apt full-upgrade'
alias aug='sudo apt upgrade' 
alias auu='sudo apt update && sudo apt upgrade'   
alias allpkgs='dpkg --get-selections | grep -v deinstall'
alias pkg="apt list --upgradable "

# cds
alias -g dow=$dow
alias vd=/root/vid

alias a+="amix +"
alias a-="amix -"
alias dow="$dow"
alias gp='gpicview'
alias hi='hibernate'

alias -s pdf=mupdf

alias s='pm-suspend'
alias si='sudo -i'
alias v='ack -iw'
alias wa=$is/$wa
alias z='/etc/init.d/networking restart; i'
