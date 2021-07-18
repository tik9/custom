
# fritzbox aliase raus
# $ipf=$ip_ro.1


eth=eth0
if [[ $HOST == tik ]];then
	alias -s pdf=sumatrapdf.exe
	ho=/mnt/c/Users/User
	cu=$ho/appdata/roaming/code/user
	ph=$ho/documents/windowsPowerShell
	ws=$ho/workspace.code-workspace
elif [[ $HOST == t--pc ]];then 
	alias -s pdf=qpdfview
	ho=/home/tk
	config=$ho/.config
	cu=$config/Code/User
	dn=$(systemd-resolve --status)
	eth=enx00e04c680015
	ph=$config/powershell
	wlan=wlp2s0
	ws=$config/Code/Workspaces/1619293380488/workspace.json
fi

be=$ho/bewerbung
cv=$ho/tik9.github.io
cy=$ho/cpython
fb=$ho/fritzbox
gt=$ho/gman
o=$ZSH_CUSTOM


# alias
alias a='alias -m'
alias ag='alias | grep'
alias d='declare -f'
alias p=pwsh
alias t=type


# ifconfig
alias i=ifconfig
alias iu='dhclient $eth;iwd;i'
alias pi='ping 8.8.8.8 -c3'

#ips
ipro=192.168.178
ipf=$ip_ro.1
ipra=$root_ip.36
port_ter=-p8022
ip_te="$root_ip.38 -p8022"

# ps
alias pg='ps -ef |grep'
alias pk=pkill

#ssh
alias sd='sshd;pgs'
alias pgs='ps -ef |grep ssh'
alias pks='pkill ssh'
alias ss='service ssh start'

# progr
alias c=cat
alias co=code
alias na=nano

# suffix
alias -s 3gp=mplayer
alias -s mp3=mplayer
alias -s webm=mplayer

# termux
tp='termux-media-player play'
ts='termux-media-player stop'
tv='termux-volume music'

# zsh
alias e='exec zsh'
alias x=exit
alias zv='zsh --version'


alias b=bash
alias cur='curl localhost'
alias dh='df -h'
alias di=dict
alias ec=echo
alias grep='grep --color=auto'
alias h='sudo pm-suspend'
alias hif='history -E'
alias hi='\history -E'
alias ma=man
alias s='sudo -i'
alias to=touch


function add_zsh_plugin {
	file=plugins/$1
	# echo "b=$0\na=${(s|zsh$1|)b}\necho $a[2] loaded"
	echo string='$0\nnew=(${(s|custom/plugins/$1/|)string})\necho $new[2] loaded'>>! $file
	# string=1/3
	# a=(${(@s|/|)string})
	# echo $a
}


function cc {
    echo `$@` |xclip -selection clipboard
}

function cl { echo $@ |xclip -selection clipboard }

function d3u {
	 for f in $(find . -type f -not -path '*/.git/*');do sed -i 's/\r$//' $f;done;
	 }

function dn2 { cat /etc/resolv.conf}

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


alias -g gr=' | grep'
alias le=less
alias -g L=' | less'

alias fd=fdfind
alias ff='find . -type f -name'


function vse { echo $(code --list-extensions)|tr ' ' '\n' > extensions.txt}


b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded