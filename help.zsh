#!/bin/zsh
tim='https://github.com/gitaarik/django-admin-relation-links'

# schriftfarbe autocomplete fg8 default
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=2'
alias -g zsha='git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions'

hilfedatei=$ZSH_CUSTOM/help.zsh
idrs=~/.ssh/id_rsa.pub 
login=$ZSH_CUSTOM/login_rp
zr=~/.zshrc

bold=`tput bold`
normal=`tput sgr0`

os=$(expr substr $(uname -s) 1 9)
os2=`uname -a |cut -d' ' -f 14`

if [[ $os = "Linux" ]] ;then;if [[ $lsb = 'Arch' ]]; then;pm='pacman';elif [[ $lsb = Ubuntu ]];then;pm='apt-get'; fi;else;pm='apt-cyg';fi

alias pm='ec $pm'

if [ $os != "CYGWIN_NT" ]; then

	lsb=`lsb_release -i|cut -d: -f2|sed -e 's/^[[:blank:]]*//'`

else
	bi=$(wmic OS get OSArchitecture)
	bi2=$(set | findstr ARCH)
fi

upd(){
	mysql -uroot d -e "select table_schema as DatabaseName,
  table_name,
  update_time as letzteAktual
from information_schema.tables
where update_time > '2017-04-18'
order by update_time asc"
}

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

	for var in ${@:$schleife} ; do; echo $var;done
}

_alarm() {
  ( speaker-test --frequency $1 --test sine )&
  pid=$!;sleep ${2}s
  kill -9 $pid
}

function aur(){
if [ $os = "Linux" ]; then;
if [[ $lsb = 'Arch' ]]; then;
pacman -Rs -
else
apt autoremove;
fi;else
apt-cyg remove;fi
}


	
function g(){
if [[ $os = "Linux" ]] ;then
	geany $1 &
	else;notepad++ $1 &;fi
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
			     if [[ $lsb = 'Arch' ]]; then; pacman -S --noconfirm $1
                else;apt-get install -y $1;fi
	else
		apt-cyg install $1
	fi

	df -h
}


function ipbas {
	if [ -z "$1" ]; then
		he `basename $0` "Zeigt interne ip-Adresse\n Argument 1: Netzwerk Interface (wlan0 oder eth0)"
	return
	fi
	
	ip=`ip addr show $1 | grep -Po 'inet \K[\d.]+'`
	ipbas=$(echo $ip | cut -d . -f -3)	
	echo Basis Ip $ipbas
}


function ipd(){
	if [ -z "$1" ]; then
	he `basename $0` "Interface"
	return
	fi
	ip link set $1 down
}

function ipu(){
		
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


function ki(){
if [ -z "$1" ]; then
  he `basename $0` "Prozess für killall"
  return
fi
	killall $1;
	ps -ef|grep $1;
}

killscreens () {
    screen -ls | cut -d. -f1 | awk '{print $1}' | xargs kill
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
  he `basename $0` "Interface" "letztes Oktett von ip " "opt. port"
  return
fi
	ipbas $1

        ssh $3 $ipbas.$2 
}


function mp(){
if [ -z "$1" ]; then
  he `basename $0` "Datei"
  return
fi
	mupdf $1 &
}

function mss(){
	if [ -z "$1" ]; then
	  he `basename $0` "Tab."
	  return
	fi

	mysql -uroot d -e "select*from app1_$1"
}


function msde(){ mysql -uroot d -e "describe app1_$1"}


function nm(){
	if [ -z "$1" ]; then
	  he `basename $0` "Interface"
	  return
	fi
ipbas $1
	nmap -sP $ipbas.1/24
}
	

function pd(){
if [ "$1" = -h ]; then
  he `basename $0` "argsleer" "Installierte Pakete zeigen, nur Linux"
  return
fi

if [[ $os = "Linux" ]] ;then
if [[ $lsb = 'Arch' ]]; then;pacman -Qeq |less
else
	dpkg -l	|less;
	fi;else cygcheck -c|less;fi
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
fi
}

function sc2(){
if [ -z "$1" ]; then
  he `basename $0` Basis:$ipbas 1.Interface 2.Datei "3.letztes Oktett" 4.Zielordner (5.user) "(6.port)"
  return
fi
ipbas $1

user=$5
if [ -z $5 ];user=root

scp  $2 $user@$ipbas.$3:$4 
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
	if [ $1 = 'r' ];then;ziel='/root';fi
	
	ls -t $ver
	mv "$ver`ls -t $ver | head -n1`" $ziel
	echo Inhalt von $ziel;ls $ziel
}


function sho(){

if [ -z "$1" ]; then
  he `basename $0` "Paket"
  return
fi

if [ $os = "CYGWIN_NT" ]; then
apt-cyg show `echo $1`;else ; if [[ $lsb == 'Arch' ]] ;then;pacman -Ss $1 ;else;apt-cache show $1|less;fi;fi;
}

function si(){
if [ -z "$1" ]; then
  he `basename $0` "Zeit in Minuten bevor Ruhezustand"
  return
fi
	sleep $1m; hibernate 
}


function t(){

datei=test100.zip
if [ -f $datei ];then ; rm $datei;fi	
	wget http://speedtest.wdc01.softlayer.com/downloads/$datei `if [ $os2 != "Android" ]; then ; echo --output-document=/dev/null;fi`

}

function u(){
if [ "$1" = -h ]; then
  he `basename $0` "argsleer" "Upgrade machen"
  return
  
fi	

apt-get upgrade	
apt-get dist-upgrade	
}

 
# alias
alias a='alias|grep'
alias am='alias -m'
alias ua='unalias'

# betriebssystem
alias lsb="echo $lsb"
alias os="echo $os"
alias os2='echo $os2'
alias pa='echo $path'


#cd's
alias da="cd ~/django"
alias cg="cd ~/git"
alias dp="cd ~/p"
alias js="cd ~/JavaSe"
alias jj="cd ~/JavaSe/lib/src/main/java"
alias ma="cd ~/MyA"
alias mu="cd ~/musik"
alias o='cd ~/.oh-my-zsh/custom'
alias oh='cd ~/.oh-my-zsh'
alias un='cd ~/uni'
alias sp='cd ~/git/ssp/FussballDB/'

#curl
alias cu='curl'
alias cl2='cu localhost'
alias cl='cu localhost:8000'
alias cud='cu http://django-tjava.rhcloud.com/de/admin/'


#Dateiops
alias cp='cp -r'
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
alias v="vim"


# Energie
alias hi='hibernate'
alias rest='reboot'
alias s='pm-suspend'

#expect
alias et='expect'
alias log='g $login'

alias r=sr
alias sr='expect $login'


# Hilfe
alias -g h="--help"
alias -g hd="$hilfedatei"
alias hg="g $hilfedatei"
alias hl="le $hilfedatei"

# Konsole
alias hs='\history -E'
alias se='echo $0'
alias st='stty -a'
alias tt='temp=$(tty) ; echo ${temp:5}'

#mysql
alias me='mysql -uroot d -e'
alias msd='mysql -uroot d'
alias ms='mysql d'
alias mst='mysql -uroot d -e "show tables"'


# netzwerk
alias dh='dhclient'
alias ie='iwgetid -r'
alias ie2='iwconfig 2>&1 | grep -i ESSID'
alias ip2="echo $ip"
alias iw2='iwlist wlan0 scan'
alias mip="echo $(dig +short myip.opendns.com @resolver1.opendns.com)"
alias p="ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de"


# package mgt.
alias acl='apt-cyg listall'
alias acl2='cygcheck'
alias ag='apt-get'

alias de="apt-cache depends"
alias der="apt-cache rdepends"
alias up='ag update'


# ps
alias -g ba="bash"
alias ks="ki ssh"
alias ksl="ki sleep"
alias pr2='ps -ef|grep'
alias psl="pr sleep"
alias pmp="pr mplayer"
alias pn="pr ngro"
alias ph="pr ssh"
alias psp="ps -p"
alias sl="sleep"
alias wh="which"

# Radio
alias ml="mplayer "

alias b="ml http://80.237.156.8:8120" # landsberg int.
alias brh="ml http://br-mp3-brheimat-m.akacast.akamaistream.net/7/738/326703/v1/gnl.akacast.akamaistream.net/br_mp3_brheimat_m"
alias br="ml http://br-mp3-bayern3-m.akacast.akamaistream.net/7/442/142692/v1/gnl.akacast.akamaistream.net/br_mp3_bayern3_m"
alias kl="ml -playlist http://minnesota.publicradio.org/tools/play/streams/classical.pls"
alias mpr="ml -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls"
alias oe="ml http://194.232.200.156:8000" #oe3


alias ad='echo t@tk1.it|cli'
alias ad2='echo 01573 9598 220 timo.koerner@hof-university.de dkoerner@konzertagentur-koerner.de'
alias c='cat'
alias -g ci='|xclip'
alias -g co='xclip -o'
alias dt='date +"%T"'
alias d='declare -f'
alias dfh='df -h'
alias du='du -h'
alias e="exec zsh"
alias ec="echo"
alias ex="exit"
alias f="find / -name"
alias f2="find -name"
alias ge="grep -i"
alias -g gr="|grep -i"
alias ha='halt'
alias ho='echo $(hostname)'
alias iban='DE637215 0000 00 5052 4271'
alias lag='amixer get PCM'
alias le='less'
alias -g lp='|less'
alias lsh="ls -halt --full-time"
alias -g m='man'
alias mkdir='mkdir -p'
alias ppi='ps -o ppid= -p'
alias prp='pgrep'
alias sc="systemctl"
alias so="sort"
alias sou="source"
alias -g ta='|tail'
alias te='if [ $os != "CYGWIN_NT" ]; then;terminator &;else; mintty;fi'
alias tp='top'
alias tr='tree'
alias us="echo $USER"
alias -g ve="--version"
alias wp='chmod 777 -R .'
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'

echo "$0 aktualisiert von $$"
