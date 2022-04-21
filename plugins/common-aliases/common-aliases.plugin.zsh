
if [[ $HOST == tik ]];then
	pc=win
	how=/mnt/c/Users/User
	cu=$how/appdata/roaming/code/user
	ph=$how/documents/windowsPowerShell
elif [[ $HOST == t--pc ]];then 
	pc=linux
	config=$HOME/.config
	eth=enx00e04c680015
	cu=$config/Code/User
	ph=$config/powershell
elif [[ $HOST == tis-Mac-mini.fritz.box ]];then; pc=mac;fi

o=$ZSH_CUSTOM

# alias
alias am='alias -m'
alias ag='alias | grep'
alias d='declare -f'
alias t=type

# cd
alias cv="cd $HOME/tik"
alias cy="cd $HOME/cpython"
alias dw="cd $HOME/downloads"
alias o="cd $ZSH_CUSTOM"
alias pp="cd $HOME/php"

# grep
alias -g gre='|grep'
alias rgr='grep -r'

# ifconfig
alias i='ifconfig|less'

#ips
ipro=192.168.178
ipsm=192.168.43
ipf=$ip_ro.1

# php
alias p8='php -S localhost:8000'
alias p88='php -S localhost:8080'

# progr
alias c=cat
alias n=nano

# zsh
alias e='exec zsh'
alias x=exit


alias dh='df -h'
alias da='date +%R'
alias ec=echo
alias hi='\history -E'
alias le="less -m $@"
alias -g L=' | less'
alias m=man
alias p=ps
alias pw=pwd
alias s=sudo
alias si='sudo -i'
alias to=touch


function ifco {
	ipa=$(ifconfig | sed -nr 's/\s+inet\s([0-9]{3}\.[0-9]{3}\.[0-9]+\.[0-9]+).*/\1/p')
	echo $ipa
}

function g { grep $@ -r |less }

function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded
