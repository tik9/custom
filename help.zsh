#!/bin/zsh

ad2(){
adb push "$1" storage/sdcard/
}

bold=`tput bold`
normal=`tput sgr0`

downl='/home/t/Downloads/';
prodh=192.168.0 ;
prodn=192.168.188 ;
ip=`ip addr show wlan0 | grep -Po 'inet \K[\d.]+'`
ipbas=$(echo $ip | cut -d . -f -3)
#echo "ip3 ${ip}"

te2(){
	echo $ipbas
	echo $ip
}

he2(){

  echo "${bold}Argumente${normal} für $1:"
  for var in ${@:2} ; do
  echo $var
  done
}

function g(){
	geany $1 &
}


function in(){
if [ -z "$1" ]; then
  he2 `basename $0` "Paket"
  return
fi
	df;apt-get install -y $1;df
}


function ki(){
	killall $1;
	ps -ef|grep $1;
	echo "Prozess \$1 vernichtet"
}
	
function las(){

if [ -z "$1" ]; then
  he2 `basename $0` "Lautstärke"
  return
fi

amixer set PCM $(expr $1 \* 10)%;
echo "Lautspr.: Argument \$1 mit 10 multipliziert."
}

# login remote shell
function lss(){
if [ -z "$1" ]; then
  he2 `basename $0` "letztes Oktett"
  return
fi

        ssh $ipbas.$1;
}

function mup(){
if [ -z "$1" ]; then
  he2 `basename $0` "Datei"
  return
fi
	mupdf $1 &
}

function mp(){
if [ -z "$1" ]; then
  he2 `basename $0` "Zeit"
  return
fi

	sleep $1;killall mplayer
	echo "wieder aufgewacht nach \$1"
}

function pm(){
if [ -z "$1" ]; then
  he2 `basename $0` "Paket"
  return
fi

df;pacman -S --noconfirm $1

echo \\n
df
}
function sc2(){
if [ -z "$1" ]; then
  he2 `basename $0` Datei "letztes Oktett" Ziel
  return
fi

	scp -r $1  $prodh$2:$3 ;
}


function ve(){
$1 --version
}

function yt(){
	youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.)s" "$1" ;
echo "$1 (\$1) heruntergeladen"
}

 
function mov(){
	ver='/home/t/';
	root="/root/$1"
	#ver='.'
	ls -t $ver
	mv "$ver`ls -t $ver  | head -n1`" $1
	ls $1
 }

 
# alias
alias a='alias|le|gr'
alias ua='unalias'


#cd's
alias da="cd /root/django"
alias mu="cd /root/musik"
alias oh='cd /root/.oh-my-zsh'
alias oc='cd /root/.oh-my-zsh/custom'
alias vr='cd /root/vr'

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
alias sr='expect /root/.oh-my-zsh/custom/login_rp'
alias src='c /root/.oh-my-zsh/custom/login_rp'
alias srg='g /root/.oh-my-zsh/custom/login_rp'
alias srv='v /root/.oh-my-zsh/custom/login_rp'


# Hilfe
alias hc='c /root/.oh-my-zsh/custom/help.zsh'
alias hg='g /root/.oh-my-zsh/custom/help.zsh'
alias hl='le /root/.oh-my-zsh/custom/help.zsh|gr'
alias hs='so /root/.oh-my-zsh/custom/help.zsh'
alias hv='v /root/.oh-my-zsh/custom/help.zsh' 

# ls
alias l='ls -CF'
alias la='ls -A'
alias ld='ls -t $ver'
alias lh="ls --help"
alias li='ls -cl --group-directories-first'
alias lm="ls -l | more"
alias ll='ls -alF --full-time'
alias lsh="ls -halt --full-time"


# netzwerk
alias i=if
alias idu='ifdown wlan0;ifup wlan0'
alias ie='iwgetid -r'
alias ie2='iwconfig 2>&1 | grep ESSID'
alias if="ifconfig" 
alias ip2="echo $ip"
alias iu='ifup wlan0'
alias iw='iwlist wlan0 scan'
alias nm="nmap -sP $(echo $ipbas).1/24"
alias pi="ping google.de -c4" 


# package mgt.
alias ag='apt-get'
alias ar='ag remove -y'
alias aur='ag autoremove'
alias pa="pacman -Ss"
alias pm="pacman -S"
alias pu='pacman -Syu'
alias pre='pacman -R --noconfirm'
alias sho='apt-cache show'
alias u='ug'
alias up='ag update'
alias ug='ag upgrade'


#programme
alias ab='abiword'
alias c='cat'
alias ec="export SWT_GTK3=0;/root/progr/eclipse/eclipse &"
alias le='less'
alias li='links2'
alias v="vim"


# ps
alias ba="bash"
alias k="kill -9"
alias kf=kfe
alias kfe="ki fetchmail"
alias ki="killall"
alias km=kmp
alias kmp="pmp;echo '\n';ki mplayer;echo '\n';pmp"
alias ksl="ki sleep"
alias kpy="ki python3"
alias p="ps"
alias pf=pfe
alias pfe='pr fetchmail'
alias pr='ps -ef|grep'
alias psl="pr sleep"
alias pmp="pr mplayer"
alias sl="sleep"

# Radio
alias ml="mplayer "

alias b="ml http://80.237.154.83:8120" # landsberg int.
alias cur="ml -playlist http://minnesota.publicradio.org/tools/play/streams/the_current.pls"
alias fm4="ml http://mp3stream1.apasf.apa.at:8000/" #fm4 orf
alias heart'ml -playlist http://minnesota.publicradio.org/tools/play/streams/radio_heartland.pls'
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
alias hn='echo $(hostname)'
alias iban='DE63721500000050524271'
alias lag='amixer get PCM'
alias m='man'
alias mkdir='mkdir -p'
alias mt='mutt'
alias r=sr
alias sr='expect /root/.oh-my-zsh/custom/login_rp'
alias srg='g /root/.oh-my-zsh/custom/login_rp'
alias st='stty -a'
alias t='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias ta='tail'
alias tar='tar xfvz'
alias te='terminator &'
alias tp='top'
alias tr='tree'
alias un='unzip'
alias w="dict -d fd-eng-deu"
alias w2="dict"
alias wp='chmod 777 -R .'
alias x='man'
alias z='gpicview'

echo "$0 aktualisiert von $$"
