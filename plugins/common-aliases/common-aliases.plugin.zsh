ho=/mnt/c/Users/User
ho=$HOME
ho=/home/tk
ph=$ho/Documents/WindowsPowerShell
ph=$ho/.config/powershell
plu=$ZSH_CUSTOM/plugins
bs=$ho/AppData\Roaming\Brackets
ca=$ph/Microsoft.PowerShell_profile.ps1
cf=$ZSH_CUSTOM/common_functions.zsh
cs=.config/Code/User
cs=$ho/appdata/roaming/code/user
cs2=$ho/.config/Code/User
cv=$ho/cv
fs=$ho/further-skill-tests
gh=$ho/ghpage
gt=$ho/git
ml=$ho/ml

hw=$ho
lt=$ho/lt
myd=$ho/documents
mu=$ho/music
oh=$ZSH
pl=$ho/pluralsight-skill-tests
pr=$ho/psrandom
tm=$ho/tesseractToMarkdown
o=$ZSH_CUSTOM

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
alias x=exit

alias -g cc='|xclip -selection clipboard'
alias cu='curl localhost'
alias dh='df -h'
alias ec=echo
alias grep='grep --color=auto'
alias hif='history -E'
alias ma=man
alias pm='sudo pm-suspend'
alias pw=pwd
alias s='sudo -i'
alias to=touch
alias us='echo $USER'
alias z='service network-manager restart'


function bc_ { echo "$@" | bc -l }

function chr { /snap/bin/chromium  $1 &  }

function dos2u { for i in *;do if [[ -f $i ]]; then sed -i 's/\r$//' "$i"; fi; done }


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

function ge { geany $1& }

function lx { lximage-qt $1 & }
function np { grep -c ^processor /proc/cpuinfo; nproc }
function q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

function qp { qpdfview $1 & }

function qpd { start=''; ziel=''; qpdf $start --pages . 2-6 -- $ziel }


alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias ldot='ls -ld .*'

alias -g zshrc=~/.zshrc

alias le='less'

# Command line head / tail shortcuts
alias -g H='|head'
alias -g T='|tail'

alias -g gr='|grep'
alias -g L='|less'

alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias pg='ps -ef |grep'

alias -s pdf=SumatraPDF.exe
