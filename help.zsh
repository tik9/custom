#!/bin/zsh

myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"

hilfedatei=$ZSH_CUSTOM/help.zsh
login_rp=$custom/login_rp
zr=~/.zshrc

bold=`tput bold`
normal=`tput sgr0`

os=$(expr substr $(uname -s) 1 9)

if [ $os != "CYGWIN_NT" ]; then
ip2=`ip addr show wlan0 | grep -Po 'inet \K[\d.]+'`
ipbas=$(echo $ip2 | cut -d . -f -3)
lsb=`lsb_release -i|cut -d: -f2|sed -e 's/^[[:blank:]]*//'`
alias mt='mutt'
else
bi=$(wmic OS get OSArchitecture)
bi2=$(set | findstr ARCH)
echo 2
#alias bi2=$bi2
fi

te2(){
	echo h w
}

he(){
#  echo "${bold}Os: $lsb${normal}"
	echo "\n${bold}Hilfe, os: $os"
	schleife=3
	if [[ $2 != argsleer ]] ;then
		echo "Argumente für $1:"
		schleife=2
	fi
	echo "${normal}"

	for var in ${@:$schleife} ; do
		echo $var
	done
	echo
}


bis(){
	if [ -z $1 ]; then
	he `basename $0` 'Ziel: /m/t/j'  'Ziel: H:M';return;fi
	
	jetzt=$(date +%s)
ziel=$(date -d "$1 $2" +%s)

sleep=$(( $ziel - $jetzt ))

sleep $sleep
}

bi(){
	if [ -z $1 ]; then
	he `basename $0` 'Stunde in Zukunft' Minute;return;fi
	
	target="$1.$2"
cur=$(date '+%H.%M')
while test $target != $cur; do
    sleep 59
    cur=$(date '+%H.%M')
done
}

	
function g(){
	geany $1 &
}

function geo(){
MAPSAPIURL="http://maps.googleapis.com/maps/api/geocode/json"

curl -G -s --data sensor=true --data-urlencode address=$1 "$MAPSAPIURL" -o res.json
/root/jshon  -e results -a -e geometry -e location -e "lat" -u -p -e "lng" -u < res.json
#echo $res.json
}
function i(){
	if [ $os = "Linux" ]; then;ifconfig;else;ipconfig;fi
}


function in(){
	if [ -z "$1" ]; then
	he `basename $0` "Paket"
	return
	fi

	df -h
	if [[ $os = "Linux" ]] ;then
		if [[ $lsb = 'Arch' ]]; then
			echo Arch
			pacman -S --noconfirm $1
	
		else
			apt install -y $1

		fi
	else
		apt-cyg install $1
	fi

	df -h
}

ipd(){
	if [ -z "$1" ]; then
	he `basename $0` "Interface"
	return
	fi
	ip link set $1 down
}

ipu(){
		
	if [ -z "$1" ]; then
	he `basename $0` "Interface"
	return
	fi
		ip link set $1 up
}

function iu(){
	
	if [ -z "$1" ]; then
	he `basename $0` "Interface"
	return
	fi
	
	if [[ $os = "Linux" ]] ;then
		ipd $1;ipu $1
else;echo Kein Linux;fi

i
}

function k(){
if [ -z "$1" ]; then
  he `basename $0` "Prozess für kill"
  return
fi

if [ $os = 'Linux' ];then
kill -9 $1
else
/bin/kill.exe $1
fi

if [ -z "grep $1 =(ps aux)" ];then
echo Prozess gekillt
fi

}

function ka(){

    cnt=$( pr $1 | wc -l)

    echo -e "\nSuche '$1' -- Gefunden:" $cnt Laufende Prozesse
    pr $1

    echo -e \nBeenden der $cnt Prozesse 
    ps aux  |  grep -i $1 |  grep -v grep   | awk '{print $2}' | xargs sudo kill -9
    echo -e "Fertig!\n"

    echo Suche:;pr $1;echo -e "\n"
}

function ki(){
if [ -z "$1" ]; then
  he `basename $0` "Prozess für killall"
  return
fi
	killall $1;
	ps -ef|grep $1;
}
	
function las(){

if [ -z "$1" ]; then
  he `basename $0` "Lautstärke amixer mit 10  	multipliziert"
  return
fi

amixer set PCM $(expr $1 \* 10)%;
}

# login remote shell
function lss(){
if [ -z "$1" ]; then
  he `basename $0` "letztes Oktett von ip " "opt. port"
  return
fi

        ssh $2 $ipbas.$1 
}


function mp(){
if [ -z "$1" ]; then
  he `basename $0` "Zeit" "interface (op.)"
  return
fi

	sleep $1;killall mplayer;ipd $2
}

ms(){
if [ -z "$1" ]; then
  he `basename $0` "Tab."
  return
fi

mysql -uroot d -e "select*from app1_$1"
}


msde(){ mysql -uroot d -e "describe app1_$1"}


function mup(){
if [ -z "$1" ]; then
  he `basename $0` "Datei"
  return
fi
	mupdf $1 &
}


pi(){
	ping `if [ $os = CYGWIN_NT ]; then
 echo '-n 4';else;echo -c 4;fi; google.de`
}


function pli(){
if [ "$1" = -h ]; then
  he `basename $0` "argsleer" "Installierte Pakete zeigen, nur Linux"
  return
  
fi

if [[ $os = "Linux" ]] ;then

	if [[ $lsb = 'Arch' ]]; then
		pacman -Qeq |less
	else
		dpkg -l	|less
	fi
fi
}

function pr(){
if [ -z "$1" ]; then
  he `basename $0` "grep mit 'prozess Substitution'" "Prozess"
  return
  
fi
	grep $1 =(ps aux)
}

function re(){
  echo "${bold}Os: $lsb${normal}"

if [ -z "$1" ]; then
  he `basename $0` "Löschen!" "Paket"
  return
  
fi

if [ $os = "CYGWIN_NT" ]; then;apt-cyg remove $1;else
if [[ $lsb == 'Arch' ]] ;then;pacman -R --noconfirm $1
	else;apt-get autoremove $1;fi
fi; 
}

function sc2(){
if [ -z "$1" ]; then
  he `basename $0` Basis:$ipbas Datei "letztes Oktett" Zielordner "(port)"
  return
fi
#echo a2 $3
	scp  $1 $ipbas.$2:$3 
}


function schieb(){
	if [[ $os = "Linux" ]] ;then
		ver='/home/t/Downloads/';
	else
		ver='/cygdrive/c/Users/tk/Downloads/'
	fi

	if [ -z "$1" ]; then
	  he2 `basename $0` "Ziel"
	  return
	fi
	

	ziel=$1
	if [ $1 = 'r' ];then
		ziel='/root'
	fi
	
	ls -t $ver
	mv "$ver`ls -t $ver | head -n1`" $ziel
	echo Inhalt von $ziel
	ls $ziel
}


function sho(){

if [ -z "$1" ]; then
  he `basename $0` "Paket"
  return
fi

if [ $os = "CYGWIN_NT" ]; then
apt-cyg show `echo $1`;else ;if [[ $lsb == 'Arch' ]] ;then;pacman -Ss $1 ;else;apt-cache show $1 ;fi;fi;
}

function t(){

if [ -f test500.zip ];then ; lö test500.zip;fi	
	wget http://speedtest.wdc01.softlayer.com/downloads/test500.zip `if [ $os = "Linux2" ]; then ; echo --output-document=/dev/null;fi`

}

function u(){
if [ "$1" = -h ]; then
  he `basename $0` "argsleer" "Upgrade machen"
  return
  
fi	

if [[ $lsb == 'Arch' ]] ;then
		pacman -Syu
	else
apt-get upgrade	
apt-get dist-upgrade	
fi	
}

 
# alias
alias a='alias|grep'
alias am='alias -m'
alias ua='unalias'

# betriebssystem
alias lsb="echo $lsb"
alias os="echo $os"
alias os2='uname -a'
alias pa='echo $path'


#cd's
alias da="cd ~/django"
alias mu="cd ~/musik"
alias o='cd ~/.oh-my-zsh/custom'
alias oh='cd ~/.oh-my-zsh'

#curl
alias cu='curl'
alias cl1='cu localhost'
alias cl2='cu localhost:8000'
alias cud='cu http://django-tjava.rhcloud.com/de/admin/'


#Dateiops
alias lö="rm -rf"
alias md="mkdir -p"
alias mo="chmod 700"
alias to='touch'

#Dateisystem
alias pt='parted'
alias mn='mount'
alias um='umount'

#Dict
alias wl="echo Dict.;dict -D"
alias w="dict -d fd-eng-deu"
alias w2="dict"

#Download
alias au="git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions"


# Editoren
alias ab='abiword'
alias n='notepad++'
alias v="vim"


# Energie
alias hi='hibernate'
alias rest='reboot'
alias s='pm-suspend'

#expect
alias et='expect'
alias r=sr
alias sr='expect ~/.oh-my-zsh/custom/login_rp'


# Hilfe
alias -g h="--help"
alias -g hd="$hilfedatei"
alias hl="le $hilfedatei"
alias hn="n $hilfedatei"

# Konsole
alias hs='\history -E'
alias she='echo $0'
alias st='stty -a'
alias tt='temp=$(tty) ; echo ${temp:5}'


# netzwerk

alias ie='iwgetid -r'
alias ie2='iwconfig 2>&1 | grep ESSID'
alias ip2="echo $ip"
alias iw='iwlist wlan0 scan'
alias nm="nmap -sP $(echo $ipbas).1/24"
alias pi="ping google.de `if [ $os = CYGWIN_NT ]; then
 echo '-n 4';else;echo -c 4;fi`"


# package mgt.
alias acl='apt-cyg listall'
alias acl2='cygcheck'
alias ag='apt-get'
alias pm2="pacman -S"
alias up='ag update'


# ps
alias -g ba="bash"
alias ksl="ki sleep"
alias pr2='ps -ef|grep'
alias psl="pr sleep"
alias pmp="pr mplayer"
alias pse="ps -eo pid,comm,cmd,start,etime | grep -i"
alias psp="ps -p"
alias pts="ps -ef|grep pts/"
alias sl="sleep"
alias wh="who"

# Radio
alias ml="mplayer "

alias b="ml http://80.237.156.8:8120" # landsberg int.
alias kl="ml -playlist http://minnesota.publicradio.org/tools/play/streams/classical.pls"
alias mpr="ml -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls"
alias oe="ml http://194.232.200.156:8000" #oe3

#rhc
alias rhr='rhc app-restart'
alias rhs='rhc ssh'


#user
alias us="echo $USER"


alias ad='echo t@tk1.it|cli'
alias ad2='echo 015739598220 timo.koerner@hof-university.de dkoerner@konzertagentur-koerner.de'
alias c='cat'
alias le='less'
alias cl='xclip -sel clip'
alias cp='cp -r'
alias dt='date +"%T"'
alias d='declare -f'
alias dh='df -h'
alias du='du -h'
alias e="exec zsh"
alias ec="echo"
alias eh="ec hw"
alias ex="exit"
alias f="find / -name"
alias f2="find -name"
alias ge="grep"
alias -g gr="|grep"
alias ha='halt'
alias ho='echo $(hostname)'
alias iban='DE637215 0000 00 5052 4271'
alias lag='amixer get PCM'
alias lsh="ls -halt --full-time"
alias m='man'
alias msd='mysql -uroot d'
alias mst='mysql -uroot d -e "show tables"'
alias mkdir='mkdir -p'
alias p1='echo $1'
alias ppi='ps -o ppid= -p'
alias prp='pgrep'
alias r=sr
alias sc="systemctl"
alias so="sort"
alias sou="source"
alias sr="expect $login_rp"
alias srg="g $login_rp"
alias -g ta='|tail'
alias te='if [ $os != "CYGWIN_NT" ]; then;terminator &;else; mintty;fi'
alias tp='top'
alias tr='tree'
alias -g ve="--version"
alias wp='chmod 777 -R .'
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'
alias zg='g $zr'
alias zv='v $zr'

echo "$0 aktualisiert von $$"
