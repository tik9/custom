#!/bin/zsh

#ad2(){
#adb push "$1" storage/sdcard/
#}

g(){
	geany $1 &
}


# Hilfe
he(){
$1 --help
}

# alt-s --> Sudo
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

function las(){
amixer set PCM $(expr $1 \* 10)%;
echo "Lautsprecher: Argument \$1 mit 10 multipliziert."
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


function sc(){
    prod=192.168.1.115 ;
	scp -r $1  $prod:$2 ;
        echo "$1 (\$1) nach $prod:$2(\$2) kopiert"
}

function ta(){
	tail $2
}

function yt(){
	youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.)s" "$1" ;
echo "$1 (\$1) heruntergeladen"
}

#cd's
alias dj="cd /root/dj3"
alias mu="cd /root/musik"
alias ra='cd rasp'
alias oh='cd /root/.oh-my-zsh'
alias oc='cd /root/.oh-my-zsh/custom'


alias ad='echo user153015@gmail.com 015739598220'
alias ad2='echo dkoerner@konzertagentur-koerner.de'
alias co='da;date1=`date +%s`; while true; do ; echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; done'
alias cp='cp -r'
alias da='date'
alias df='df -h'
alias du='du -h'
alias ex="exit"
alias f="find / -name"
alias f2="find -name"
alias gr='grep'
alias ha='halt'
alias lag='amixer get PCM'
alias ma='man'
alias mkdir='mkdir -p'
alias nm="nmap -sP 192.168.1.*"
alias sho='apt-cache show'
alias snd='cat /dev/urandom | padsp tee | aplay'
alias so='source'
alias sr='ssh 192.168.1.115'
alias t='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias ta='tail'
alias tar='tar xfvz'
alias tb='thunderbird &'
alias te='terminator &'
alias tr='tree'
alias un='unzip'
alias w="dict"
alias wp='chmod 777 -R .'
alias z='gpicview'


echo "$0 aktualisiert von $$"
