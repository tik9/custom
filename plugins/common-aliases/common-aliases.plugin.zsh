
if [[ $HOST == tik ]];then
	pc=win
	how=/mnt/c/Users/User
	cu=$how/appdata/roaming/code/user
	phs=$how/documents/windowsPowerShell
elif [[ $HOST == t--pc ]];then 
	pc=linux
	config=$HOME/.config
	eth=enx00e04c680015
	cu=$config/Code/User
	phs=$config/powershell
elif [[ $HOST == tis-Mac-mini.fritz.box ]];then; pc=mac;fi

o=$ZSH_CUSTOM

# alias
alias a='alias | grep'
alias am='alias -m'
alias d='declare -f'
alias t=type

# cd
y=$HOME/cpython
alias ch="cd $HOME/changeroo-portal"
alias doc="cd $HOME/documents"
alias dw="cd $HOME/downloads"
alias gn="cd $HOME/gman"
alias k="cd $HOME/tik"
alias pp="cd $HOME/php"
alias u="cd $ZSH_CUSTOM"
alias y="cd $y"

# grep
alias -g gre='|grep'
alias rgr='grep -r'

# ifconfig
alias i='ifconfig|less'

#ips
ipro=192.168.178
ipsm=192.168.43
ipf=$ip_ro.1

#man
alias m=man
alias mc='man curl'
alias mg='man grep'

# php
alias p8='s php -S localhost:80'

# progr
alias -g c=cat
alias co=code
alias n=nano

# python
alias pv='python -V'
alias py='python3'
alias sv='source venv/bin/activate'
alias wp='which python3'

# zsh
alias e='exec zsh'
alias pl='echo $plugins'
alias x=exit


alias cpa='cat package.json'
alias dh='df -h'
alias da='date +%R'
alias ec=echo
alias es=esrua
alias hi='\history -E'
alias le="less -m $@"
alias -g L=' | less'
alias p=ps
alias ph=vendor/bin/phpunit
alias pw=pwd
alias s=sudo
alias si='sudo -i'
alias to=touch
alias w=which

function ifco {
	ipa=$(ifconfig | sed -nr 's/\s+inet\s([0-9]{3}\.[0-9]{3}\.[0-9]+\.[0-9]+).*/\1/p')
	echo $ipa
}

function g { grep $@ -r |less }

function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

function qp {
	 qpdf --empty --pages *.pdf -- $1.pdf
	 }

b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded
