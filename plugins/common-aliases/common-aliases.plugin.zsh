
a=$ZSH_CUSTOM/plugins/android/android.plugin.zsh

co2=plugins/common-aliases/common-aliases.plugin.zsh; co=$ZSH_CUSTOM/$co2
cy2=plugins/cygwin/cygwin.plugin.zsh; cy=$ZSH_CUSTOM/$cy2
dj=$ZSH_CUSTOM/plugins/django/django.plugin.zsh
gi=$ZSH_CUSTOM/plugins/git/git.plugin.zsh
py=$ZSH_CUSTOM/plugins/python/python.plugin.zsh
ub=$ZSH_CUSTOM/plugins/ubuntu/ubuntu.plugin.zsh

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


ih=192.168.0; il=$ih.109
mo=135 ; im=$ih.$mo ; 
ra=111; ir=$ih.$ra
irr=188.194.163.73


function arg(){
	# if [ -z $1 ];then;echo Argument fehlt;return; fi
	((!$#)) && echo Keine Argumente!||echo args! $@
}

function alterKern(){
	dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p'
	#sed -n '/'`uname -r`'/q;p' : Druckt zeilelen vor aktuellem Kernel
}

function cl(){
	(( !$#)) && po=''||po=$1 
	(( !# $2)) && da=''||da=$2 
	curl localhost:$po/$da
}

function cm2(){
	sed -i "s/\(cal 2018 |head -n\) [0-9][0-9]\( | tail -n\) [0-9]/\1 $1\2 $2/" $co
	exec zsh
}


function ersetz(){
		
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

function ex(){
	if [[ `ip addr show wlan0 | sed  -En 's/   inet ([0-9.]*).*/\1/p'|sed -e 's/^ //' | cut -f -3 -d .` = 192.168.0 ]]; then
	
	#expect $ZSH_CUSTOM/login
		ssh root@192.168.0.111
	else
		ssh root@$irr
	fi
}

function ge(){
	grep -r $1 * 	
}


function hs(){
	((!$#)) && beginn='' || beginn=$1
	fc -li $beginn |less
}


function i(){
	date +%T
	url='https://www.accuweather.com/en/de/hepberg/85120/weather-forecast/172784'
	wget -q -O- $url | awk -F\' '/acm_RecentLocationsCarousel\.push/{ print$0 } ' |head -1
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

function sc2(){
	scp $1  $il:/root

}

function scmysql(){
	mysqldump d> $(date +"%m_%Y").sql
	scp -P $1 `ls -t | head -n1` 0.tcp.eu.ngrok.io:/root/sqlBack 
	#rm $(date +"%m_%Y").sql
}


function ss(){
	((!$#)) && ok=$mo || ok=$1
	ssh -p8022 root@$ih.$ok
	#ssh root@$ih.$ok
}

function s2(){
	((!$#)) && ok=$ra || ok=$1
	ssh root@$ih.$ok
}

function upload {
	curl -F "dat=@$1" --cookie csrftoken=M1XreITl3Ys0DARMvsjmcMQGwJHhsD1be61K9ziuH0JXNlbJKRI8nlgg8yrejeic -H "X-CSRFToken: M1XreITl3Ys0DARMvsjmcMQGwJHhsD1be61K9ziuH0JXNlbJKRI8nlgg8yrejeic" $ir:8000/dat
}


function vid(){
	
	#rasp
	ssh root@$ir "cd $dt/media/pics; mv * .."

	# smart
	scp -P8022 $im:$ds/DCIM/Camera/"*" root@$ir:/root/django/media/pics 
	#scp -P8022 $im:$ds/DCIM/Camera/"*" . 
	#scp * $ir:/root/django/media/pics 
	#scp -P8022 $im:$ds/DCIM/Camera/"*" root@$il:/root/vid 
	
	#lapt
	#cd vid
	#scp * $ir:/root/django/media/pics
}


function vi2(){
		ssh $im -p8022 "rm $ds/DCIM/Camera/*"
}

function vl {
	ffprobe $1 2> >(grep Duration)
}

function we(){
	para=$1
	zeile=1
	#url="https://api.accuweather.com/locations/v1/cities/autocomplete?q=$para&apikey=d41dfd5e8a1748d0970cba6637647d96&language=en-us&get_param=value"
	#para=`wget -q -O- "$url" |jq -r '.[2].Key'`

	url='https://www.accuweather.com/en/de/hepberg/85120/weather-forecast/172202'
	#url="https://www.accuweather.com/ajax-service/select-city?cityId=$para&lang=de"
		
	downl=`wget -q -O- "$url"`
	
	tag=`echo "$downl" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$2}' | awk "NR==$zeile"`
	tempg=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$12}' |awk "NR==$zeile"`
	tempe=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$10}' | awk "NR==$zeile"`
	ort=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$1}' | awk "NR==$zeile"`
	text=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$13}' | awk "NR==$zeile"`
	
	ort=`echo "$ort"| awk -F\" '{print $2}'`
	text=`echo "$text"| awk -F\" '{print $2}'`
	echo $tag - gefühlt: $tempg -echt: $tempe - $ort - $text
}


function wlans(){
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
alias mus=~/musik
alias o=$ZSH_CUSTOM
alias oh=$ZSH
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


# plugins
alias cb="b $co"
alias ub="b $ub"

# ps
alias ks="ph; ki ssh; ph"
alias ph="pr ssh"
alias pp='pr python'
alias pr='ps -ef|grep'

#ip's
alias ir='ec $ir'
alias irr='ec $irr'
alias -g im='ec $im'

#ssh
alias cia='c ida f'
alias -g cida_lokal='c idr >> ida; c ida' 
alias cida='ar; cp idr .; gi "id rsa kopiert" ; c idr' 
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
alias cm='cal 2018 |head -n 23 | tail -n 100'
alias dh='df -h'
alias da='date +"%T"'
alias di=dict
alias ec=echo
alias -g f='|less'
alias -g h="--help |less"
alias le=less
alias m=man
alias pw=pwd
alias r='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias so=source
alias tp=top
alias -g ve=--version
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'

echo "Common Alias aktualisiert"
