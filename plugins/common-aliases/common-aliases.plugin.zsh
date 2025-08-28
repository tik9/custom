
# alias
alias a='alias | grep'
alias de='declare -f'
alias t=type

# cd
alias dc="cd $HOME/documents"
alias dk="cd $HOME/desktop"
alias dw="cd $HOME/downloads"
alias so="cd $HOME/documents/privat/sorge"
alias u="cd $ZSH_CUSTOM"
alias y="cd $HOME/cpython"

# progr
alias b='bc<<<'
alias c=cat
alias co=code
alias n=nano


# rm
alias rf='rm -rf'
alias rp='rm *.pdf'
alias rz='rm *.zip'
alias rm_rec='find . -type f -cmin -1 -delete'


# ssh
alias sd=sshd
alias pd='ps -ef|grep ssh'

alias du='date +%H:%M'
alias dt='date +%d'
alias e='exec zsh'
alias ec='echo'
alias h='history'
alias i=ifconfig
alias le="less -m $@"
alias l="ls -t"
alias m=man
alias o=open
alias p=pwd
alias p2='ps2pdf -dPDFSETTINGS=/ebook'
alias su=sudo
alias to=touch
alias x=exit

f() {
if (( $1 <= 1 )); then
        echo 1
    else
        last=$(f $(( $1 - 1 )))
        echo $(( $1 * last ))
    fi
}

ifco() { echo $(ip a) | sed -E 's/inet ([0-9]{3}\.[0-9]{3}\.[0-9]{3}\.[0-9]+).*/\1/' | grep inet }

mp(){
    case "$1" in
   b) echo b 
        mpv https://stream.zeno.fm/8c7v9dtvqp8uv
   ;;
   k) echo k
        mpv https://klassik.stream.laut.fm/klassik
   ;;
    n)
    mpv https://www.ndr.de/resources/metadaten/audio/aac/ndrblue.m3u
    ;;
    *)
        mpv http://146.71.118.220:35025/autodj

    esac
}

q(){ wget -O /dev/null http://speedtest.belwue.net/1G ; }

q2(){wget -O /dev/null --progress=dot:mega http://cachefly.cachefly.net/100mb.test; }

resolution(){system_profiler -json SPDisplaysDataType 2>/dev/null | python3 -c "import sys,json;d=next(i for i in json.load(sys.stdin)['SPDisplaysDataType'][0]['spdisplays_ndrvs'] if 'spdisplays_main' in i);print(d['_spdisplays_pixels'])";}

sc(){
    scp $1 tk@192.168.1.64:c:/users/tk/
}

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
