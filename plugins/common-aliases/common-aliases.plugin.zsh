

eth=eth0
if [[ $HOST == tik ]];then
	pc=win
	ho=/home/tk
	how=/mnt/c/Users/User
	alias -s pdf=sumatrapdf.exe
	cu=$how/appdata/roaming/code/user
	ph=$how/documents/windowsPowerShell
elif [[ $HOST == t--pc ]];then 
	pc=linux
	ho=/home/tk
	alias -s pdf=qpdfview
	config=$ho/.config
	cu=$config/Code/User
	eth=enx00e04c680015
	ph=$config/powershell
elif [[ $HOST == tis-Mac-mini.fritz.box ]];then
	pc=mac
	ho=/users/thome
	eth=en4
	cu="$ho/Library/Application Support/Code/User"
fi

o=$ZSH_CUSTOM

# alias
alias am='alias -m'
alias ag='alias | grep'
alias d='declare -f'
alias t=type

# cd
alias cv="cd $ho/tik9.github.io"
alias cy="cd $ho/cpython"
alias gm="cd $ho/gman"
alias o="cd $ZSH_CUSTOM"
alias pp="cd $ho/php"


# ifconfig
alias i=ifconfig
alias iu='sudo dhclient $eth; ifconfig'

#ips
ipro=192.168.178
ipf=$ip_ro.1

# php
alias p8='php -S localhost:8000'
alias p88='php -S localhost:8080'

# progr
alias c=cat
alias na=nano

# zsh
alias e='exec zsh'
alias x=exit


alias dh='df -h'
alias di=dict
alias ec=echo
alias hi='\history -E'
alias le="less -m $@"
alias -g L=' | less'
alias m=man
alias p=ps
alias s=sudo
alias shr='printf "¯\_(ツ)_/¯" | pbcopy'
alias si='sudo -i'
alias to=touch

function cc {
    echo `$@` |xclip -selection clipboard
}
function ccm {
    echo `$@` |pbcopy
}

function cb {
    echo "$@" |pbcopy
}

function ifco {
	ipa=$(ifconfig | sed -nr 's/\s+inet\s([0-9]{3}\.[0-9]{3}\.[0-9]+\.[0-9]+).*/\1/p')
	echo $ipa
}

function g { grep $@ -r |less }

function lx { lximage-qt $1 & }

function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

function qp { qpdfview $1 & }

function qpd { start=''; ziel=''; qpdf $start --pages . 2-6 -- $ziel }


b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded
