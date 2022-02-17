

eth=eth0
if [[ $HOST == tik ]];then
	alias -s pdf=sumatrapdf.exe
	ho=/mnt/c/Users/User
	cu=$ho/appdata/roaming/code/user
	ph=$ho/documents/windowsPowerShell
elif [[ $HOST == t--pc ]];then 
	alias -s pdf=qpdfview
	ho=/home/tk
	config=$ho/.config
	cu=$config/Code/User
	eth=enx00e04c680015
	ph=$config/powershell
	wlan=wlp2s0
fi

cv=$ho/tik9.github.io
cy=$ho/cpython
fb=$ho/fritzbox
gt=$ho/gman
o=$ZSH_CUSTOM


# alias
alias am='alias -m'
alias ag='alias | grep'
alias d='declare -f'
alias t=type


# ifconfig
alias i=ifconfig
alias iu='dhclient $eth;i'

#ips
ipro=192.168.178
ipf=$ip_ro.1


# progr
alias c=cat
alias co=code
alias na=nano

# zsh
alias e='exec zsh'
alias x=exit


alias dh='df -h'
alias di=dict
alias ec=echo
alias grep='grep --color=auto'
alias hif='history -E'
alias hi='\history -E'
alias ma=man
alias s='sudo -i'
alias to=touch


function cc {
    echo `$@` |xclip -selection clipboard
}


function g { grep $@ -r |less }

function lx { lximage-qt $1 & }

function pig { ping $1 -c3 }

function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

function qp { qpdfview $1 & }

function qpd { start=''; ziel=''; qpdf $start --pages . 2-6 -- $ziel }


alias -g gr=' | grep'
alias le='less -m'
alias -g L=' | less'

b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded