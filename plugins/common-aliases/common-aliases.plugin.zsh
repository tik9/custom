ar=plugins/archlinux/archlinux.plugin.zsh

an2=plugins/android/android.plugin.zsh
an=$ZSH_CUSTOM/$an2

co2=plugins/common-aliases/common-aliases.plugin.zsh; co=$ZSH_CUSTOM/$co2
cy2=plugins/cygwin/cygwin.plugin.zsh; cy=$ZSH_CUSTOM/$cy2

dj2=plugins/django/django.plugin.zsh; dj=$ZSH_CUSTOM/$dj2

gi2=plugins/git/git.plugin.zsh
gi=$ZSH_CUSTOM/$gi2

lo=$ZSH_CUSTOM/login
oh=$ZSH_CUSTOM/oh-my-zsh.sh

py=$ZSH_CUSTOM/plugins/python/python.plugin.zsh

re2=functions/_rest;re=$ZSH_CUSTOM/$re2

to=$ZSH_CUSTOM/todo
ub2=plugins/ubuntu/ubuntu.plugin.zsh
ub=$ZSH_CUSTOM/$ub2
zr=~/.zshrc

un=~/uni
dt=/data/data/com.termux/files/home
dtm=~/storage/music


os=`uname -a |cut -d' ' -f 1`

declare -A ad
ad[ss]='sstirner@konzertagentur-koerner.de'
ad[tk]='user153015@gmail.com';alias -g tk=$ad[tk]
ad[t2]='studienkreis.timo.koerner@gmail.com';alias -g t2=$ad[t2]
ad[t]='01573 9598 220'
ad[uk]='ukoerner@konzertagentur-koerner.de' #;alias -g uk=$ad['uk']

sa=188.194.163.73
sm=192.168.43
sv=192.168.182.129
svi=ens33

# plugins
alias anb="b $an"
alias arb="b $ar"
alias cb="b $co"
alias -g com="$co"
alias cyb="b $cy"
alias gic="c .gitignore"
alias gb="b $gi"
alias lb="b $lo"
alias ob="b $oh"
alias rb="b $re"
alias tb="b $to"
alias ub="b $ub"
alias zb='b $zr'
alias -g zr='$zr' # zshrc 

function arg(){
	# if [ -z $1 ];then;echo Argument fehlt;return; fi
	((!$#)) && echo Keine Argumente!||echo args!
}


aaa(){
	while true;do
		echo `curl ifconfig.me` `date` >> ifco
		sleep 30m
	done
	trap int_trap INT
}

function er(){
	neueste=`ls -t | head -1`
	((!$#)) && 	var=$neueste || var=$1
	echo Datei $var
	mv $var $(echo $var| sed -e 's/\(.*\)................\(\..*\)/\1\2/')
}

function cua2(){
	curl -f $sa:8000 && echo Erfolg || echo Keine Verbindung
}

function cua(){
	pkill -P $$
	trap int_trap int
	while true; do
		cua2
		echo "telnet/curl $sa 8000"
		#curl localhost:8000
		sleep 30m 
		echo $(date +"%T")
	done
}


function ersetz(){
	for file in *; do
		if [[ $file =~ \  ]];then
			echo Leerzeichen: $file
			neu="${file// /_}"
			mv $file $neu
		$(v_ersetz++)
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
	echo "\nDateien nach Op\nAnzahl Ersetzung: $v_ersetz"
	for f in *;do;echo $f;done
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
	echo $(echo `ip2` | cut -d . -f -3)	
}


function ipd(){
	ip link set wlan0 down
}
compdef _ip ipd


function ipu(){
		ip link set wlan0 up
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

function lö(){
	rm -rf "$@";ls -a
}

function mai(){
		zparseopts -A arg b: t: a:
		
	printf "Subject:$arg[-b]\n${arg[-t]} Gruß,Timo" |msmtp $ad[$arg[-a]]
	#printf "Subject:test betreff\ntest body eintrag" |msmtp $ad['tk']
	tail -n5 ~/.msmtp.log
}
compdef _ma mai

function ma2(){
	if [ -z $1 ];then;echo Argument fehlt;return; fi
	cat email|msmtp $ad[$1] $ad[$2]	
	tail -n5 ~/.msmtp.log
}


function ml(){
	zparseopts -A ARGUMENTS l: m:
	cd ~/musik
	ffprobe $1 2> >(grep Duration)

	mplayer $1  
}


function pe(){
	sed -i "s/\(^plugins=\).*/\1(common-aliases git git-prompt ubuntu zsh-autosuggestions $1)/" $zr
	exec zsh
}

function pe2(){
	sed -i 's/ [a-z]\+)/)/' $zr
}
	
function p2(){
	grep $1 =(ps aux)
}


function sc2(){
	zparseopts -A ARGUMENTS d: f: i: ip: o: p: u:
	
	dir=$ARGUMENTS[-d]; 	if [ -z $dir ];then;dir=/root/musik;fi 
	datei=$ARGUMENTS[-f]; 	if [ -z $datei ];then;datei=`ls -p | grep -v / |head -n1`;fi
	ip=$ARGUMENTS[-ip];		if [ -z $ip ];then;ip=$sm;fi
	oktett=$ARGUMENTS[-o];	if [ -z $oktett ];then;oktett=.162;fi
	port=$ARGUMENTS[-p];	if [ -z $port ];then;port=8022;fi
	user=$ARGUMENTS[-u]; 	if [ -z $user ];then;user=root;fi

	#for datei in *.webm;do
		printf "Dir: %s, Datei: %s, Port: %s, Ip: %s", $dir,$datei, $port, $ip
		scp -P $port $datei $user@$ip$oktett:$dir
	#done
	#rm -rf $datei
}
compdef _sc2 s2

function s2(){ssh -p8022 root@$sm.$1}

function schieb(){
	for i in `seq 1 $1`
	echo ls|head -n1	
	cp $dowDir/`ls -t $dowDir | head -n1` .
}

compdef _schieb schieb

function scmysql(){
	mysqldump d> $(date +"%m_%Y").sql
	scp -P $1 `ls -t | head -n1` 0.tcp.eu.ngrok.io:/root/sqlBack 
	#rm $(date +"%m_%Y").sql
}


function si(){
	secs=$(($1 * 60))
	while [ $secs -gt 0 ]; do
	   echo -ne "$secs\033[0K\r"
	   sleep 1; : $((secs--))
	done
	eval $2
}


function unt(){
	#schieb;	#a=$(schieb)
	#cd `pwd`
	# gz: z flag
	a=`ls -t | head -n1`
	tar zxvf $a ;#rm $a
}

function we(){
	URL='https://www.accuweather.com/en/de/hof/95028/weather-forecast/172202'
	wget -q -O- "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $2": "$13", "$12"°" }'| head -1
}


function y2(){
		zparseopts -A ARGUMENTS m:
	m=$ARGUMENTS[-m]
	
	if [[ -f $2 ]];then
	while read name;do;youtube-dl $name;done < $2;return;fi
	
	typeset -A a_array
	a_array=(
	'baby duck' 'tFoUuFq3vHw&t=16s'
       '' '')

	for k in "${(@k)a_array}"; do
	 # youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=$a_array[$k]"
	 youtube-dl -o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=$a_array[$k]"
	done
	
	#ersetz
	# ffmpeg -i *.webm `ls -t |head -1|cut -d. -f -1`.mp3 
	# sc2 -o .238 -ip 10.1.31 -f "`ls  *.mp3 |head -1`" -d $dt/$dtm
	sc2 -o .56 -ip 192.168.188 -f "`ls |head -1`" -d $dt/$dtm
}
compdef _yt2 yt2

 
# alias/Funktionen
alias al='alias|grep'
alias d='declare -f'
alias t='type'
alias w='alias -m'
alias ua='unalias'
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
alias mt='cd $mteDir'
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


#Dateien
alias cp='cp -r'
alias lk="lsblk"

alias to='touch'

#Dict
alias wl="echo Dict.;dict -D"
alias di="dict -d fd-eng-deu"
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
alias hs='fc -li 9950 n2'
alias ho='ec $HOST'
alias pg='pgrep -P $$'
alias po='ec $prompt'
alias pz='pr3 zsh'
alias tt='tty'
alias us='ec $USER'


#mysql
alias msd='mysql -uroot d'
alias mst='mysql -uroot d -e "show tables"'


# netzwerk
alias f='iwgetid -r'
alias i2='curl ifconfig.me'
alias ii='iw2 n2'
alias iw2='iwlist wlan0 scan'
alias j=ifconfig
alias mi='echo $(dig +short myip.opendns.com @resolver1.opendns.com)'
alias pn='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias -g re='$sa'
alias z='/etc/init.d/networking restart'

# ps
alias ks="ki ssh;ph"
alias ksl="ki sl;ph"
alias ph="pr ssh"
alias pr='ps -ef|grep'
alias pl="pr sleep"
alias -g sl="sleep"


#ssh
alias cp_idrsa="cat ~/.ssh/id_rsa.pub | ssh root@$sa 'cat >> ~/.ssh/authorized_keys'"
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 
alias -g sc=/etc/ssh/sshd_config 
alias sd='sshd;ph' 

#tmux
alias ta="tmux attach"
alias tl="tmux ls"
alias tm="tmux"


# zsh
alias e="exec zsh"
alias ohm='sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
alias plu='ec $plugins'
alias zt="ec $ZSH_THEME"


alias aa='amixer -q sset Master 3%-;amixer get Master'
alias ac='ack -i'
alias ad='for k in ${(@k)ad};do ;echo "$k $ad[$k]" ; done'
alias bb='amixer -q sset Master 3%+;amixer get Master'
alias c='cat'
alias dt='date +"%T"'
alias dh='df -h'
alias dowDir='l $dowDir'
alias duh='du -h'
alias ecl="/root/progr/eclipse/eclipse & "
alias ec="echo"
alias g+="g++"
alias -g h="--help |less"
alias ja="java"
alias le='less -WiNS'
alias m='man'
alias ma='mail'
alias mte='man terminator'
alias -g n2='|less'
alias r="expect $lo"
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
