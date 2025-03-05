
# alias
alias a='alias | grep'
alias de='declare -f'
alias t=type

# cd
alias dc="cd $HOME/documents"
alias dt="cd $HOME/desktop"
alias dw="cd $HOME/downloads"
alias tu="cd $HOME/tut"
alias u="cd $ZSH_CUSTOM"
alias y="cd $HOME/cpython"

# progr
alias c='bc<<<'
alias cu=curl
alias ca=cat
alias co=code


# rm
alias rf='rm -rf'
alias rp='rm *.pdf'
alias rz='rm *.zip'


# ssh
alias sd=sshd
alias pd='ps -ef|grep ssh'

alias da='date +%X'
alias e='exec zsh'
alias ec='echo'
alias h='history'
alias i=ifconfig
alias le="less -m $@"
alias l="ls -t"
alias m=man
alias o=open
alias p=pwd
alias su=sudo
alias to=touch
alias x=exit


img_dir=storage/dcim/Camera/

faculty(){
    w=$1
    n=$(( $w - 1 ))
    m="$w"
    W=$(for g in $(seq $n);do m=$(echo "scale=10;$m*$g" | bc); done; echo "$m")
    echo $W
}


ifco() { echo $(ip a) | sed -E 's/inet ([0-9]{3}\.[0-9]{3}\.[0-9]{3}\.[0-9]+).*/\1/' | grep inet }

q(){ wget -O /dev/null http://speedtest.belwue.net/1G ; }

resolution(){system_profiler -json SPDisplaysDataType 2>/dev/null | python3 -c "import sys,json;d=next(i for i in json.load(sys.stdin)['SPDisplaysDataType'][0]['spdisplays_ndrvs'] if 'spdisplays_main' in i);print(d['_spdisplays_pixels'])";}

uzip(){
    cd $HOME/downloads
    find ./ -name \*.zip -exec unzip {} \; &&

    rm iCloud\ Photos/*.MOV
    # rm -f *.zip
}

w(){
    loc="${1:-hepberg}"
    curl wttr.in/$loc
}

b=$0
a=(${(s|custom/plugins/common-aliases/|)b})
echo $a[2] loaded
