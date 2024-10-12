
# alias
alias ag='alias | grep'
alias de='declare -f'
alias t=type

# cd
alias dc="cd $HOME/documents"
alias dt="cd $HOME/desktop"
alias dw="cd $HOME/downloads"
alias u="cd $ZSH_CUSTOM"
alias y="cd $HOME/cpython"

# progr
alias c='bc<<<'
alias cu=curl
alias ca=cat
alias co=code


# python
alias sv='source venv/bin/activate'
alias wp='which python3'

# ssh
alias sd=sshd
alias pd='ps -ef|grep ssh'

alias da='date +%X'
alias dh='df -h'
alias e='exec zsh'
alias ec='echo'
alias h='history'
alias le="less -m $@"
alias l="ls -t"
alias m=man
alias mp=mplayer
alias o=open
alias p=pwd
alias rf='rm -rf'
alias s=sudo
alias to=touch
alias x=exit


ip=192.168.178.20
# ip=192.168.43.1
img_dir=storage/dcim/Camera/

scp_img(){scp -r -P8022 user@$ip:$img_dir /Users/thome;}

rm_img(){ssh -p8022 $ip "rm $img_dir/*";}
# rm_img

ifco() { echo $(ip a) | sed -E 's/inet ([0-9]{3}\.[0-9]{3}\.[0-9]{3}\.[0-9]+).*/\1/' | grep inet }

q(){ wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null }

resolution(){system_profiler -json SPDisplaysDataType 2>/dev/null | python3 -c "import sys,json;d=next(i for i in json.load(sys.stdin)['SPDisplaysDataType'][0]['spdisplays_ndrvs'] if 'spdisplays_main' in i);print(d['_spdisplays_pixels'])";}

uzip(){
    cd $HOME/downloads
    find ./ -name \*.zip -exec unzip {} \; &&

    rm iCloud\ Photos/*.MOV
    rm -f *.zip
}

w(){
    loc="${1:-hepberg}"
    curl wttr.in/$loc
}

b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded
