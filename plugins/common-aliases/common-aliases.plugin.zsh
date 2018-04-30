
a=$ZSH_CUSTOM/plugins/android/android.plugin.zsh

co2=plugins/common-aliases/common-aliases.plugin.zsh; co=$ZSH_CUSTOM/$co2
cy2=plugins/cygwin/cygwin.plugin.zsh; cy=$ZSH_CUSTOM/$cy2

gi2=plugins/git/git.plugin.zsh
gi=$ZSH_CUSTOM/$gi2

lo=$ZSH_CUSTOM/login

py=$ZSH_CUSTOM/plugins/python/python.plugin.zsh

ub2=plugins/ubuntu/ubuntu.plugin.zsh
ub=$ZSH_CUSTOM/$ub2
zr=~/.zshrc

bi=/root/bilder
ds=/storage/emulated/0
mu=$ds/music

th=/data/data/com.termux/files/home

os=`uname -a |cut -d' ' -f 1`

declare -A ad
ad[ss]='sstirner@konzertagentur-koerner.de';alias -g s2=$ad[ss]
ad[tk]='user153015@gmail.com' ; alias -g tk=$ad[tk]
ad[t]='01573 9598 220'
ad[uk]='ukoerner@konzertagentur-koerner.de' ;alias -g uk=$ad[uk]
ad[vk]='4917671214205' ;alias -g vk=$ad[vk]

irb=188.194.163
iro=.73
ir=$irb$iro

sm=192.168.43

# plugins
alias ab="b $an"
alias cb="b $co"
alias ub="b $ub"


function arg(){
	# if [ -z $1 ];then;echo Argument fehlt;return; fi
	((!$#)) && echo Keine Argumente!||echo args! $@
}

function alterKern(){
	dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p'
	#sed -n '/'`uname -r`'/q;p' : Druckt Zeilen vor aktuellem Kernel
}

function cl(){
	(( !$#)) && po=''||po=$1 
	(( !# $2)) && da=''||da=$2 
	#curl localhost:$po
	#echo $po
	curl localhost:$po/$da
}

function cl2(){
	sed -i "s/\(cal 2018 he -n\) [0-9][0-9]/\1 $1/" $co
	exec zsh
}


function cur(){
	curl -f $ir && echo Erfolg || echo Keine Verbindung
}


function ersetz(){
	#for file in *; do
		file=$1
		if [[ $file =~ \  ]];then
			#echo Leerzeichen: $file
			neu="${file// /_}"
			mv $file $neu
		fi
		file=$neu
		if [[ $file =~ '[A-Z]' ]];then
			rename 'y/A-Z/a-z/' $file
		fi
		if [[ `pwd` = '$home2/uni/' && $file != *""* ]]; then
			neu=$2_$file
			mv $file $neu
		fi
	echo $neu
	#done
}

function hs(){
	((!$#)) && beginn='' || beginn=$1
	fc -li $beginn |less
}


function i(){
	url='https://www.accuweather.com/en/de/hof/95028/weather-forecast/172202'
	wget -q -O- "$url" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $2=($2=="day"?"Tag":"Nacht")", " $12 "°" ", " substr($1, 41, 12) $13 ", " }'| head -1|awk -F, '{print $1 $2 $3 $4 split($5, a, "\""); print a[2]}' 
}


function j(){
	letztes=''
	if [ -z $1 ]; then ; letztes='cut -d. -f4'; fi
	ip addr show wlan0 | sed  -n -E 's/inet ([0-9.]*).*/\1/p'| eval $letztes
}


function k(){
	kill -9 $1

	if [ -z "grep $1 =(ps aux)" ];then
		echo Prozess gekillt
	fi
	
	echo "Prozesse mit $1 \n";
	ps -ef|grep $1
}


function ki(){
		killall $1;
		echo "Prozesse mit $1 \n"
		ps -ef|grep $1
}

function ku(){
	((!$#)) && 	dat=`ls -t | head -1` || dat=$1
	#for dat in *;do
	neu=$(echo "$dat"| sed 's/\(.*\)................\(\..*\)/\1\2/')
	mv "$dat" $neu
	echo $neu
	#done
	l
}


function lö(){
	rm -rf "$@";ls -a
}


function pa(){
	sed -i "s/\(^plugins=.*\))/\1 $1)/" $zr
	exec zsh
}

function pk(){
	pkill $1; p2 $1
}
	
function pr2(){
	grep $1 =(ps aux)
}


function prm(){
	sed -i 's/ [a-z-]\+)/)/' $zr
	exec zsh; 
}


function sc(){
	zparseopts -A ARGUMENTS d: f: i: ip: o: p: u:
	
	dir=$ARGUMENTS[-d]; 	if [ -z $dir ];then; dir=/root/musik;fi 
	datei=$ARGUMENTS[-f]; 	if [ -z $datei ];then; datei=`ls -t |head -n1`;fi
	ip=$ARGUMENTS[-ip];		if [ -z $ip ];then; ip=$sm;fi
	oktett=$ARGUMENTS[-o];	if [ -z $oktett ];then; oktett=162;fi
	port=$ARGUMENTS[-p];	if [ -z $port ];then; port=8022;fi
	user=$ARGUMENTS[-u]; 	if [ -z $user ];then; user=root;fi

	printf "Datei: %s/%s, Port: %s, Ip: %s\n" $dir $datei $port "$ip.$oktett" 
	scp -P $port $datei $user@$ip.$oktett:$dir
	#rm $datei
}


function schieb(){
	((!$#)) && 	nr=1 || nr=$1
	echo "`ls -t $dowDir | head -n $nr` \n"

	for i in `seq 1 $nr`
		mv $dowDir/"`ls -t $dowDir | head -n1`" .
}


function scmysql(){
	mysqldump d> $(date +"%m_%Y").sql
	scp -P $1 `ls -t | head -n1` 0.tcp.eu.ngrok.io:/root/sqlBack 
	#rm $(date +"%m_%Y").sql
}


function ss(){
	((!$#)) && okt=1 || okt=$1
	ssh -p8022 root@$sm.$okt
}

function wlans(){
	#iwlist wlan0 scan | sed  -n 's/ESSID:"\(.*\)"/\1/p; s/Quality\([0-9]{2}/[0-9]{2}\)"/Qualität \1/p'
	iwlist wlan0 scan | sed  -n 's/ESSID:"\(.*\)"/\1/p' | sort
}


function uz(){
	$dowDir
	unzip `ls -t|head -1` -d $1
	#rm *.zip
	mv $1 $OLDPWD
	rm $1
	
	$OLDPWD
}

# alias/Funktionen
alias d='declare -f'
alias p='alias|grep'
alias t='type'
alias w='alias -m'


#cd's
alias ar=~/arduino
alias -g bi=$bi
alias -g dow=$dowDir
alias mus=~/musik
alias o=$ZSH_CUSTOM
alias oh=$ZSH
alias pw=pwd
alias un=~/uni
alias y=cd

#curl
alias cu=curl


#find
alias ff='find . -type f -name'
alias fin="find / -name"

#grep
alias -g gr="|grep -ai"
alias grep="grep -i"
alias hgrep="fc -El 0 | grep"


# head / tail
alias -g he='|head'
alias ta='tail -f'
alias -g ti='| tail'


# Konsole
alias hist=history
alias ho='ec $HOST'
alias tt=tty
alias us='ec $USER'

# ls
alias lf='ls f'

#mysql
alias msd='mysql -uroot d'
alias mst='mysql -uroot d -e "show tables"'


# netzwerk
alias pn='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias -g ir=$ir

# ps
alias ks="ph; ki ssh; ph"
alias ph="pr ssh"
alias pp='pr python'
alias pr='ps -ef|grep'

#remote
alias -g ir='ec $ir'
alias sm='ec $sm'

#ssh
alias cia='c ida f'
alias -g cida_lokal='c idr >> ida; c ida' 
alias cida='ar; cp idr .; ga; gi "id rsa kopiert"' 
alias cida2='ar; gl; c id_rsa.pub >> ida; c ida' 
alias cir='c idr' 
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 


# zsh
alias e="exec zsh && ec ha we; !-2"
alias plu='ec $plugins'
alias x=exit
alias zb='b $zr'
alias -g zr='$zr' # zshrc 


alias c=cat
alias cm='cal 2018 he -n 16'
alias dh='df -h'
alias dat='date +"%T"'
alias ecl="/root/progr/eclipse/eclipse & "
alias ec=echo
alias -g f='|less'
alias -g h="--help |less"
alias le='less -WiNS'
alias m=man
alias n=dict
alias os="echo $os"
alias r="expect $lo"
alias so=source
alias v='ack -iw'
alias -g ve=--version
alias x+='xbacklight -set 40'; alias x-='xbacklight -dec 10'
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'
alias zp='source ~/.zprofile'

echo "Common Alias aktualisiert"
