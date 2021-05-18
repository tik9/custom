# netsh
# interface show interface
# ip set dns name="ethernet 9" source="static" address="192.168.178.1"
$gt="$ho/gman"
function pig { ping $args -c3 }
$cf='common_functions.ps1'
$a=usebasicparsing

# echo $HOST
eth=eth0
if [[ $HOST == tik ]];then
	ho=/mnt/c/Users/User
configpws=documents/windowsPowerShell
cu=appdata/roaming/code/user
	elif [[ $HOST == t--pc ]];then 
	ho=/home/tk
configpws=.config/powershell
cu=.config/Code/User	
eth=enx00e04c680015
	fi
cs=$ho/$cu
ph=$ho/$configpws

plu=$ZSH_CUSTOM/plugins

cv=$ho/tik9.github.io
cy=$ho/cpython

gt=$ho/gman
i=ifconfig
o=$ZSH_CUSTOM
ob=~/.config/openbox/lxqt-rc.xml
rt=$ho/rest-test
ws=$ho/workspace.code-workspace

#lan
wlan=wlp2s0

#ips
root_ip=192.168.178
rasp_ip=$root_ip.36
termux_port=-p8022
termux_ip="$root_ip.38 $termux_port"

#ssh
alias sd=sshd
alias pgs='ps -ef |grep ssh'
alias ss='service ssh start'

# ifconfig
alias ild='ifconfig $eth down; i'
alias iu='dhclient $eth;iwd;i'
alias iwd='ifconfig $wlan down; i'
alias iwu='ifconfig $wlan up; i'
alias pi='ping 8.8.8.8 -c3'


# alias/Funktionen
alias a='alias -m'
alias ag='alias | grep'
alias d='declare -f'
alias p=pwsh
alias t=type

# termux
tp='termux-media-player play'
ts='termux-media-player stop'
tv='termux-volume music'


# progr
alias c=cat
alias co=code
alias na=nano


# zsh
alias e='exec zsh'
alias x=exit

function cc {
    echo $@ |xclip -selection clipboard
}

alias cur='curl localhost'
alias d2u='dos2unix /mnt/c/Users/User/.oh-my-zsh/custom/*'
alias dh='df -h'
alias di=dict
alias dow=/home/tk/snap/chromium/1382/Downloads 
alias ec=echo
alias grep='grep --color=auto'
alias hif='history -E'
alias ll='ls | less'
alias ma=man
alias pm='sudo pm-suspend'
alias s='sudo -i'
alias st='su tk'
alias to=touch


function chr { /usr/bin/chromium  $1 &  }

function d3u {
	 for f in $(find . -type f -not -path '*/.git/*');do sed -i 's/\r$//' $f;done;
	 }


function find_ex {
	if [ -z "$2" ]; then
	ex=''; else
	ex=$2; fi
	find / -not -path $ex -name $1 -type f
}

function g { grep $@ -r |less }

function ge { geany $1& }

function lx { lximage-qt $1 & }
function np { grep -c ^processor /proc/cpuinfo; nproc }
function pig { ping $1 -c3 }

function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

function qp { qpdfview $1 & }

function qpd { start=''; ziel=''; qpdf $start --pages . 2-6 -- $ziel }


# Command line head / tail shortcuts
alias -g H='|head'
alias -g T='|tail'

alias -g gr=' | grep'
alias le=less
alias -g L=' | less'

alias fd=fdfind
alias ff='find . -type f -name'
alias pg='ps -ef |grep'

alias -s pdf=SumatraPDF.exe


b=$0
a=("${(s|custom/plugins/common-aliases/|)b}")
echo $a[2] loaded
