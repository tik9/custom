ti='de63721500 0000 5052 4271 181'
ak=`ls -t|head -1`

a=$ZSH_CUSTOM/plugins/android/android.plugin.zsh
co2=plugins/common-aliases/common-aliases.plugin.zsh; co=$ZSH_CUSTOM/$co2
cy2=plugins/cygwin/cygwin.plugin.zsh; cy=$ZSH_CUSTOM/$cy2
db=$ZSH_CUSTOM/plugins/debian/debian.plugin.zsh
dj=$ZSH_CUSTOM/plugins/django/django.plugin.zsh
gi=$ZSH_CUSTOM/plugins/git/git.plugin.zsh
py=$ZSH_CUSTOM/plugins/python/python.plugin.zsh

zr=~/.zshrc

bi=$ho/bilder
ds=/storage/emulated/0
dc=$ds/DCIM/Camera
th=/data/data/com.termux/files/home
mu=/root/musik
wa=$ds/WhatsApp/Media\ Images

dt=/root/django/
tm=$dt/media

os=`uname -a |cut -d' ' -f 1`

declare -A ad
ad[tk]='user153015@gmail.com' ; alias -g tk=$ad[tk]
ad[t]='01573 9598 220 1'


mh=192.168.43 ; iho=$mh.1 # mobil hotspot 
ih=192.168.0; il=$ih.109
#mo=105 ;
mo=108 ;
im=$ih.$mo ; 
#ra=101; 
ra=104; 
ir=$ih.$ra
irr=178.27.248.226


# Bearbeiten von Dateien
function cm2(){
	sed -i "s/\(cal 2018 |head -n\) [0-9][0-9]\( | tail -n\) [0-9][0-9]/\1 $1\2 $2/" $co
	exec zsh
}

function p_rm {
	sed -i 's/ [a-z-]\+)/)/' $zr
	exec zsh; 
}


function p_add(){
	sed -i "s/\(^plugins=.*\))/\1 $1)/" $zr
	exec zsh
}


function arg(){
	((!$#)) && echo Keine Argumente!||echo args! $@
}

function alterKern(){
	dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p'
	#sed -n '/'`uname -r`'/q;p' : Druckt zeilen vor aktuellem Kernel
}

function cl(){
	(( !$#)) && po=''||po=$1 
	(( !# $2)) && da=''||da=$2 
	curl localhost:$po/$da
}


function ersetz {
	if [[ $1 = VID* ]]; then
		echo Video
		mv $1 `echo "$1" |sed 's/\(VID_.*\)_.*\(\.3gp\)/\1\2/'`
	fi
	if [[ $1 = IMG* ]]; then
	echo Bild
	mv $1 `echo "$1" |sed 's/\(IMG-.*\)-.*\(\.jpg\)/\1\2/'`
	fi
}


function hs(){
	((!$#)) && beginn='' || beginn=$1
	fc -li $beginn |less
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


function pk(){
	pkill $1; p2 $1
}
	
	
function pr2(){
	grep $1 =(ps aux)
}



function scmysql {
	mysqldump d> $(date +"%m_%Y").sql
	scp `ls -t | head -n1` $il:/root/sqlBack 
	rm $(date +"%m_%Y").sql
}

function se {
	nr=`ssh $im -p8022 termux-contact-list |jq -r --arg wert "$1" '.[] | select(.name==$wert)|.number'`
	ssh $im -p8022 	termux-sms-send -n "$nr \"${@:2}\""

}


function upload {
	if [ -z $3 ];then; pc=localhost ; else; pc=$3 ; fi
	#echo $pc, $1, $2
	curl -F "dat=@$1" --cookie csrftoken=M1XreITl3Ys0DARMvsjmcMQGwJHhsD1be61K9ziuH0JXNlbJKRI8nlgg8yrejeic -H "X-CSRFToken: M1XreITl3Ys0DARMvsjmcMQGwJHhsD1be61K9ziuH0JXNlbJKRI8nlgg8yrejeic" $pc:8000/$2
}


function vi1 {
	ssh $im -p8022 "ls $dc"
}


function vid(){
	verz=/root/django/media
	
	#rasp

	# smart
	#scp -P8022 $im:$ds/DCIM/Camera/"*" root@$ir:$verz 
	
	scp -P8022 $im:$dc/"*" root@$il:/root/vid 

	#rasp
	#ssh root@$ir 'ls $dt/media'

	#lapt
	#scp $1 $ir:$verz
}

function vi2 {
	ssh $im -p8022 "ls $dc"
	ssh $im -p8022 "rm $dc/*"
	ssh $im -p8022 "echo nun leer; ls $dc"
}


function we2 {
	url='https://www.accuweather.com/en/de/hepberg/85120/weather-forecast/172784'
		
	downl=`wget -q -O- "$url"`
	#echo $downl
	ort=`echo $downl | awk -F\' '/acm_RecentLocationsCarousel\.push/{print$1}' 
	#| awk "NR==$zeile"`
	
	#ort=`echo "$ort"| awk -F\" '{print $2}'`
	#text=`echo "$text"| awk -F\" '{print $2}'`
	echo $ort
}


function we {
	date +%T
	url='https://www.accuweather.com/en/de/hepberg/85120/weather-forecast/172784'
	wget -q -O- $url | awk -F\' '/acm_RecentLocationsCarousel\.push/{ print$0 } ' |head -1
}


function wlans {
	iwlist wlan0 scan | sed  -n 's/ESSID:"\(.*\)"/\1/p' | sort
}


# alias/Funktionen
alias d='declare -f'
alias p='alias|grep'
alias t='type'
alias w='alias -m'


#cd's
alias ar=~/arduino
alias bi=$bi
alias mu=$mu
alias o=$ZSH_CUSTOM
alias oh=$ZSH
alias y='cd; l'

#curl
alias cu=curl


#find
function fin {
	find . -type f -name $1
}

alias ff="find / -xdev -name"

#grep
alias -g gr="|grep -ai"
alias grep="grep -i"
alias hgrep="fc -El 0 | grep"


# head / tail
alias ta='tail -f'
alias -g ti='| tail'

#ip's
alias il='ec $il'
alias im='ec $im'
alias ipi='curl ipinfo.io/ip'
alias ir='ec $ir'


# Konsole
alias hist=history
alias ho='ec $HOST'
alias tt=tty

# ls
alias l='ls -lh'
alias ll='ls | less'
alias lt='ls -lht'

#mysql
alias msd='mysql -uroot d'
alias mst='mysql -uroot d -e "show tables"'


# plugins
alias cb="b $co"
alias db="b $db"
alias gi="b $gi"

# ps
alias ks="ph; ki ssh; ph"
alias ph="pr ssh"
alias pp='pr python'
alias pr='ps -ef|grep'


#ssh
alias cida='ar; cp idr .; gi "id rsa kopiert" ; c idr' 
alias cida2='ar; gl; c id_rsa.pub >> ida; c ida' 
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 
alias sr='ssh root@$ir'
alias ss='ssh -p8022 $im'

# zsh
alias e="exec zsh"
alias plu='ec $plugins'
alias x=exit
alias zb='b $zr'
alias -g zr='$zr' # zshrc 


alias c=cat
alias cm='cal 2018 |head -n 40 | tail -n 10'
alias dh='df -h'
alias da='date +"%T"'
alias dat='date +"Tag %d"'
alias di=dict
alias ec=echo
alias -g le='|less'
alias -g hel="--help |less"
alias -g irc=$ir:/root
alias les=less
alias m=man
alias pw=pwd
alias r='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias sl=sleep
alias to=touch
alias tp=top
alias v2='ssh root@$ir "cd $dt/media; find . -maxdepth 1 -type f -exec mv {} alt \;"'

alias -g ve=--version
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'
