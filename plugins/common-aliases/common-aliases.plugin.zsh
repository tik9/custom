#echo $SHELL

an2=plugins/android/android.plugin.zsh
an=$ZSH_CUSTOM/$an2

co2=plugins/common-aliases/common-aliases.plugin.zsh; co=$ZSH_CUSTOM/$co2
cy2=plugins/cygwin/cygwin.plugin.zsh; cy=$ZSH_CUSTOM/$cy2

gi2=plugins/git/git.plugin.zsh
gi=$ZSH_CUSTOM/$gi2

lo=$ZSH_CUSTOM/login

py=$ZSH_CUSTOM/plugins/python/python.plugin.zsh

ub2=plugins/ubuntu/ubuntu.plugin.zsh
ub=$ZSH_CUSTOM/$ub2
zr=~/.zshrc

ds=/storage/emulated/0
mu=$ds/music

os=`uname -a |cut -d' ' -f 1`

declare -A ad
ad[ss]='sstirner@konzertagentur-koerner.de';alias -g ss=$ad[ss]
ad[tk]='user153015@gmail.com' ; alias -g tk=$ad[tk]
ad[t]='01573 9598 220'
ad[uk]='ukoerner@konzertagentur-koerner.de' ;alias -g uk=$ad[uk]

irb=188.194.163
iro=.73
ir=$irb$iro

sm=192.168.43

# plugins
alias anb="b $an"
alias cb="b $co"
alias cyb="b $cy"
alias gic="c .gitignore"
alias gb="b $gi"
alias lb="b $lo"
alias rb="b $re"
alias ub="b $ub"
alias zb='b $zr'
alias -g zr='$zr' # zshrc 

function arg(){
	# if [ -z $1 ];then;echo Argument fehlt;return; fi
	((!$#)) && echo Keine Argumente!||echo args! $@
}

aa(){
	!-2
}


function cu(){
	curl -f $ir:8000 && echo Erfolg || echo Keine Verbindung
}

function cua2(){
	#pkill -P $$
	trap int_trap INT
	
	while true; do
		cu
		sleep 30m 
		echo $(date +"%T")
	done
}


function er(){
	#((!$#)) && 	dat=`ls -t | head -1` || dat=$1
	for dat in *;do
		echo "Datei $dat \n"
		mv "$dat" $(echo "$dat"| sed 's/\(.*\)................\(\..*\)/\1\2/')
		echo Datei $dat \n
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

		if [[ `pwd` = '$home2/uni/' && $file != *""* ]]; then
			neu=pre_$file
			mv $file $neu
			echo uni pdf: $file
		fi
	done
	echo "\nDateien nach Op\nAnzahl Ersetzung: $v_ersetz"
	for f in *;do;echo $f;done
}

function hs(){
	((!$#)) && beginn='' || beginn=$1
	fc -li $beginn |less
}


function int_trap() {
    echo "Ctrl-C gedrückt"
}


function j(){
	interf=$1
	if [ -z $1 ]; then ; interf=wlan0;fi
	if [[ $1 = all ]]; then ; ip addr show; return; fi
	#ip addr show $interf | grep -o 'inet [0-9.]*'|cut -d' ' -f2
	
	ip addr show $interf | sed  -n -E 's/   inet ([0-9.]*).*/\1/p'|cut -d. -f4
}


function ipbas {
	echo $(echo `j` | cut -d . -f -3)	
}


function ipu(){ip link set wlan0 up}


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


function pa(){
	sed -i "s/\(^plugins=.*\))/\1 $1)/" $zr
	exec zsh && sleep 3
	echo $plugins
}

function pl(){
	sed -i 's/ [a-z-]\+)/)/' $zr
	exec zsh; 
	echo $plugins
}

function pk(){
	pkill $1; p2 $1
}
	
function p2(){
	grep $1 =(ps aux)
}


function rsyn(){
	rsync --numeric-ids -avze ssh $1 root@$sab$sao:/root/p/app1 
}

function sc(){
	zparseopts -A ARGUMENTS d: f: i: ip: o: p: u:
	
	dir=$ARGUMENTS[-d]; 	if [ -z $dir ];then;dir=/root/musik;fi 
	datei=$ARGUMENTS[-f]; 	if [ -z $datei ];then;datei=`ls -t |head -n1`;fi
	ip=$ARGUMENTS[-ip];		if [ -z $ip ];then;ip=$sm;fi
	oktett=$ARGUMENTS[-o];	if [ -z $oktett ];then;oktett=1;fi
	port=$ARGUMENTS[-p];	if [ -z $port ];then;port=8022;fi
	user=$ARGUMENTS[-u]; 	if [ -z $user ];then;user=root;fi

	printf "Dir %s, Datei: %s, Port: %s, Ip: %s\n" $dir $datei $port "$ip.$oktett" 
	scp -P $port $datei $user@$ip.$oktett:$dir
	#rm $datei
}


function schieb(){
	for i in `seq 1 $1`
	echo ls|head -n1	
	cp $dowDir/"`ls -t $dowDir | head -n1`" .
}


function scm(){
	
	dir=$dt$dtm;
	datei=`ls *.mp3|head -1`
	ip=$sm
	oktett=.1
	port=8022

	printf "Dir %s, Datei: %s, Port: %s,  Ip: %s\n" $dir $datei $port $ip$oktett
	scp -P $port $datei $ip$oktett:$dir
	rm -rf $datei	
}

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


function sstat(){service $1 status}
function sstar(){service $1 start}
function srs(){service $1 restart}
function ssto(){service $1 stop}

function ss(){
	((!$#)) && okt=1 || okt=$1
	ssh -p8022 root@$sm.$okt
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
	
	typeset -A a_array
	a_array=(
	'fleissig hw' '-jSvfhXl0pQ'
       '' '')

	for k in "${(@k)a_array}"; do
	  youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" $a_array[$k]
	done
	
	ersetz
	# ffmpeg -i *.webm `ls -t |head -1|cut -d. -f -1`.mp3 
	#sc2 -o .1 -ip $sm -f "`ls |head -1`" -d $dt/$dtm
	#rm "`ls -t|head -1`"
}


function zeile(){
	sed -n "$1,+$2p" mbox
	#sed -n '$1,$($1+$2)p' mbox >> $3
}

 
# alias/Funktionen
alias p='alias|grep'
alias d='declare -f'
alias t='type'
alias w='alias -m'
alias ua='unalias'
alias wo='who'
alias wh="which"


#cd's
alias -g ar=~/arduino
alias dow=$dowDir
alias mus=~/musik
alias -g o=$ZSH_CUSTOM
alias oh=$ZSH
alias op=/opt/django.git
alias pd=pwd
alias un=~/uni
alias y=cd

#curl
alias cl='cur localhost:8000'
alias cur=curl


#Dateien
alias cp='cp -r'
alias to=touch

#Dict
alias di="dict -d fd-eng-deu"
alias w2=dict

# Editoren
alias v=vim

#find
alias ff='find . -type f -name'
alias fin="find / -name"

#grep
alias -g gr="|grep -ai"
alias grep="grep -i"
alias hgrep="fc -El 0 | grep"


# head / tail
alias -g H='|head'
alias tai='tail -f'
alias -g ti='| tail'


# Konsole
alias he="history |tail -n1|cut -d' ' -f1"
alias hist=history
alias ho='ec $HOST'
alias tt=tty
alias tti='stty icrnl'
alias us='ec $USER'


#mysql
alias msd='mysql -uroot d'
alias mst='mysql -uroot d -e "show tables"'


# netzwerk
alias i2='curl ifconfig.me'
alias iw2='iwlist wlan0 scan'
alias ip2=ifconfig
alias pn='ping `if [ $os = Linux ]; then;echo -c 4;fi` google.de'
alias -g ir=$ir

# ps
alias ap="ec $$"
alias ks="ph; ki ssh; ph"
alias ksl="ki sl; pl"
alias pg=pgrep
alias pg2='pgrep -P $$'
alias ph="pr ssh"
alias pp='pr python'
alias pr='ps -ef|grep'
alias psl="pr sleep"
alias pz='pr zsh'
alias -g sl=sleep


#ssh
alias cia='c ida f'
alias -g cida_lokal='c idr >> ida; c ida' 
alias cida='cp idr .; ga; gi "id rsa kopiert"' 
alias cida2='gl; c id_rsa.pub >> ida; c ida' 
alias cip='cj "c idr"' 
alias cir='c idr' 
alias -g idr=~/.ssh/id_rsa.pub 
alias -g ida=~/.ssh/authorized_keys 
alias sdc='b /etc/ssh/sshd_config' 
alias sr='srs sshd' 


# zsh
alias e="exec zsh && ec ha we; !-2"
alias ohm='sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
alias pu='ec $plugins'
alias x=exit


alias ac='ack -i'
alias ad='for k in ${(@k)ad};do ;echo "$k $ad[$k]" ; done'
alias c=cat
alias dt='date +"%T"'
alias de='date +"%d.%m.%y"'
alias dh='df -h'
alias duh='du -h'
alias ecl="/root/progr/eclipse/eclipse & "
alias ec=echo
alias -g f='|less'
alias -g h="--help |less"
alias le='less -WiNS'
alias lt='ls -t'
alias m=man
alias mua='ec $mu'
alias r="expect $lo"
alias rf='rfkill list'
alias tp=top
alias -g ve=--version
alias x+='xbacklight -set 40';alias x-='xbacklight -dec 10'
alias yt='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'

echo "Common Alias aktualisiert"
