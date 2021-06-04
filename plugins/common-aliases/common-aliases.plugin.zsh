# ip mai: 178.27.249.89

# set-alias i ipconfig

# $setdns=Get-NetAdapter  -Name "Ethernet 9" | Set-DnsClientServerAddress -ServerAddresses 192.168.178.1;Get-DNSClientServerAddress
# $dn=echo exit | nslookup | findstr ":"

# $gt="$ho/gman"
# select-ob psversion raus
# function pig { ping $args -c3 }
# $cf='common_functions.ps1'
# $a=usebasicparsing

# git submodule add https://github.com/dahlbyk/posh-git
# Add-PoshGitToProfile
# echo 'ignore = dirty'|out-file .gitmodules

# curl -v -H 'Authorization: token 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' https://api.github.com

# l get-childitem, ll rm

# cp common_functions



# echo $HOST
eth=eth0
if [[ $HOST == tik ]];then
	ho=/mnt/c/Users/User
	configpws=documents/windowsPowerShell
	cu=appdata/roaming/code/user
	alias -s pdf=SumatraPDF.exe
elif [[ $HOST == t--pc ]];then 
	ho=/home/tk
	configpws=.config/powershell
	cu=.config/Code/User	
	eth=enx00e04c680015
	wlan=wlp2s0
	dn=$(systemd-resolve --status)
fi
cs=$ho/$cu
ph=$ho/$configpws

plu=$ZSH_CUSTOM/plugins

cv=$ho/tik9.github.io
cy=$ho/cpython

gt=$ho/gman
o=$ZSH_CUSTOM
ob=~/.config/openbox/lxqt-rc.xml
rt=$ho/rest-test
ws=$ho/workspace.code-workspace


# alias
alias a='alias -m'
alias ag='alias | grep'
alias d='declare -f'
alias p=pwsh
alias t=type

# dns
dn=$(cat /etc/resolv.conf)

# ifconfig
alias i=ifconfig
alias ild='ifconfig $eth down; i'
alias iu='dhclient $eth;iwd;i'
alias iwd='ifconfig $wlan down'
alias iwu='ifconfig $wlan up; i'
alias pi='ping 8.8.8.8 -c3'

#ips
root_ip=192.168.178
rasp_ip=$root_ip.36
termux_port=-p8022
termux_ip="$root_ip.38 $termux_port"

# ps
alias pg='ps -ef |grep'
alias pk=pkill

#ssh
alias sd=sshd
alias pgs='ps -ef |grep ssh'
alias ss='service ssh start'

# progr
alias c=cat
alias co=code
alias na=nano

# termux
tp='termux-media-player play'
ts='termux-media-player stop'
tv='termux-volume music'

# zsh
alias e='exec zsh'
alias x=exit
alias zv='zsh --version'
 

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


alias -g gr=' | grep'
alias le=less
alias -g L=' | less'

alias fd=fdfind
alias ff='find . -type f -name'

function add_zsh_plugin {
	file=plugins/$1
	# echo "b=$0\na=${(s|zsh$1|)b}\necho $a[2] loaded"
	echo string='$0\nnew=(${(s|custom/plugins/$1/|)string})\necho $new[2] loaded'>>! $file
	# string=1/3
	# a=(${(@s|/|)string})
	# echo $a
}


b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded