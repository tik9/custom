# schriftfarbe autocomplete fg8 default
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=2'

os=`uname -a |cut -d' ' -f 1`
cb2=plugins/common-aliases/common-aliases.plugin.zsh
cb=$ZSH_CUSTOM/$cb2
db2=plugins/django/django.plugin.zsh
db=$ZSH_CUSTOM/$db2
gb2=plugins/git/git.plugin.zsh
gb=$ZSH_CUSTOM/$gb2
gb3=functions/_git2
gb4=$ZSH_CUSTOM/$gb3
lb=$ZSH_CUSTOM/login_rp
pb=$ZSH_CUSTOM/plugins/python/python.plugin.zsh
rb2=functions/_rest
rb=$ZSH_CUSTOM/$rb2

sa=178.27.250.8
sm=192.168.43

if [ $os != "CYGWIN_NT-6.1" ]; then
	
	lsb=`lsb_release -i|cut -d: -f2|sed -e 's/^[[:blank:]]*//'`
	arc=`uname -a |cut -d' ' -f 14`
	dowDir=/home/t/Downloads
	mteDir=/root/git/mte
	pts=pts
	zr=~/.zshrc

else
	zHome=.oh-my-zsh/custom
	pts=pty
	lsb=cygwin
	
	# cyg=c:/cygwin64
	home2=c:/cygwin64/home/itdlz-koer
	db=$home2/$zHome/$db2
	gb=$home2/$zHome/$gb2
	gb2=$home2/$zHome/$gb3
	cb=$home2/$zHome/$cb2
	lb=$home2/$zHome/login_rp
	pb=$home2/$zHome/$pb2
	rb=$home2/$zHome/$rb2
	
	bim=$(wmic OS get OSArchitecture)
	arc=`uname -a |cut -d' ' -f 6`
	dowDir=/cygdrive/C/Users/itdlz-koer/Downloads
	mteDir=$home2/mte/my-app
	alias acl='apt-cyg listall'
	alias in='apt-cyg install'
	alias op='cygstart'
	alias rem='apt-cyg remove';

	zr=$home2/.zshrc

fi

try () {
  result=$(eval "$1" 2>&1)
  if [ $? -ne 0 ]; then

	printf "[\033[31mFehler\033[0m]\n"
    echo $result
    return
  fi
  printf "[\033[32mErfolg\033[0m]\n"
}

function sortieren_datum(){
	ls -lt $1| grep "^-" | awk '{
	key=$6$7
	freq[key]++
	}
	END {
	for (date in freq)
			printf "%s\t%d\n", date, freq[date]
	}'| sort -k2|tail -n2
}


function hilfe(){

	bold=`tput bold`
	normal=`tput sgr0`
	echo "\n${bold}Hilfe, os: $os"
	schleife=2
	echo "Argumente für $1:${normal}"

	for var in ${@:$schleife} ; do; echo $var;done
}


function b(){	
	if [[ $lsb = 'Ubuntu' ]];then
		/root/src/src_geany-1.28/usr/bin/geany $1 &
	elif [ $os = "CYGWIN_NT-6.1" ];then
		notepad++ $1 &
	# android und arch
	else 
		vi $1 &
	fi

}

function ci2(){
	if [[ $lsb = 'Ubuntu' ]];then
		echo "$1"|xclip
	else
		echo $1 > /dev/clipboard
	fi
}

ci(){
	echo "$1"|xclip -selection clipboard
}
	

function co(){
	if [[ $lsb = 'Ubuntu' ]];then
		xclip -o
	else
		cat /dev/clipboard
	fi
}

function dif(){
	diff <(pdftotext -layout $1 /dev/stdout) <(pdftotext -layout $2 /dev/stdout)
	
}


function ersetz(){

	for file in *; do
		if [[ $file =~ \  ]];then
			echo mit Leerzeichen: $file
			neu="${file// /_}"
			mv "$file" $neu
		fi
		
		if [[ $neu =~ '[A-Z]' ]];then
			echo Zu verändern da Großbuchst.: $neu
		
		rename 'y/A-Z/a-z/' *
		fi
		
		if [[ `pwd` = '/root/uni/c' && $neu != *"c_"* ]]; then
			neu_c=c_${neu}
			mv "$neu" $neu_c
			echo c uni pdf zu ändern: $neu
		fi
	done
	echo "\n${bold}Dateien nach Op $normal"
	for f in *;do;echo $f;done
}


function ig(){
	if [ $os = "Linux" ]; then;ifconfig;else;ipconfig;fi
}


function ip2(){
		ip addr show $1 | grep -Po 'inet \K[\d.]+'
}
compdef _ip ip2


function ipbas {
	
	ipbas=$(echo `i $1` | cut -d . -f -3)	
	echo Basis Ip $ipbas
}

compdef _ip ipbas

function ipd(){

	ip link set $1 down
}
compdef _ip ipd


function ipu(){
		

		ip link set $1 up
}
compdef _ip ipu


function iu(){
	ipd $1;ipu $1
	ig;p
}
compdef _ip iu


function k(){
	kill -9 $1

	if [ -z "grep $1 =(ps aux)" ];then
		echo Prozess gekillt
	fi
	
	echo "Prozesse mit $1 \n";
	ps -ef|grep $1
}

compdef _kil k

function ki(){
		killall $1;
		echo "Prozesse mit $1 \n"
		ps -ef|grep $1
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


function mi(){
	wget -q --spider http://google.com
	if [ $? -eq 0 ];then
		echo $(dig +short myip.opendns.com @resolver1.opendns.com)
	fi
}


function ml(){
	zparseopts -A ARGUMENTS l:
	
	ffprobe $1 2> >(grep Duration)
	
	loop=1
	if [ ! $? -eq 0 ]; then
		loop=$ARGUMENTS[-l]
	fi
	
	mplayer "$1" -loop $loop 
}

compdef _ml ml

function mo(){
	mediaDir='/media/t'
	dev=`lsblk|sed -n 5p|cut -f1 -d' '`
	mount /dev/$dev $mediaDir
}

	
function mp(){
	mupdf $1 &
}

mv0(){
	mvn clean compile assembly:single  -e
	#pkill java
	echo .. compile fertig
	java -jar target/my-app-2.jar 
	#pr2 jav
}

function nm(){
	ipbas $1;nmap -sP $ipbas.1/24
}
compdef _ip nm
	

function pd(){

		if [[ $lsb = 'Arch' ]]; then;pacman -Qeq |grep $1
else cygcheck -c|less;fi
}

function pe(){
	while true; do
		echo "telnet/curl $sa 8000"
		curl -f $sa:8000 && echo Erfolg || echo Keine Verbindung
		#curl localhost:8000
		sleep ${1}m 
		ec $(date +"%T")
	done
}
compdef _pe pe


function pk(){
	pkill $1;ps $1
}


function p(){
	grep $1 =(ps aux)
}

function pt(){
	
	ps -ef |grep $pts/$1
}
compdef _pt pt

function int_trap() {
    echo "Ctrl-C gedrückt"
}


function q(){
	# zeige WLAN ssid (iwget)
	if [[ $os != "CYGWIN_NT-6.1" && $arc != 'Android' && `uname -m` != 'armv7l' ]]; then

		iwgetid -r;printf "\n";
	fi
	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei `if [[ $os = "Linux" && $arc != 'Android' ]]; then ; echo --output-document=/dev/null;fi`
	
	if [ -f $datei ];then ; rm $datei; echo "$datei wird gelöscht"; fi	
	echo Ende
}


# -f[datei]:dateiname:_files' '-i[interface]:interf:_net_interfaces' '-o[letztes Oktett]' '-d[ziel]'
function sc2(){
	zparseopts -A ARGUMENTS d: f: i: o: p: u:

	dir=$ARGUMENTS[-d]
	datei=$ARGUMENTS[-f]
	interface=$ARGUMENTS[-i]
	oktett=$ARGUMENTS[-o]
	port=$ARGUMENTS[-p]
	user=$ARGUMENTS[-u]

	printf 'Dir %s, Datei %s, Port %s', $dir,$datei, $port

#	ipbas=$sa
	ipbas=$sm

	#ipbas $interface
	
	if [ -z $dir ];then;dir=/root;fi
	if [ -z $port ];then;port=8022;fi
	if [ -z $user ];then;user=root;fi

	scp -P $port $datei $user@$ipbas.$oktett:$dir
	#rm -rf $datei
}
compdef _sc2 sc2


function schieb(){

	
	ziel_dir=`pwd`
	#ziel_dir=~/root
	
	#if [ -d $2 ];then;ziel_dir=$2;fi
	for i in `seq 1 $1`; do; 	
		dat="$dowDir/`ls -t $dowDir | head -n1`"
		echo $dat
		mv $dat $ziel_dir

		#echo aktuelle Datei $ziel_dir/`ls -t $ziel_dir | head -n1`
	done
}

compdef _schieb schieb

function scmysql(){
	
	mysqldump d> $(date +"%m_%Y").sql
	scp `ls -t | head -n1` 192.168.0.148:/root/sqlBack
	#lö $(date +"%m_%Y").sql
}


function sho(){

	if [ $os = "CYGWIN_NT-6.1" ]; then
		apt-cyg show `echo $1`;else ; apt-cache show $1|less;fi
}

function si(){
	
	secs=$(($1 * 60))
	while [ $secs -gt 0 ]; do
	   echo -ne "$secs\033[0K\r"
	   sleep 1
	   : $((secs--))
	done
	eval $2
}

function ss(){
	
	#echo $1 | ssh root@$sa 'cat >> .ssh/authorized_keys'
	cat ~/.ssh/id_rsa.pub | ssh root@$sa 'cat >> ~/.ssh/authorized_keys'
	
}

function unt(){
	#schieb
	#a=$(schieb)
	#cd `pwd`
	# gz: z flag
	a=`ls -t | head -n1`
	tar zxvf $a
	#rm $a
}


function yt2(){
		zparseopts -A ARGUMENTS m
	m=$ARGUMENTS[-m]
	
	if [[ -f $2 ]];then
	while read name;do;youtube-dl $name;done < $2;return;fi
	
	typeset -A a_array
	a_array=('classic' ''
	'welt' '' 
	'pop' ''
	)

	for k in "${(@k)a_array}"; do
	  youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=$a_array[$k]"
	  if [ $1 = u ];then
		#mv `ls -t|head -n1` /dev/sdb
		echo auf usb speichern
	  fi
	done
}
compdef _yt2 yt2

 
# alias/Funktionen
alias al='alias|grep'
alias am='alias -m'
alias d='declare -f'
alias t='type'
alias wo='who'
alias whi="which"

# betriebssystem
alias lsb="echo $lsb"	
alias os="echo $os"
alias arc="echo $arc"


#cd's
alias ar="cd ~/arduino"
alias y="cd"
alias da="cd ~/django"
alias dow="cd $dowDir"
alias mu="cd ~/musik"
alias mte='cd $mteDir'
alias o='cd $ZSH_CUSTOM'
alias oh='cd $ZSH'
alias u='cd ~/uni'
alias uc='cd ~/uni/c'
alias vs='cd ~/vs/vs'

#curl
alias c='cu $sa:8000/te'
alias cl='cu localhost:8000'
alias cm='cu http://$sa:8000/de/admin/'
alias cu='curl'


#Dateiops
alias cp='cp -r'
alias lö='rm -rf'
alias to='touch'

#Dateisystem
alias lk="lsblk"

#Dict
alias wl="echo Dict.;dict -D"
alias di="dict -d fd-eng-deu"
alias w2="dict"

#Dokumente
alias -s pdf=mupdf


# Editoren
alias v="vim"
alias ab="abiword"


# Energie
alias hi='sudo hibernate'
alias s='sudo pm-suspend'

#find
alias ff='find . -type f -name'
alias fin="find / -name"

#grep
alias -g gr="|grep -ai --color=auto"
alias grep="grep -i"
alias hgrep="fc -El 0 | grep"


# head / tail
alias -g H='| head'
alias tai='tail -f'
alias -g ti='| tail'

# Hilfe
alias -g h="he"
alias -g he="--help |less"
alias cb="b $cb"
alias -g com="$cb"
alias lb="b $lb"
alias rb="b $rb"

# Java
alias ja="java"


#Komprimierung
alias -s zip="unzip -l"
alias -s tar="tar tf"


# Konsole
alias hs='\history -E'
alias ho='ec $HOST'
alias j='jobs -l'
alias pen='printenv n2'
alias pg='pgrep -P $$'
alias pz='pr3 zsh'
alias se='set gr'
alias tt='tty'
alias us='ec $USER'
alias wh='whois'


#mysql
alias msd='mysql -uroot d'
alias mst='mysql -uroot d -e "show tables"'


# netzwerk
alias f='iwgetid -r'
alias i='ip2 wlan0'
alias ie='curl ifconfig.me'
alias ii='iw2 n'
alias iw2='iwlist wlan0 scan'
alias jo='journalctl -xe'
alias ne='/etc/init.d/networking restart;sleep 1;ig'
alias pn='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias -g re='$sa'
alias z='ne'


# ps
alias ks="ki ssh;ph"
alias ksl="ki sl;ph"
alias n='pkill -P $$;pe 30'
alias ph="pr2 ssh"
alias pr='ps -ef|grep'
alias pl="pr2 sleep"
alias -g sl="sleep"

#ssh
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 

#tmux
alias ta="tmux attach"
alias tk="tmux kill-session"
alias tl="tmux ls"
alias -g tm="tmux"


# zsh
alias e="exec zsh"
alias ohmyzsh="b $ZSH/oh-my-zsh.sh"
alias ohm='sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
alias plu='ec $plugins'
alias pro='ec $prompt'
alias rt="ec $RANDOM_THEME"
alias -g zc='$ZSH_CUSTOM' # zshrc 
alias zr='b $zr' # zshrc 
alias zt="ec $ZSH_THEME"


alias ac='ack -i'
alias ad='echo 01573 9598 220 timo.koerner@hof-university.de'
alias ca='cat'
alias dt='date +"%T"'
alias dh='df -h'
alias dowDir='l $dowDir'
alias duh='du -h'
alias ecl="/root/progr/eclipse/eclipse & "
alias ec="echo"
alias gp="g++"
alias his='history'
alias le='less -WiNS'
alias m='man'
alias mt='man terminator'
alias -g n2='|less'
alias r="expect $lb"
alias rf='rfkill list'
alias -g sm='$sm'
alias ter='if [ $os != "CYGWIN_NT-6.1" ]; then;terminator &;else; mintty;fi'
alias tp='top'
alias tr='tree'
alias -g ve="--version"
alias x="exit"
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'

echo "$0 aktualisiert"
