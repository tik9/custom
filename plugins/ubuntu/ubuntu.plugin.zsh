#ec `hostname`

dt=/root/django
dp=/home/pi/django

ht=/home/t
hu=/home/uk


is='/run/user/1000/gvfs/mtp:host=%5Busb%3A002%2C034%5D/Interner\ gemeinsamer\ Speicher'
wa='WhatsApp/Media/WhatsApp\ Images'

lsb=`lsb_release -i|cut -d: -f2|sed -e 's/[[:blank:]]//'`


function am(){
	amixer get Master |sed -n 5p |cut -d ' ' -f6 |sed -e 's/\[\([1-9][1-9]%\)]/\1/'
}

function amix(){
	if [[ -n $1 ]];then
	arg=10%$1
	else ;echo zero Argumente; arg=30% ; fi;
	amixer -q sset Master $arg
}


function as(){
	apt show $1 |less
}


function b(){
	if [[ $lsb = Ubuntu ]]; then; /root/src/src_geany-1.28/usr/bin/geany $1 &
	else;vim $1;fi
}


function ci(){
		$1 | xclip -selection clipboard
}

function cj(){
		echo $1 |xclip -selection clipboard
}

function co(){
		xclip -o -selection clipboard
}


function dol {

	if [[ `hostname` = uk ]]; then; ho=$hu; else; ho=$ht;fi
	cd $ho/Downloads ; ls -tl
}


function dre {
	if [[ `hostname` = uk ]]; then; ho=$hu; else; ho=$ht;fi
	cd $ho/Downloads
	mplayer -vf rotate=1 `ls -t|head -1`
}


function in(){
	apt install $1 -y	
}

function j2(){
	letztes=''
	if [ -z $1 ]; then ; letztes='cut -d. -f4'; fi
	ip addr show wlan0 | sed  -n -E 's/inet ([0-9.]*).*/\1/p'| eval $letztes
}



function ma(){
	zparseopts -A arg b: t: a:
		
	printf "Subject:$2\n${@:3}" |msmtp $1
	tail -n5 ~/.msmtp.log
}


function ml(){
	mplayer $1
}
#compdef _ml ml


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


function vl {
	ffprobe $1 2> >(grep Duration)
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
alias vd='/root/vid;l'

alias a+="amix +"
alias a-="amix -"
alias gp='gpicview'
alias hi='hibernate'

alias -s pdf=mupdf

alias s='pm-suspend'
alias si='sudo -i'
alias v='ack -iw'
alias wa=$is/$wa
alias z='/etc/init.d/networking restart; i'
