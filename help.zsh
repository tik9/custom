#!/bin/zsh

ad2(){
adb push "$1" storage/sdcard/
}

custom=~/.oh-my-zsh/custom
hilfedatei=$custom/help.zsh
login_rp=$custom/login_rp

bold=`tput bold`
normal=`tput sgr0`

prodn=192.168.188 ;
os=$(expr substr $(uname -s) 1 9)

if [ $os != "CYGWIN_NT" ]; then
ip=`ip addr show wlan0 | grep -Po 'inet \K[\d.]+'`
ipbas=$(echo $ip | cut -d . -f -3)
lsb=`lsb_release -i|cut -d: -f2|sed -e 's/^[[:blank:]]*//'`
fi

#echo $lsb

te2(){
	echo $lsb
}

he2(){
#  echo "${bold}Os: $lsb${normal}"
	echo "\n${bold}Hilfe"
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

function g(){
	geany $1 &
}

function he(){
	$1 --help
}

function i(){
	
if [ "$1" = '-h' ]; then
  he2 `basename $0` "Ip je nach Os"
  return
fi

if [ $os = "Linux" ]; then
echo "${bold}Linux${normal}"

ifconfig
elif [ $os = "CYGWIN_NT" ]; then
ipconfig
fi

}

function in(){
	if [ -z "$1" ]; then
	  he2 `basename $0` "Paket"
	  return
	fi

df -h
	if [[ "$lsb" == $os ]] ;then
echo "Arch"
		pacman -S --noconfirm $1
	else
echo "Ubuntu"
		apt-get install -y $1

fi
df -h
}

function ki(){
if [ -z "$1" ]; then
  he2 `basename $0` "Prozess für killall"
  return
fi
	killall $1;
	ps -ef|grep $1;
}
	
function las(){

if [ -z "$1" ]; then
  he2 `basename $0` "Lautstärke amixer mit 10 multipliziert"
  return
fi

amixer set PCM $(expr $1 \* 10)%;
}

# login remote shell
function lss(){
if [ -z "$1" ]; then
  he2 `basename $0` "letztes Oktett von ip " "opt. port"
  return
fi

        ssh $2 $ipbas.$1 
}



function mp(){
if [ -z "$1" ]; then
  he2 `basename $0` "Zeit"
  return
fi

	sleep $1;killall mplayer
}

function mup(){
if [ -z "$1" ]; then
  he2 `basename $0` "Datei"
  return
fi
	mupdf $1 &
}



function pl(){
if [ "$1" = -h ]; then
  he2 `basename $0` "argsleer" "Installierte Pakete zeigen"
  return
  
fi

if [[ $lsb == $os ]]; then
pacman -Qeq |less
else
dpkg -l	|less
fi
}

function pr(){
if [ -z "$1" ]; then
  he2 `basename $0` "grep mit 'prozess Substitution'" "Prozess"
  return
  
fi
	grep $1 =(ps aux)
}

function re(){
  echo "${bold}Os: $lsb${normal}"

if [ -z "$1" ]; then
  he2 `basename $0` "Löschen!" "Paket"
  return
  
fi

if [[ $lsb == $os ]] ;then
pacman -R --noconfirm
	else
apt-get autoremove
fi
$1
}

function sc2(){
if [ -z "$1" ]; then
  he2 `basename $0` Datei "letztes Oktett" Zielordner "(port)"
  return
fi
#echo a2 $3
	scp  $1 $ipbas.$2:$3 
}

function sho(){
if [ -z "$1" ]; then
  he2 `basename $0` "Paket"
  return
fi

	if [[ $lsb == $os ]] ;then
		pacman -Ss $1
	else
apt-cache show $1
fi	
}

function u(){
if [ "$1" = -h ]; then
  he2 `basename $0` "argsleer" "Upgrade machen"
  return
  
fi	

if [[ $lsb == $os ]] ;then
		pacman -Syu
	else
apt-get upgrade	
fi	
}

function ve(){
$1 --version
}

function verschieb(){
ver='/home/t/Downloads/';

if [ -z "$1" ]; then
  he2 `basename $0` "datei von '$ver' nach \$1"
  return
fi

	#ver='.'
	ls -t $ver
	mv "$ver`ls -t $ver | head -n1`" $1
	ls $1
}


function yt(){
if [ -z "$1" ]; then
  he2 `basename $0` Youtube-Datei
  return
fi	

youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.)s" "$1" ;
}

 
# alias
alias a='alias|le|gr'
alias ua='unalias'

# betriebssystem
alias pa='echo $path'
alias she='echo $0'


#cd's
alias da="cd ~/django"
alias mu="cd ~/musik"
alias oc='cd ~/.oh-my-zsh/custom'

#curl
alias cu='curl'
alias cl1='cu localhost:8000'


#Dateiops
alias d="rm -r"
alias md="mkdir -p"
alias to='touch'

#Dateisystem
alias pt='parted'
alias mn='mount'
alias um='umount'


# Energie
alias hi='hibernate'
alias h='hi'
alias rs='reboot'
alias s='pm-suspend'

#expect
alias ee='et expect1'
alias et='expect'
alias r=sr
alias sr='expect ~/.oh-my-zsh/custom/login_rp'
alias src="c $custom/login_rp"
alias srg="g $custom/login_rp"
alias srv="v $custom/login_rp"


# Hilfe
alias hc="c $hilfedatei" 
alias hg="g $hilfedatei"
alias hl="le $hilfedatei|gr"
alias hn="n $hilfedatei"
alias hv="v $hilfedatei" 

# ls
alias l='ls -CF'
alias la='ls -A'
alias lm="ls -l | more"
alias ll='ls -alF --full-time'
alias lsh="ls -halt --full-time"


# netzwerk
alias idu='ifdown wlan0;ifup wlan0'
alias ie='iwgetid -r'
alias ie2='iwconfig 2>&1 | grep ESSID'
alias ip2="echo $ip"
alias iu='ifup wlan0'
alias iw='iwlist wlan0 scan'
alias nm="nmap -sP $(echo $ipbas).1/24"
alias pi="ping google.de -c4" 


# package mgt.
alias aci='apt-cyg install'
alias acl='apt-cyg listall'
alias acl2='cygcheck'
alias ag='apt-get'
alias pm2="pacman -S"
alias up='ag update'


#programme
alias ab='abiword'
alias c='cat'
alias ec="export SWT_GTK3=0;~/progr/eclipse/eclipse &"
alias le='less'
alias li='links2'
alias n='notepad++'
alias v="vim"


# ps
alias ba="bash"
alias k="kill -9"
alias p="ps"
alias pr2='ps -ef|grep'
alias psl="pr sleep"
alias pmp="pr mplayer"
alias pts="ps -ef|gr pts/"
alias psp="ps -p"
alias sl="sleep"
alias wh="who"

# Radio
alias ml="mplayer "

alias b="ml http://80.237.154.83:8120" # landsberg int.
alias cur="ml -playlist http://minnesota.publicradio.org/tools/play/streams/the_current.pls"
alias fm4="ml http://mp3stream1.apasf.apa.at:8000/" #fm4 orf
alias kl="ml -playlist http://minnesota.publicradio.org/tools/play/streams/classical.pls"
alias mpr="ml -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls"
alias oe="ml http://194.232.200.156:8000" #oe3

#user
alias sur="sudo -i"
alias us="echo $USER"


alias ad='echo t@tk1.it|cli'
alias ad2='echo 015739598220 timo.koerner@hof-university.de dkoerner@konzertagentur-koerner.de'
alias cl='xclip -sel clip'
alias cp='cp -r'
alias dat='date'
alias df='df -h'
alias du='du -h'
alias e="exec zsh"
alias ex="exit"
alias f="find / -name"
alias f2="find -name"
alias gr='grep'
alias ha='halt'
alias ho='echo $(hostname)'
alias iban='DE63721500000050524271'
alias lag='amixer get PCM'
alias lsb="echo $lsb"
alias lk="lsblk"
alias m='man'
alias mkdir='mkdir -p'
alias mt='mutt'
alias prp='pgrep'
alias r=sr
alias sr="expect $login_rp"
alias srg="g $login_rp"
alias st='stty -a'
alias t='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias ta='tail'
alias tar='tar xfvz'
alias te='terminator &'
alias tp='top'
alias tr='tree'
alias un='unzip'
alias vg="g ~/.vimrc"
alias w="dict -d fd-eng-deu"
alias w2="dict"
alias wp='chmod 777 -R .'
alias x='man'
alias z='gpicview'
alias zg='g ~/.zshrc'

echo "$0 aktualisiert von $$"
