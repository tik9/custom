
os=`uname -a |cut -d' ' -f 1`

declare -A ad
ad[ms]='schuhmaier@playglobe.eu'
ad['uk']='ukoerner@konzertagentur-koerner.de'
ad['tk']='user153015@gmail.com'
ad['t']='01573 9598 220'

#ad=(k1 v1 k2 v2)

#for k in ${(@k)ad};do ;echo "$k $ad[$k]" ; done

arb=plugins/archlinux/archlinux.plugin.zsh
ab=plugins/android/android.plugin.zsh

cb2=plugins/common-aliases/common-aliases.plugin.zsh
cb=$ZSH_CUSTOM/$cb2

db2=plugins/django/django.plugin.zsh
db=$ZSH_CUSTOM/$db2

gb2=plugins/git/git.plugin.zsh
gb=$ZSH_CUSTOM/$gb2
gb4=functions/_git2
gb3=$ZSH_CUSTOM/$gb4

lb=$ZSH_CUSTOM/login
ob=$ZSH/oh-my-zsh.sh

pb=$ZSH_CUSTOM/plugins/python/python.plugin.zsh

rb2=functions/_rest
rb=$ZSH_CUSTOM/$rb2

ub=$ZSH_CUSTOM/plugins/ubuntu/ubuntu.plugin.zsh

un=~/uni

sa=178.27.250.8
sm=192.168.43

zr=~/.zshrc


aaa(){}

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


function add(){
	ec $1 >> .gitignore
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


function int_trap() {
    echo "Ctrl-C gedrückt"
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

function m(){
	zparseopts -A ARGUMENTS l: m:
	cd ~/musik
	ffprobe $1 2> >(grep Duration)

	mus=$ARGUMENTS[-m]

	loop=1
	if [ ! $? -eq 0 ]; then
		loop=$ARGUMENTS[-l]
	fi
	
	mplayer -loop $loop $1  
}

function mai(){
		zparseopts -A argumente b: t: a:
		
	printf "Subject:$argumente[-b]\n$argumente[-t] Gruß,Timo" |msmtp $ad['${argumente[-a]']
	#printf "Subject:$argumente[-b]\n$argumente[-t] Gruß,Timo" |msmtp $ad['tk']
	#cat ~/.msmtp.log
}
compdef _ma mai


function mi(){
		echo $(dig +short myip.opendns.com @resolver1.opendns.com)
}


compdef _m m
#compdef _path_files ml


function mo(){
	mediaDir='/media/t'
	dev=`lsblk|sed -n 5p|cut -f1 -d' '`
	mount /dev/$dev $mediaDir
}

	
function mv0(){
	mvn clean compile assembly:single  -e
	echo .. compile fertig
	java -jar target/my-app-2.jar 
}


function n(){
	pkill -P $$
	while true; do
		echo "telnet/curl $sa 8000"
		curl -f $sa:8000 && echo Erfolg || echo Keine Verbindung
		#curl localhost:8000
		sleep 30m 
		ec $(date +"%T")
	done
}
compdef _pe n


function nm(){
	ipbas $1;nmap -sP $ipbas.1/24
}
compdef _ip nm

	
function p(){
	grep $1 =(ps aux)
}


function pk(){
	pkill $1;ps $1
}


function pt(){
	
	ps -ef |grep $pts/$1
}
compdef _pt pt


function s2(){
	zparseopts -A ARGUMENTS d: f: i: ip: o: p: u:

	dir=storage/music
	
	dir=$ARGUMENTS[-d]
	datei=$ARGUMENTS[-f]
	ip=$ARGUMENTS[-ip]
	oktett=$ARGUMENTS[-o]
	port=$ARGUMENTS[-p]
	user=$ARGUMENTS[-u]

	#ipba=$sm

	if [ -z $datei ];then;datei=`ls -t|head -n1`;fi
	if [ -z $dir ];then;dir=/root;fi 
	if [ -z $ip ];then;ip=$sm;fi
	#if [ -z $oktett ];then;oktett=.162;fi
	if [ -z $port ];then;port=8022;fi
	if [ -z $user ];then;user=root;fi

	printf 'Dir: %s, Datei: %s, Port: %s, Ip: %s', $dir,$datei, $port, $ipba

	scp -P $port $datei $user@$ipba$oktett:$dir
	#rm -rf $datei
}
compdef _sc2 s2

function s2(){
	ssh -p8022 root@$sm.$1
}

function schieb(){

	ziel_dir=`pwd`
	
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
	scp -P $1 `ls -t | head -n1` 0.tcp.eu.ngrok.io:/root/sqlBack 
	#lö $(date +"%m_%Y").sql
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
	in git zsh
	cat ~/.ssh/id_rsa.pub | ssh root@$sa 'cat >> ~/.ssh/authorized_keys'
	git config --global user.email
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
		zparseopts -A ARGUMENTS m:
	m=$ARGUMENTS[-m]
	
	if [[ -f $2 ]];then
	while read name;do;youtube-dl $name;done < $2;return;fi
	
	typeset -A a_array
	a_array=(
	'chill decem' 'GHeMUZ0dbKI'
       'ronson' 'OPf0YbXqDm0')


	for k in "${(@k)a_array}"; do
	  youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=$a_array[$k]"
	done
	for f in *.webm; do
		mv $f /cygdrive/h
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
alias os="echo $os"


#cd's
alias ar="cd ~/arduino"
alias y="cd"
alias da="cd ~/django"
alias dow="cd $dowDir"
alias mu="cd ~/musik"
alias mte='cd $mteDir'
alias o='cd $ZSH_CUSTOM'
alias oh='cd $ZSH'
alias un='cd $un'
alias uc='cd $un/c'
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
alias w="dict -d fd-eng-deu"
alias w2="dict"


# Editoren
alias v="vim"

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
alias po='ec $prompt'
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


# Rest
alias ab="b $ab"
alias alb="b $alb"
#alias arc="echo $arc"
alias cb="b $cb"
alias -g com="$cb"
alias -g h="--help |less"
alias lb="b $lb"
alias lsb='ec $lsb'
alias ob='b $ob'
alias rb="b $rb"
alias ub="b $ub"

#ssh
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 
alias -g sc=/etc/ssh/sshd_config 
alias sd='sshd;ph' 

#tmux
alias ta="tmux attach"
alias tk="tmux kill-session"
alias tl="tmux ls"
alias tm="tmux"


# zsh
alias e="exec zsh"
alias ohmyzsh='b $oh'
alias ohm='sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
alias plu='ec $plugins'
alias -g zr='$zr' # zshrc 
alias zt="ec $ZSH_THEME"


alias aa='amixer -q sset Master 3%-'
alias ac='ack -i'
alias bb='amixer -q sset Master 3%+;amixer get Master'
alias c='cat'
alias dt='date +"%T"'
alias dh='df -h'
alias dowDir='l $dowDir'
alias duh='du -h'
alias ecl="/root/progr/eclipse/eclipse & "
alias ec="echo"
alias g+="g++"
alias ja="java"
alias le='less -WiNS'
alias m='man'
alias mt='man terminator'
alias -g n2='|less'
alias r="expect $lb"
alias rf='rfkill list'
alias -g sa='$sa'
alias -g sm='$sm'
alias ter='if [ $os != "CYGWIN_NT-6.1" ]; then;terminator &;fi'
alias tp='top'
alias tr='tree'
alias -g ve='--version'
alias x='exit'
alias x+='xbacklight -set 40'
alias x-='xbacklight -dec 10'
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'

echo "$0 aktualisiert"
