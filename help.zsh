#!/bin/zsh

#ad2(){
#adb push "$1" storage/sdcard/
#}

ver='/home/t/Downloads/';

function co(){
	echo "$1" | xclip -sel clip
	echo "$1 (\$1) in Zwischenablage"
}

function g(){
	geany $1 &
}


# Hilfe
function he(){
$1 --help
}

# alt-s --> Sudo
function insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

function ki(){
	killall $1;
	ps -ef|grep $1;
	echo "Prozess \$1 vernichtet"
}
	
function las(){
amixer set PCM $(expr $1 \* 10)%;
echo "Lautspr.: Argument \$1 mit 10 multipliziert."
}

# login remote shell
function lss(){
	base='192.168.1';
        ssh $base.$1;
        echo "Ssh: Mit $base.$1 (\$1) verbunden"
}

function m(){
	mupdf $1 &
}

function mp(){
	sleep $1;killall mplayer
}

function sc2(){
    prod=192.168.1.115 ;
	scp -r $1  $prod:$2 ;
        echo "$1 (\$1) nach $prod:$2 (\$2) kopiert"
}

function startRoot(){
#py #pycharm
#g #geany
#te # Terminal
# ifup down up wlan
da; echo Fertig $0
}

function ta(){
	tail $2
}

function ve(){
$1 --version
}

function yt(){
	youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.)s" "$1" ;
echo "$1 (\$1) heruntergeladen"
}

function z2(){
	#ver='.'
	#dat= "$ver`ls -t $ver | head -n1`"
	dat= 'a.jpg';
	echo $dat;
	extension=$(echo ${dat}|awk -F\. '{print $2}')
if [ ${extension} == "jpg" ]; then
   echo 1
fi
		#if [[ $dat == *.jpg ]] ; then
		#gpicview $dat
		#gpicview "$ver`ls -t $ver | head -n1`"
	#else
		#mupdf $dat
	#fi
	
 }
 
function mov(){
	ver='/home/t/';
	root="/root/$1"
	#ver='.'
	echo Inhalt $ver
	ls -t $ver
	mv "$ver`ls -t $ver  | head -n1`" $1
	echo \\n
	echo Inhalt $1
	ls $1
 }

 
# alias
alias a='alias|le|gr'
alias ua='unalias'


#cd's
alias da="cd /root/django"
alias mu="cd /root/musik"
alias oh='cd /root/.oh-my-zsh'
alias oc='cd /root/.oh-my-zsh/custom'
alias vr='cd /root/vr'

#curl
alias cu='curl'
alias cl1='cu localhost:8000'


#Dateiops
alias d="rm -r"
alias md="mkdir -p"
alias to='touch'

#dpkg
alias ag='apt-get'
alias in='ag install -y'
alias ar='ag remove -y'
alias aur='ag autoremove'
alias up='ag update'
alias ug='ag upgrade'


# Energie
alias hi='hibernate'
alias h='hi'
alias rs='reboot'
alias s='pm-suspend'

# Hilfe
alias hc='c /root/.oh-my-zsh/custom/help.zsh'
alias hg='g /root/.oh-my-zsh/custom/help.zsh'
alias hl='le /root/.oh-my-zsh/custom/help.zsh|gr'
alias hs='so /root/.oh-my-zsh/custom/help.zsh'
alias hv='v /root/.oh-my-zsh/custom/help.zsh' 

# ls
alias biggest='find -type f -printf '\''%s %p\n'\'' | sort -nr | head -n 40 | gawk "{ print \$1/1000000 \" \" \$2 \" \" \$3 \" \" \$4 \" \" \$5 \" \" \$6 \" \" \$7 \" \" \$8 \" \" \$9 }"'
alias dl='ls /home/t/Downloads'
alias l='ls -CF'
alias la='ls -A'
alias ld='ls -t $ver'
alias lh="ls --help"
alias li='ls -cl --group-directories-first'
alias lm="ls -l | more"
alias ll='ls -alF --full-time'
alias lsh="ls -halt --full-time"


# netzwerk
alias if="ifconfig" 
alias iw='iwlist wlan0 scan'
alias ie='iwgetid -r'
alias ie2='iwconfig 2>&1 | grep ESSID'
alias id='ifdown wlan0'
alias iu='ifup wlan0'
alias idu='ifdown wlan0;ifup wlan0'
alias i=idu
alias pi="p" 
alias p="ping google.de -c4" 

#programme
alias ab='abiword'
alias c='cat'
alias clo='~/.oh-my-zsh/custom/plugins/cloudapp/cloudapp.rb'
alias cloudapp='clo'
alias ecb="/root/progr/eclipse/eclipse &"
alias ec="export SWT_GTK3=0;/root/progr/eclipse/eclipse &"
alias et='expect'
alias ee='et expect1'
alias le='less'
alias v="vim"


# ps
alias as="echo $0"
alias ba="bash"
alias k="kill -9"
alias kf=kfe
alias kfe="ki fetchmail"
alias ki="killall"
alias km=kmp
alias kmp="pmp;echo '\n';ki mplayer;echo '\n';pmp"
alias ksl="ki sleep"
alias kpy="ki python3"
alias pf=pfe
alias pfe='pr fetchmail'
alias pr='ps -ef|grep'
alias psl="pr sleep"
alias pmp="pr mplay"
alias ppy="pr python"
alias sfe='fetchmail'
alias sl="sleep"
alias tt="tty"

# Radio
alias ml="mplayer "
alias sle="sleep 8h 40m; oe"

alias b="ml http://80.237.154.83:8120" # landsberg int.
alias cur="ml -playlist http://minnesota.publicradio.org/tools/play/streams/the_current.pls"
alias fm4="ml http://mp3stream1.apasf.apa.at:8000/" #fm4 orf
alias heart'ml -playlist http://minnesota.publicradio.org/tools/play/streams/radio_heartland.pls'
alias kl="ml -playlist http://minnesota.publicradio.org/tools/play/streams/classical.pls"
alias mpr="ml -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls"
alias news=mpr
alias oe="ml http://194.232.200.156:8000" #oe3
alias sonicuniverse="ml -playlist http://somafm.com/sonicuniverse.pls"

#user
#alias st="su t"
alias sur="sudo -i"
alias us="echo $USER"


# zsh
alias zs='so /root/.zshrc'
alias zg='g /root/.zshrc'


alias ad='echo user153015@gmail.com|cli'
alias ad2='echo 015739598220 timo.koerner@hof-university.de dkoerner@konzertagentur-koerner.de'
alias cl='xclip -sel clip'
alias cou='da;date1=`date +%s`; while true; do ; echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; done'
alias cp='cp -r'
alias dat='date'
alias df='df -h'
alias du='du -h'
alias e="exec zsh"
alias ex="exit"
alias f="find / -name"
alias f2="find -name"
alias gr='grep'
alias ha='halt'
alias hn='echo $(hostname)'
alias iban='DE63721500000050524271'
alias lag='amixer get PCM'
alias ma='man'
alias mmu='ma mupdf'
alias mkdir='mkdir -p'
alias ms='mysql d'
alias mt='mutt'
alias nm="nmap -sP 192.168.188.1/24"
alias ocgh='le ../.oh-my-zsh/plugins/github/github.plugin.zsh'
alias ps1="PS1='%$COLUMNS>╡>%F{cyan}╔╡%F{red}[%n]%F{cyan}:%F{yellow}[%m]%F{cyan}➾%F{green}[%~]%F{default}$PS1_GIT%F{cyan}${(l:COLUMNS::═:):-}%<<
╚═╡%F{default}'"
alias r=sr
alias sho='apt-cache show'
alias sr='expect /root/.oh-my-zsh/custom/login_rp'
alias srg='g /root/.oh-my-zsh/custom/login_rp'
alias t='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias ta='tail'
alias tar='tar xfvz'
alias te='terminator &'
alias tp='top'
alias tr='tree'
alias un='unzip'
alias w="dict"
alias wp='chmod 777 -R .'
alias z='gpicview'


echo "$0 aktualisiert von $$"
