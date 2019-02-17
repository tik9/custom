ti='de63721500 0000 5052 4271 181'
ak=`ls -t|head -1`

ad=$ZSH_CUSTOM/plugins/android/android.plugin.zsh
co2=plugins/common-aliases/common-aliases.plugin.zsh; co=$ZSH_CUSTOM/$co2
cy2=plugins/cygwin/cygwin.plugin.zsh; cy=$ZSH_CUSTOM/$cy2
db=$ZSH_CUSTOM/plugins/debian/debian.plugin.zsh
dj=$ZSH_CUSTOM/plugins/django/django.plugin.zsh
gi=$ZSH_CUSTOM/plugins/git/git.plugin.zsh
py=$ZSH_CUSTOM/plugins/python/python.plugin.zsh

zr=~/.zshrc
ds=/storage/emulated/0

bi=/home/t/bilder
dc=$ds/DCIM/Camera
doa=$ds/Download
dod=/home/t/Downloads
mu=/root/musik
mua=$ds/music
th=/data/data/com.termux/files/home
wa="$ds/WhatsApp/Media/WhatsApp\ Images"

os=`uname -a |cut -d' ' -f 1`

declare -A adr
adr[tk]='user153015@gmail.com' ; alias -g tk="ec $adr[tk]"
adr[t]='01573 9598 220 1'

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
	sed -i "s/\(cal 2019 |head -n\) [0-9][0-9]\( | tail -n\) [0-9][0-9]/\1 $1\2 $2/" $co
	exec zsh
}

function p_rm {
	sed -i 's/ [a-z-]\+)/)/' $zr
	exec zsh; 
}


function p_add {
	sed -i "s/\(^plugins=.*\))/\1 $1)/" $zr
	exec zsh
}


function arg {
	((!$#)) && echo Keine Argumente!||echo args! $@
}

function alterKern(){
	dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p'
	#sed -n '/'`uname -r`'/q;p' : Druckt zeilen vor aktuellem Kernel
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


function ki {
		killall $1;
		echo "Prozesse mit $1 \n"
		ps -ef|grep $1
}


function kue {
	((!$#)) && 	dat=`ls -t | head -1` || dat=$1
	neu=$(echo "$dat"| sed 's/\(.*\)................\(\..*\)/\1\2/')
	mv "$dat" $neu
}


function lö {
	rm -rf "$@";ls
}

	
function pr2(){
	grep $1 =(ps aux)
}


function tse {
	nr=`ssh $im -p8022 termux-contact-list |jq -r --arg wert "$1" '.[] | select(.name==$wert)|.number'`
	echo $nr
	ssh $im -p8022 	termux-sms-send -n "$nr \"${@:2}\""

}

function ti {
	ssh $im -p8022 termux-sms-inbox
}


function tnr {
	termux-contact-list |jq -r --arg v1 "$1" '.[] | select(.name==$v1)|.number'
	}


function upload {
	csrf=AzhMJQpnEuMHFneLdAL7Hp2CessJySSBKypcoVDSnXjTQtn0oHBvkrXbDk3GfDM8
	#for f in * ; do
		curl -F "dat=@$1" --cookie csrftoken=$csrf -H "X-CSRFToken: $csrf" localhost:8000/$2
	#done
}


function vi1 {
	ssh $im -p8022 "ls $dc"
}


function vid(){
	verz=/home/pi/django/media
	
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
	ssh $im -p8022 "ls $wa $dc"
	ssh $im -p8022 "rm $dc/* $wa/*"
	ssh $im -p8022 "echo nun leer; ls $dc $wa"
}


function wab {
	ssh -p8022 $im "ls $wa"
	scp -P8022 $im:$wa/"*" root@$il:/home/t/bilder/
	cd /home/t/bilder
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
alias be=/home/t/bewerbung
alias bi=$bi
alias cv=/root/cv
alias dod=$dod
alias mus=$mu
alias o=$ZSH_CUSTOM
alias oh=$ZSH
alias sa='/etc/nginx/sites-available;ls'
alias se='/etc/nginx/sites-enabled; ls'
alias y='cd; l'

#curl
alias cu=curl


#find
alias fin='find . -type f -name'

alias ff="find / -xdev -name"

#grep
alias -g gr="|grep -ai"
alias grep="grep -i"


#ip's
alias ipi='curl ipinfo.io/ip'


# Konsole
alias hist=history
alias ho='ec $HOST'
alias tt=tty

# ls
alias l='ls -lh'
alias ll='ls | less'
alias lt='ls -lht | less'

#mysql

# plugins
alias co="b $co"
alias db="b $db"
alias gi="b $gi"

# ps
alias ks="ph; ki ssh; ph"
alias pp='pr python'
alias pr='ps -ef|grep'


#ssh
alias cida='ar; cp idr .; gi "id rsa kopiert" ; c idr' 
alias cida2='ar; gl; c id_rsa.pub >> ida; c ida' 
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 
alias ph='pr ssh'
alias sr='ssh root@$ir'
alias ss='ssh -p8022 $im'

# zsh
alias e="exec zsh"
alias plu='ec $plugins'
alias x=exit
alias zb='b $zr'
alias -g zr='$zr' # zshrc 


alias c=cat
alias cm='cal 2019 |head -n 10 | tail -n 10'
alias dh='df -h'
alias da='date +"%T"'
alias dt='date +"Tag %d"'
alias di=dict
alias ec=echo
alias -g le='|less'
alias -g hel="--help |less"
alias es=less
alias m=man
alias pw=pwd
alias r='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias sl=sleep
alias to=touch
alias tp=top
alias v2='cd $dp/media; find . -maxdepth 1 -type f -exec mv {} alt \;'

alias -g ve=--version
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'
