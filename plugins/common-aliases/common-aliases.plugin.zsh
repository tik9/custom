# schriftfarbe autocomplete fg8 default
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=2'

os=`uname -a |cut -d' ' -f 1`
cb2=plugins/common-aliases/common-aliases.plugin.zsh
cb=$ZSH_CUSTOM/$cb2
db2=plugins/django/django.plugin.zsh
db=$ZSH_CUSTOM/$db2
gb2=plugins/git/git.plugin.zsh
gb=$ZSH_CUSTOM/$gb2
gb4=functions/_git2
gb3=$ZSH_CUSTOM/$gb4
lb=$ZSH_CUSTOM/login_rp
pb=$ZSH_CUSTOM/plugins/python/python.plugin.zsh
rb2=functions/_rest
rb=$ZSH_CUSTOM/$rb2

sa=178.27.250.8
sm=192.168.43

if [ $os != "CYGWIN_NT-6.1" ]; then
	
	lsb=`lsb_release -i|cut -d: -f2|sed -e 's/[[:blank:]]//'`
	arc=`uname -a |cut -d' ' -f 14`
	dowDir=/home/t/Downloads
	mteDir=/root/git/mte
	pts=pts
	zr=~/.zshrc

else
	zHome=.oh-my-zsh/custom
	pts=pty
	lsb=cygwin
	
	home2=c:/cygwin64/home/itdlz-koer
	db=$home2/$zHome/$db2
	gb=$home2/$zHome/$gb2
	gb3=$home2/$zHome/$gb4
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


function _hilfe(){

	bold=`tput bold`
	normal=`tput sgr0`
	echo "\n${bold}os: $os"
	schleife=2
	echo "Argumente für $1:${normal}"

	for var in ${@:$schleife} ; do; echo $var;done
}


function b(){	
	if [[ $lsb = 'Ubuntu' ]];then
		/root/src/src_geany-1.28/usr/bin/geany $1 &
	elif [ $os = "CYGWIN_NT-6.1" ];then
		notepad++ $1 &
	fi
}

function ci2(){
	if [[ $lsb = 'Ubuntu' ]];then
		echo "$1"|xclip
	else
		echo $1 > /dev/clipboard
	fi
}

function ci(){
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
			echo Leerzeichen: $file
			neu="${file// /_}"
			mv $file $neu
		v_ersetz++
		fi
		file=$neu
		if [[ $file =~ '[A-Z]' ]];then
			echo Großbuchst.: $file
			rename 'y/A-Z/a-z/' $file
		fi

		if [[ `pwd` = '/root/uni/c' && $file != *"c_"* ]]; then
			neu_c=c_$file
			mv $file $neu_c
			echo c uni pdf: $file
		fi
		#mv $f `echo "$f" | sed -e 's!\(.*\).........................\(\.[^.]*\)!\1\2!'`
		#mv $f `echo -n $f | sed  -E -e "s/[^/]{10}(\\.[^\\.]+)?$/\\1/"` 
	done
	echo "\n${bold}Dateien nach Op $normal"
	for f in *;do;echo $f;done
}

function his(){
	history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10

}

function ig(){
	if [ $os = "Linux" ]; then;ifconfig;else;ipconfig;fi
}


function ip2(){
	
	interf=$1
	if [ -z $1 ]; then ; interf=wlan0;fi
	
		ip addr show $interf | grep -Po 'inet \K[\d.]+'
}
compdef _ip ip2


function ipbas {
	
	ipbas=$(echo `i` | cut -d . -f -3)	
	echo $ipbas
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

compdef _k k

function ki(){
		killall $1;
		echo "Prozesse mit $1 \n"
		ps -ef|grep $1
}


# login remote shell
function lss(){
	if [ -z "$1" ]; then
	  _hilfe `basename $0` "Interface" "letztes Oktett von ip " "opt. port"
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


function m(){
	zparseopts -A ARGUMENTS l:
	
	ffprobe $1 2> >(grep Duration)
	
	loop=1
	if [ ! $? -eq 0 ]; then
		loop=$ARGUMENTS[-l]
	fi
	
	mplayer "$1" -loop $loop 
}

compdef _ml m
#compdef _path_files ml

function mo(){
	mediaDir='/media/t'
	dev=`lsblk|sed -n 5p|cut -f1 -d' '`
	mount /dev/$dev $mediaDir
}

	
function mp(){
	mupdf $1 &
}

function mv0(){
	mvn clean compile assembly:single  -e
	#pkill java
	echo .. compile fertig
	java -jar target/my-app-2.jar 
	#pr2 jav
}

function cu_kv(){
	pkill -P $$
	while true; do
		echo "telnet/curl $sa 8000"
		curl -f $sa:8000 && echo Erfolg || echo Keine Verbindung
		#curl localhost:8000
		sleep 30m 
		ec $(date +"%T")
	done
}
compdef _pe cu_kv

function nm(){
	ipbas $1;nmap -sP $ipbas.1/24
}
compdef _ip nm
	
function p(){
	grep $1 =(ps aux)
}

function pd(){

	cygcheck -c|less
}



function pk(){
	pkill $1;ps $1
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
	zparseopts -A ARGUMENTS d: f: i: ip: o: p: u:

	dir=storage/music
	
	dir=$ARGUMENTS[-d]
	datei=$ARGUMENTS[-f]
	ipba=$ARGUMENTS[-ip]
	oktett=$ARGUMENTS[-o]
	port=$ARGUMENTS[-p]
	user=$ARGUMENTS[-u]

	#ipba=$sm

	if [ -z $datei ];then;datei=`ls -t|head -n1`;fi
	if [ -z $dir ];then;dir=/root;fi 
	if [ -z $ipba ];then;ipba=$(ipbas);fi
	#if [ -z $oktett ];then;oktett=.162;fi
	if [ -z $port ];then;port=8022;fi
	if [ -z $user ];then;user=root;fi

	printf 'Dir: %s, Datei: %s, Port: %s, Ip: %s', $dir,$datei, $port, $ipba

	scp -P $port $datei $user@$ipba$oktett:$dir
	#rm -rf $datei
}
compdef _sc2 sc2

function sh2(){
	ssh -p8022 root@$sm.$1
}

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

function start(){
	cp /root/.zshrc ~/
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

function we(){
	URL='https://www.accuweather.com/en/de/hof/95028/weather-forecast/172202'
	wget -q -O- "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $2": "$13", "$12"°" }'| head -1
}


function yt2(){
		zparseopts -A ARGUMENTS m
	m=$ARGUMENTS[-m]
	
	if [[ -f $2 ]];then
	while read name;do;youtube-dl $name;done < $2;return;fi
	
	typeset -A a_array
	#a_array=('classic' ''
	#'latino' 'B0KH-fiVnCc' 
	#'pop' 'OPf0YbXqDm0')

	for k in "${(@k)a_array}"; do
	  youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=$a_array[$k]"
	  if [[ $1 = u ]];then
		#mv `ls -t|head -n1` /dev/sdb
	  fi
	done
	
	ersetz
	sc2 -o .1 -f "`ls -t |head -1`" -d /data/data/com.termux/files/home
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
alias un='cd ~/uni'
alias uc='cd ~/uni/c'
alias vs='cd ~/vs/vs'

#curl
alias c='cu $sa:8000/te'
alias cl='cu localhost:8000'
alias cm='cu http://$sa:8000/de/admin/'
alias cu='curl'
alias n='cu_kv &'


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

# Rest
alias -g h="he"
alias -g he="--help |less"
alias cb="b $cb"
alias -g com="$cb"
alias lb="b $lb"
alias rb="b $rb"


#Komprimierung
alias -s zip="unzip -l"
alias -s tar="tar tf"


# Konsole
alias hist='history'
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
alias ii='iw2 n2'
alias iw2='iwlist wlan0 scan'
alias jo='journalctl -xe'
alias pn='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias -g re='$sa'
alias z='/etc/init.d/networking restart;sleep 1;ig'


# ps
alias ks="ki ssh;ph"
alias ksl="ki sl;ph"
alias ph="pr ssh"
alias pr='ps -ef|grep'
alias pl="pr sleep"
alias -g sl="sleep"

#ssh
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 
alias -g sc=/etc/ssh/sshd_config 
alias sd=sshd 

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
alias zr='b $zr' # zshrc 
alias zt="ec $ZSH_THEME"

alias ac='ack -i'
alias -g ad='user153015@gmail.com' # 01573 9598 220
alias a+='amixer -q sset Master 3%+'
alias a-='amixer -q sset Master 3%-'
alias ca='cat'
alias dt='date +"%T"'
alias dh='df -h'
alias dowDir='l $dowDir'
alias duh='du -h'
alias ecl="/root/progr/eclipse/eclipse & "
alias ec="echo"
alias gp="g++"
alias ja="java"
alias le='less -WiNS'
alias ma='man'
alias mt='man terminator'
alias -g n2='|less'
alias r="expect $lb"
alias rf='rfkill list'
alias -g sa='$sa'
alias -g sm='$sm'
alias ter='if [ $os != "CYGWIN_NT-6.1" ]; then;terminator &;else; mintty;fi'
alias tp='top'
alias tr='tree'
alias -g ve='--version'
alias x='exit'
alias x+='xbacklight -set 40'
alias x-='xbacklight -dec 10'
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'

echo "$0 aktualisiert"
