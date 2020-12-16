ho=/mnt/c/Users/User
ph=$ho/Documents/WindowsPowerShell
plu=$ZSH_CUSTOM/plugins
bs=$ho/AppData\Roaming\Brackets
ca=$ph/Microsoft.PowerShell_profile.ps1
cf=$ZSH_CUSTOM/common_functions.zsh
cs=.config/Code/User
cs=$ho/appdata/roaming/code/user
cv=~/cv
cvo=$cv/output
dat=$0
doks=$HOME/doks
gt=$HOME/gt
ml=$HOME/ml

gim=$gt/gitmanager.sh
hw=$HOME
myd=$HOME/documents
mu=$ho/music
oh=$ZSH
pl=$HOME/pl
pr=$HOME/psrandom
tm=$HOME/tesseractToMarkdown
zsh_cu=$ZSH_CUSTOM

# alias/Funktionen
alias ag='alias | grep'
alias cho='chown t'
alias d='declare -f'
alias m='alias -m'
alias t='type'

#cds
alias g=/gt
alias dow=/home/tk/snap/chromium/1382/Downloads 

# progr
alias c=cat
alias co=code
alias na=nano


# zsh
alias e="exec zsh"
alias pa='ec $PATH'
alias pa_wi='/mnt/c/Windows/system32/cmd.exe /c echo %path%'
alias pa_def='export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games'
alias plg='ec $plugins'
alias x=exit

alias -g cc='|xclip -selection clipboard'
alias cu='curl localhost'
alias dh='df -h'
alias ec=echo
alias grep='grep --color=auto'
alias key="ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null"
alias ma=man
alias pm='sudo pm-suspend'
alias pw=pwd
alias ra='vlc.exe -I curses http://provisioning.streamtheworld.com/pls/CKFRAM.pls'
alias s='sudo -i'
alias to=touch
alias us='echo $USER'
alias z='service network-manager restart'


function bc_ { echo "$@" | bc -l }

function chr { /snap/bin/chromium  $1 &  }

function find_ex {
	if [ -z "$2" ]; then
	# print $2
	ex=''; else
	# print $2 'else'
	ex=$2; fi
	# echo $ex
	find / -path $ex -prune -false -o -name $1
}

function g { grep $@ -r |less }

function ge { sudo geany $1 }

function lx { lximage-qt $1 & }
function np { grep -c ^processor /proc/cpuinfo; nproc }
function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

function qp { qpdfview $1 & }

function qpd { start=''; ziel=''; qpdf $start --pages . 2-6 -- $ziel }

function vse {  echo $(code --list-extensions) > extensions.txt}


alias lst='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias ldot='ls -ld .*'

alias -g zshrc=~/.zshrc

alias le='less'

# Command line head / tail shortcuts
alias -g H=|head
alias -g T=|tail

alias -g gr='|grep'
alias -g L='|less'

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias hgrep="fc -El 0 | grep"
alias hi=history
alias pg='ps -ef |grep'

alias -s pdf=SumatraPDF.exe
alias -s tar='tar tf'