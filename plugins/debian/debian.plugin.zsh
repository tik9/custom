#ec `hostname`

dt=/root/django
dp=/home/pi/django

ht=/home/t
hu=/home/uk

dow=$ht/Downloads

ipadr=`ip addr show wlan0 | sed  -En 's/    inet ([0-9.]*).*/\1/p'`
ipadre=`ip addr show eth0 | sed  -En 's/    inet ([0-9.]*).*/\1/p'`

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

function cb {
	convert $1 -resize 50% $1
	identify $1
}


function cv {
	#scp -P8022 $im:$ds/DCIM/Camera/"*" root@$il:/root/vid 

	#ffmpeg -i `ls -t|head -1`  -strict -2 ${ echo ${ ls -t | head -1 } | sed 's/\.[^.]*/.mp4/'}
	
	ffmpeg -i $ak  -strict -2 `echo $akt | sed 's/\.[^.]*/.mp4/'`
	ls -lt
	}

function cop {
		xclip -o -selection clipboard
}


function dol {

	if [[ `hostname` = uk ]]; then; ho=$hu; else; ho=$ht;fi
	cd $ho/Downloads ; ls -tl
}


function dre {
	#if [[ `hostname` = uk ]]; then; ho=$hu; else; ho=$ht;fi
	#cd $ho/Downloads
	if [[ -n $1 ]]; then
	dat=$1; else
	dat=`ls -t|head -1`
	fi
	mplayer -vf rotate=1 $dat
}


function i {
	if [[ `echo $ipadr | cut -f -3 -d .` = 192.168.0 ]]; then
		ssh root@$ir
	else
		ec $irr
		ssh root@$irr
	fi
}

function i2 {
	irc=`curl -s ipinfo.io/ip`
	echo curl: $irc - alt: $irr
	sed -i "s/\(irr=\).*/\1$irc/" $co
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


function mp(){
	mupdf $1 &
}


function q(){
	datei=test100.zip
	wget http://speedtest.wdc01.softlayer.com/downloads/$datei --output-document=/dev/null
}

function re {
	apt remove $1 -y
}

function schieb {
	echo "`ls -t $dow | head -n 1` \n"

	for i in `seq 1 $nr`
		mv $dow/"`ls -t $dow | head -n1`" .
	ls
}


function vl {
	ffprobe $1 2> >(grep Duration)
}


function z2(){
	 cd $mu
	 mplayer $1
}
compdef _play_audio_Ub z2


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

# ips
alias j='ec $ipadr'
alias ej='ec $ipadre'
alias j2='ec $ipadr|cut -d. -f4'

alias a+="amix +"
alias a-="amix -"
alias gp='gpicview'
alias hi='hibernate'

alias -s pdf=mupdf
alias -s mp4=mplayer

alias s='pm-suspend'
alias si='sudo -i'
alias up='upload  `ls -t|head -1` vid $ir  '
alias v='ack -iw'
alias wa=$is/$wa
alias z='/etc/init.d/networking restart; we'
