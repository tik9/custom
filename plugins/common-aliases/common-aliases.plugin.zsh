
# alias
alias a='alias | grep'
alias d='declare -f'
alias t=type

# cd
alias ap="cd $HOME/apo"
alias b="cd $HOME/bewerbung"
alias cv="cd $HOME/cv2"
alias dw="cd $HOME/downloads"
alias r="cd $HOME/re"
alias u="cd $ZSH_CUSTOM"
alias y="cd $HOME/cpython"


#man
alias m=man
alias mc='man curl'
alias mg='man grep'

# netlif
alias n='ntl'
alias nd='ntl dev'
alias nf='ntl functions:invoke'
alias nfs='ntl functions:serve --port 80'

# progr
alias c=cat
alias co=code
alias na=nano

# python
alias sv='source venv/bin/activate'
alias wp='which python3'

# ssh
alias sd=sshd
alias pd='ps -ef|grep ssh'

alias ce='cat .env'
alias dh='df -h'
alias e='exec zsh'
alias hi='\history -E'
alias i='ifconfig|less'
alias le="less -m $@"
alias lt="l -t"
alias nr='cb 01573 9598 220'
alias o=open
alias p=pwd
alias s=sudo
alias to=touch
alias x=exit

scp_img(){
    dir=storage/dcim/Camera/
    scp -r user@192.168.43.1:$dir /Users/thome
}

ifco() { echo $(ifconfig)|sed -E 's/inet ([0-9]{3}\.[0-9]{3}\.[0-9]{3}\.[0-9]+).*/\1/'|grep inet }


q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }


b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded
