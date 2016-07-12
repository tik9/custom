#!/bin/zsh

#ad2(){
#adb push "$1" storage/sdcard/
#}

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
#e #eclipse

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

# alias
alias a='alias|le|gr'
alias ua='unalias'


#cd's
alias da="cd /root/django"
alias fx='cd /root/git/fx/'
alias mu="cd /root/musik"
alias oh='cd /root/.oh-my-zsh'
alias oc='cd /root/.oh-my-zsh/custom'
alias rn='cd /root/rn/'
alias st='cd /root/git/StudiumSAS/'

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
alias sp='pm-suspend'

# Hilfe
alias hv='v /root/.oh-my-zsh/custom/help.zsh' 
alias hc='c /root/.oh-my-zsh/custom/help.zsh'
alias hl='le /root/.oh-my-zsh/custom/help.zsh|gr'
alias hs='so /root/help.sh'

# "ls" Aliase
alias la='ls -A'
alias l='ls -CF'
alias lm="ls -l | more"
alias lh="ls --help"
alias ll='ls -alF --full-time'
alias lsh="ls -halt --full-time"
alias list='ls -cl --group-directories-first'
alias biggest='find -type f -printf '\''%s %p\n'\'' | sort -nr | head -n 40 | gawk "{ print \$1/1000000 \" \" \$2 \" \" \$3 \" \" \$4 \" \" \$5 \" \" \$6 \" \" \$7 \" \" \$8 \" \" \$9 }"'


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
alias cl='~/.oh-my-zsh/custom/plugins/cloudapp/cloudapp.rb'
alias cloudapp='cl'
alias ecb="/root/progr/eclipse/eclipse &"
alias ec="export SWT_GTK3=0;/root/progr/eclipse/eclipse &"
alias le='less'
alias v="vim"


# ps
alias k="kill -9"
alias ki="killall"
alias kmp="ki mplayer"
alias ksl="ki sleep"
alias kfe="ki fetchmail"
alias pfe='pr fetchmail'
alias pr='ps -ef|grep'
alias psl="pr sleep"
alias pmp="pr mplay"
alias ppy="pr python"
alias sl="sleep"

# Radio
alias ml="mplayer "

alias b="int"
alias bra="sleep 8h 40m; da;oe"
alias cur="ml -playlist http://minnesota.publicradio.org/tools/play/streams/the_current.pls"
alias fm4="ml http://mp3stream1.apasf.apa.at:8000/" #fm4 orf
alias heartla='ml -playlist http://minnesota.publicradio.org/tools/play/streams/radio_heartland.pls'
alias int="ml http://80.237.154.83:8120" # landsberg int.
alias ri=int
alias kl="ml -playlist http://minnesota.publicradio.org/tools/play/streams/classical.pls"
alias mpr="ml -playlist http://minnesota.publicradio.org/tools/play/streams/news.pls"
alias news=mpr
alias oe="ml http://194.232.200.156:8000" #oe3
alias sonicuniverse="ml -playlist http://somafm.com/sonicuniverse.pls"

#user
#alias st="su t"
alias sur="sudo -i"


# zsh
alias zs='so /root/.zshrc'
alias zc='c /root/.zshrc'
alias zl='le /root/.zshrc'
alias zg='g /root/.zshrc'


alias ad='echo user153015@gmail.com|cli'
alias ad2='echo 015739598220 timo.koerner@hof-university.de dkoerner@konzertagentur-koerner.de'
alias cli='xclip -sel clip'
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
alias iban='DE63 7215 0000 0050 5242 71'
alias lag='amixer get PCM'
alias ma='man'
alias mkdir='mkdir -p'
alias ms='mysql d'
alias mt='mutt'
alias nm="nmap -sP 192.168.1.*"
alias r=sr
alias sho='apt-cache show'
alias snd='cat /dev/urandom | padsp tee | aplay'
alias so='source'
alias sr='ssh 192.168.1.115'
alias t='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias ta='tail'
alias tar='tar xfvz'
alias tb='thunderbird &'
alias te='terminator &'
alias tp='top'
alias tr='tree'
alias un='unzip'
alias w="dict"
alias wp='chmod 777 -R .'
alias z='gpicview'


echo "$0 aktualisiert von $$"
