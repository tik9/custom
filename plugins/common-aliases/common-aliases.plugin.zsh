
a=$ZSH_CUSTOM/plugins/android/android.plugin.zsh

co2=plugins/common-aliases/common-aliases.plugin.zsh; co=$ZSH_CUSTOM/$co2
cy2=plugins/cygwin/cygwin.plugin.zsh; cy=$ZSH_CUSTOM/$cy2
dj=$ZSH_CUSTOM/plugins/django/django.plugin.zsh
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

us=/media/t/BACKUP

th=/data/data/com.termux/files/home

os=`uname -a |cut -d' ' -f 1`

declare -A ad
ad[tk]='user153015@gmail.com' ; alias -g tk=$ad[tk]
ad[t]='01573 9598 220'
ad[uk]='ukoerner@konzertagentur-koerner.de' ;alias -g uk=$ad[uk]
ad[vk]='4917671214205' ;alias -g vk=$ad[vk]

ir=188.194.163.73

im=192.168.43


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

function cm2(){
	sed -i "s/\(cal 2018 he -n\) [0-9][0-9]/\1 $1/" $co
	exec zsh
}


function cur(){
	curl -f $ir && echo Erfolg || echo Keine Verbindung
}


function ersetz(){
		#file=$1
		#if [[ $file =~ \  ]];then
			#neu="${file// /_}"
			#mv $file $neu
		#fi
		#file=$neu
		#if [[ $file =~ '[A-Z]' ]];then
			#rename 'y/A-Z/a-z/' $file
		#fi
		
		if [[ $1 = VID* ]]; then
			echo Video
			mv $1 `echo "$1" |sed 's/\(VID_.*\)_.*\(\.3gp\)/\1\2/'`
		fi
		if [[ $1 = IMG* ]]; then
		echo Bild
		mv $1 `echo "$1" |sed 's/\(IMG-.*\)-.*\(\.jpg\)/\1\2/'`
		fi
	#echo $neu
}

function hs(){
	((!$#)) && beginn='' || beginn=$1
	fc -li $beginn |less
}

function i(){
	date +%T
	url='https://www.accuweather.com/en/de/hof/95028/weather-forecast/172202'; wget -q -O- $url | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$12"°"} ' |head -1
}

function j2(){
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
	neu=$(echo "$dat"| sed 's/\(.*\)................\(\..*\)/\1\2/')
	mv "$dat" $neu
	echo $neu
	l
}


function lö(){
	rm -rf "$@";ls
}


function pad(){
	sed -i "s/\(^plugins=.*\))/\1 $1)/" $zr
	exec zsh
}

function pa(){
	if [ $# -eq 2 ];then; outp=$2 ; else ;outp=$1;fi
	echo $2
	pandoc -V geometry:margin=1in -o $outp.pdf $1.md ; mupdf $outp.pdf
}

function pk(){
	pkill $1; p2 $1
}
	
function pr2(){
	grep $1 =(ps aux)
}


function p_rm(){
	sed -i 's/ [a-z-]\+)/)/' $zr
	exec zsh; 
}


function sc(){
	zparseopts -A ARGUMENTS d: f: i: ip: o: p: u:
	
	dir=$ARGUMENTS[-d]; 	if [ -z $dir ];then; dir=/root/musik;fi 
	datei=$ARGUMENTS[-f]; 	if [ -z $datei ];then; datei=`ls -t |head -n1`;fi
	ip=$ARGUMENTS[-ip];		if [ -z $ip ];then; ip=$im;fi
	oktett=$ARGUMENTS[-o];	if [ -z $oktett ];then; oktett=162;fi
	port=$ARGUMENTS[-p];	if [ -z $port ];then; port=8022;fi
	user=$ARGUMENTS[-u]; 	if [ -z $user ];then; user=root;fi

	printf "Datei: %s/%s, Port: %s, Ip: %s\n" $dir $datei $port "$ip.$oktett" 
	scp -P $port $datei $user@$ip.$oktett:$dir
	#rm $datei
}


function scmysql(){
	mysqldump d> $(date +"%m_%Y").sql
	scp -P $1 `ls -t | head -n1` 0.tcp.eu.ngrok.io:/root/sqlBack 
	#rm $(date +"%m_%Y").sql
}


function ss(){
	((!$#)) && ok=1 || ok=$1
	ssh -p8022 root@$im.$ok
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


function we2(){
	#para=$1
	para=hof
	url="https://api.accuweather.com/locations/v1/cities/autocomplete?q=$para&apikey=d41dfd5e8a1748d0970cba6637647d96&language=en-us&get_param=value"

	wget -q -O- "$url" |jq -r '.[2] | .LocalizedName + " "+ .Key + " "+ .AdministrativeArea.LocalizedName'
	
	url="https://www.accuweather.com/ajax-service/select-city?cityId=$para&lang=en-us"
}

function wea(){
	para=$1
	zei=1
	url="https://api.accuweather.com/locations/v1/cities/autocomplete?q=$para&apikey=d41dfd5e8a1748d0970cba6637647d96&language=en-us&get_param=value"
	para=`wget -q -O- "$url" |jq -r '.[2].Key'`

	#url='https://www.accuweather.com/en/de/hof/95028/weather-forecast/172202'
	url="https://www.accuweather.com/ajax-service/select-city?cityId=$para&lang=de"
		
	downl=`wget -q -O- "$url"`
	
	tag=`echo "$downl" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$2}' | awk "NR==$zei"`
	tempg=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$12}' |awk "NR==$zei"`
	tempe=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$10}' | awk "NR==$zei"`
	ort=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$1}' | awk "NR==$zei"`
	text=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$13}' | awk "NR==$zei"`
	
	ort=`echo "$ort"| awk -F\" '{print $2}'`
	text=`echo "$text"| awk -F\" '{print $2}'`
	echo $tag - gefühlt: $tempg -echt: $tempe - $ort - $text
	
}

# alias/Funktionen
alias d='declare -f'
alias p='alias|grep'
alias t='type'
alias w='alias -m'


#cd's
alias ar=~/arduino
alias -g bi=$bi
alias -g kl=~/kl
alias mus=~/musik
alias o=$ZSH_CUSTOM
alias oh=$ZSH
alias pw=pwd
alias un=~/uni
alias y=cd

#curl
alias cu=curl


#find
alias fin='find . -type f -name'
alias ff="find / xdev -name"

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
#alias us='ec $USER'

# ls
alias l='ls -lh'
alias ll='ls f'
alias lt='ls -t'

#mysql
alias msd='mysql -uroot d'
alias mst='mysql -uroot d -e "show tables"'


# netzwerk
alias r='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias -g ir=$ir

# plugins
#alias ab="b $a"
alias cb="b $co"
alias ub="b $ub"

# ps
alias ks="ph; ki ssh; ph"
alias ph="pr ssh"
alias pp='pr python'
alias pr='ps -ef|grep'

#remote
alias -g ir='ec $ir'
alias -g im='ec $im'

#ssh
alias cia='c ida f'
alias -g cida_lokal='c idr >> ida; c ida' 
alias cida='ar; cp idr .; ga; gi "id rsa kopiert"' 
alias cida2='ar; gl; c id_rsa.pub >> ida; c ida' 
alias cir='c idr' 
alias cs=~/.ssh 
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 


# zsh
alias e="exec zsh && ec ha we; !-2"
alias plu='ec $plugins'
alias x=exit
alias zb='b $zr'
alias -g zr='$zr' # zshrc 


alias c=cat
alias cm='cal 2018 |head -n 17| tail -n 7 '
alias dh='df -h'
alias dat='date +"%T"'
alias ecl="/root/progr/eclipse/eclipse & "
alias ec=echo
alias ex="expect $lo"
alias -g f='|less'
alias -g h="--help |less"
alias j='wea miami; wea hof'
alias le=less
alias m=man
alias n=dict
alias os="echo $os"
alias us=$us
alias so=source
alias -g ve=--version
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'
alias zp='source ~/.zprofile'

echo "Common Alias aktualisiert"
