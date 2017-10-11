one='https://onedrive.live.com/?authkey=%21ACt0ADtNqXttMrg&id=A8C37D6344DA2882%21351875&cid=A8C37D6344DA2882'
# schriftfarbe autocomplete fg8 default
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=2'

hilfedatei=$ZSH_CUSTOM/plugins/common-aliases/common-aliases.plugin.zsh
idrs=~/.ssh/id_rsa.pub 
login=$ZSH_CUSTOM/login_rp
zr=~/.zshrc
mediaDir='/media/t'
dowDir='/home/t/Downloads'

bold=`tput bold`
normal=`tput sgr0`

os=$(expr substr $(uname -s) 1 9)
arc=`uname -a |cut -d' ' -f 14`
ip=`ip addr show $1 | grep -Po 'inet \K[\d.]+'`


if [[ $os = "Linux" ]] ;then;if [[ $lsb = 'Arch' ]]; then;pm='pacman';elif [[ $lsb = Ubuntu ]];then;pm='apt-get'; fi;else;pm='apt-cyg';fi


if [ $os != "CYGWIN_NT" ]; then

	lsb=`lsb_release -i|cut -d: -f2|sed -e 's/^[[:blank:]]*//'`

else
	bi=$(wmic OS get OSArchitecture)
	bi2=$(set | findstr ARCH)
fi

sortieren_datum(){
	ls -lt $1| grep "^-" | awk '{
key=$6$7
freq[key]++
}
END {
for (date in freq)
        printf "%s\t%d\n", date, freq[date]
}'
#| head -n1
}

hilfe(){
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

	
function g(){
	if [[ $os = "Linux" ]] ;then
		geany $1 &
	elif
	[[ $arc = "Android" ]] ;then
	vi $1 &
	else
	;notepad++ $1 &;fi
}


function i(){
	if [ $os = "Linux" ]; then;ifconfig;else;ipconfig;fi
}


function in(){
	if [ -z "$1" ]; then
	hilfe `basename $0` "Paket"
	return
	fi

	df -he
	if [[ $os = "Linux" ]] ;then
			     if [[ $lsb = 'Arch' ]]; then; pacman -S --noconfirm $1
                else;apt-get install -y $1;fi
	else
		apt-cyg install $1
	fi

	df -he
}


function ipbas {
	if [ -z "$1" ]; then
		hilfe `basename $0` "Zeigt interne ip-Adresse\n Argument 1: Netzwerk Interface (wlan0 oder eth0)"
	return
	fi
	
	ipbas=$(echo $ip | cut -d . -f -3)	
	echo Basis Ip $ipbas
}


function ipd(){
	if [ -z "$1" ]; then
	hilfe `basename $0` "Interface"
	return
	fi
	ip link set $1 down
}

function ipu(){
		
	if [ -z "$1" ]; then
	hilfe `basename $0` "Interface"
	return
	fi
		ip link set $1 up
}

function iu(){
	
	if [ -z "$1" ]; then
	hilfe `basename $0` "Interface"
	return
	fi
	
	if [[ $os = "Linux" ]] ;then
		ipd $1;ipu $1
else;echo Kein Linux;fi

i
}

function k(){
	if [ -z "$1" ]; then
	  hilfe `basename $0` "Prozess für kill"
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
  hilfe `basename $0` "Prozess für killall"
  return
fi
	killall $1;
	ps -ef|grep $1;
}

	
function las(){

if [ -z "$1" ]; then
  hilfe `basename $0` "Lautstärke amixer mit 10  	multipliziert"
  return
fi

amixer set PCM $(expr $1 \* 10)%;
}

function lö(){
	rm -rf $1
}

# login remote shell
function lss(){
	if [ -z "$1" ]; then
	  hilfe `basename $0` "Interface" "letztes Oktett von ip " "opt. port"
	  return
	fi
	ipbas $1

	ssh $3 $ipbas.$2 
}


function mo(){
	if [ "$1" = 'h' ]; then
	  hilfe `basename $0` "Findet USB-Bezeichnung"
	  return
	fi

	dev=`lsblk|sed -n 5p|cut -f1 -d' '`

	mount /dev/$dev $mediaDir
	echo $dev in $mediaDir eingehängt
}
	
function mp(){
if [ -z "$1" ]; then
  hilfe `basename $0` "Pdf"
  return
fi
	mupdf $1 &
}

function mss(){
	if [ -z "$1" ]; then
	  hilfe `basename $0` "Tab."
	  return
	fi

	mysql -uroot d -e "select*from app1_$1"
}


function msde(){ mysql -uroot d -e "describe app1_$1"}


function nm(){
	if [ -z "$1" ]; then
	  hilfe `basename $0` "Interface"
	  return
	fi
	ipbas $1
	nmap -sP $ipbas.1/24
}
	

function pd(){
	if [ "$1" = -he ]; then
	  hilfe `basename $0` "argsleer" "Installierte Pakete zeigen, nur Linux"
	  return
	fi

	if [[ $os = "Linux" ]] ;then
		if [[ $lsb = 'Arch' ]]; then;pacman -Qeq |less
	else
		dpkg -l	|less;
		fi;else cygcheck -c|less;fi
}

function pl(){

	ls -l $1 |less	
}


function pr(){
if [ -z "$1" ]; then
  hilfe `basename $0` "grep mit 'prozess Substitution'" "Prozess"
  return
  
fi
	grep $1 =(ps aux)
}

function re(){
  echo "${bold}Os: $lsb${normal}"

	if [ -z "$1" ]; then
	  hilfe `basename $0` "Löschen!" "Paket"
	  return
	  
	fi

	if [ $os = "CYGWIN_NT" ]; then;apt-cyg remove $1;else
	if [[ $lsb == 'Arch' ]] ;then;pacman -R --noconfirm $1
	else;apt-get autoremove $1;fi
	fi
}

function sc2(){
	if [ -z "$1" ]; then
	  hilfe `basename $0` Basis:$ipbas 1.Interface 2.Datei "3.letztes Oktett" 4.Zielordner (5.user) "(6.port)"
	  return
	fi
	ipbas $1

	user=$5
	if [ -z $5 ];user=root

	scp  $2 $user@$ipbas.$3:$4 
	lö $2
	echo $2 gelöscht vom Server
}


function schieb(){
	dow='/home/t/Downloads/';

	if [ "$1" = -h ]; then
	  hilfe `basename $0` "anzahl Dat" "Ziel (optional)"
	  return
	fi
	ziel=`pwd`
	
	if [ ! -z $2 ];then;ziel=$2;fi
	for i in `seq 1 $1`; do; 	
		dat="$dow`ls -t $dow | head -n1`"

		mv $dat $ziel

		echo $dat
	done
}

function scmysql(){
	if [ "$1" = -h ]; then
	  hilfe `basename $0` "argsleer" "Erstelle sql-Datei, dann kopieren auf Laptop"
	  return
	fi
	
	mysqldump d> $(date +"%m_%Y").sql
	scp `ls -t | head -n1` 192.168.188.148:/root/sqlBack
	lö $(date +"%m_%Y").sql
}


function unt(){
	#schieb
	a=$(schieb)
	#cd `pwd`
	tar xzvf $a
	rm $a
}

function sho(){

	if [ -z "$1" ]; then
	  hilfe `basename $0` "Paket"
	  return
	fi

	if [ $os = "CYGWIN_NT" ]; then
		apt-cyg show `echo $1`;else ; if [[ $lsb == 'Arch' ]] ;then;pacman -Ss $1 ;else;apt-cache show $1|less;fi;fi;
}

function si(){
	if [ -z "$1" ]; then
	  hilfe `basename $0` "Zeit in Minuten ohne Einheit bevor Ruhezustand"
	  return
	fi
		sleep $1m; hibernate 
}


function q(){

	datei=test100.zip
	if [ -f $datei ];then ; rm $datei;fi	
		wget http://speedtest.wdc01.softlayer.com/downloads/$datei `if [ $arc != "Android" ]; then ; echo --output-document=/dev/null;fi`

}

function up(){
	if [ "$1" = -he ]; then
	  hilfe `basename $0` "argsleer" "Upgrade machen"
	  return
	fi	

	apt-get upgrade	
	apt-get dist-upgrade	
}

 
# alias/Funktionen
alias a='alias|grep'
alias am='alias -m'
alias d='declare -f'
alias t='type'
alias ua='unalias'
alias wh="which"

# betriebssystem
alias lsb="echo $lsb"
alias os="echo $os"
alias arc="echo $arc"
alias pa='echo $path'


#cd's
alias bi="cd ~/bilder"
alias da="cd ~/django"
alias dow="cd $dowDir"
alias mu="cd ~/musik"
alias mtt="cd $mediaDir"
alias o='cd ~/.oh-my-zsh/custom'
alias oh='cd ~/.oh-my-zsh'
alias sd='cd /sdcard'
alias u='cd ~/uni'

#curl
alias cu='curl'
alias cl='cu localhost:8000'
alias cud='cu a.tk1.biz'


#Dateiops
alias cp='cp -r'
alias md="mkdir -p"
alias mod="chmod 700"
alias to='touch'

#Dateisystem
alias lk="lsblk"
alias mn='mount'
alias um='umount'

#Dict
alias wl="echo Dict.;dict -D"
alias w="dict -d fd-eng-deu"
alias w2="dict"


# Editoren
alias v="vim"


# Energie
alias hi='hibernate'
alias s='pm-suspend'

#expect
alias b='sr 44'
alias sr='expect $login'


# Hilfe
alias -g h="he"
alias -g he="--help |less"
alias -g hd="$hilfedatei"
alias hg="g $hilfedatei"

# Konsole
alias hs='\history -E'
alias se='echo $0'
alias st='stty -a'
alias tt='temp=$(tty) ; echo ${temp:5}'

# ls
alias l='ls -lFh'     #Größe, Typ
alias la='ls -lAFh'   #lange liste, fast alles
alias lart='ls -1Fcart'
alias ldot='ls -ld .*'
alias lr='ls -tRFh'   #sortiert nach Datum,rekursiv,Typ,human readable
alias lt='ls -ltFh'   #lange Liste,sortiert nach Datum,show type,human readable
alias ll='ls -l'      #lange Liste
alias lS='ls -1FSsh'
alias lrt='ls -1Fcrt'
alias lsh="ls -halt --full-time"


#mysql
alias me='mysql -uroot d -e'
alias msd='mysql -uroot d'
alias mst='mysql -uroot d -e "show tables"'


# netzwerk
alias dh='dhclient;i'
alias f='iwgetid -r'
alias ie2='iwconfig 2>&1 | grep -i ESSID'
alias ip2="echo $ip"
alias iw2='iwlist wlan0 scan n'
alias j='iw2'
alias jo='journalctl -xe'
#alias mip="echo $(dig +short myip.opendns.com @resolver1.opendns.com)"
alias ne='/etc/init.d/networking restart'
alias p="ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de"


# package mgt.
alias acl='apt-cyg listall'
alias acl2='cygcheck'
alias ag='apt-get'

alias dep="apt-cache depends"
alias der="apt-cache rdepends"
alias pm='ec $pm'
alias upd='ag update'


# ps
alias kp="ki ml"
alias ks="ki ssh"
alias pf='ps -f'
alias pr2='ps -ef|grep'
alias psl="pr sleep"
alias pmp="pr ml"
alias pn="pr ngro"
alias ph="pr ssh"
alias psp="ps -p"
alias sl="sleep"

# Radio
alias -g ml='mplayer'

alias b1="ml http://br-br1-nbopf.cast.addradio.de/br/br1/nbopf/mp3/128/stream.mp3"
alias b3="ml http://br-br3-live.cast.addradio.de/br/br3/live/mp3/56/stream.mp3"
alias kl="ml -playlist http://minnesota.publicradio.org/tools/play/streams/classical.pls"
alias r="ml http://80.237.156.8:8120" # landsberg int.


echo "$0 aktualisiert von $$"


# Command line head / tail
#alias -g H='| head'
#alias -g LL="2>&1 | less"
#alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
#alias -g P="2>&1| pygmentize -l pytb"
#alias -g ti='| tail'


alias ad2='echo 01573 9598 220 timo.koerner@hof-university.de'
alias c='cat'
alias -g ci='|xclip'
alias -g co='xclip -o'
alias dt='date +"%T"'
alias dfh='df -h'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias duh='du -h'
alias e="exec zsh"
alias ec="echo"
alias ex="exit"
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias fin="find / -name"
alias -g gr="|grep -i"
alias -g gp="g++"
alias ha='halt'
alias hgrep="fc -El 0 | grep"
alias his='history'
alias iban='DE637215 0000 00 5052 4271'
alias le='less -WiNS'
alias lb="lsb_release -a
"
alias m='man'
alias mkdir='mkdir -p'
alias -g n='|less'
alias rf='rfkill list'
alias sortnr='sort -n -r'
alias ta='tail -f'
alias ter='if [ $os != "CYGWIN_NT" ]; then;terminator &;else; mintty;fi'
alias tp='top'
alias tr='tree'
alias us="echo $USER"
alias -g ve="--version"
alias wp='chmod 777 -R .'
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'
alias -g zsha='git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions'
alias z='gpicview'
alias zshrc='g ~/.zshrc' 


#Lese Dokumente
alias -s pdf=mupdf
alias -s dvi=xdvi
alias -s chm=xchm

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"

# zsh soll wissen mit welchen hosts sich durch ssh verbunden wurde
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
