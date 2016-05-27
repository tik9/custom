#!/bin/zsh

#ad2(){
#adb push "$1" storage/sdcard/
#}

g(){
	geany $1 &
}


# Hilfe
he(){
$1 --help
}

# alt-s --> Sudo
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

las(){
amixer set PCM $(expr $1 \* 10)%
echo "Argument \$1 mit 10 multipliziert"
}

lag(){
    amixer get PCM
}

# login remote shell
lss(){
	base='192.168.1'
        ssh $base.$1
        echo "Mit $base.$1 (\$1) verbunden"
}

m(){
	mupdf $1 &
}


sc(){
    prod=192.168.1.115
	scp -r $1  $prod:$2
        echo "$1 (\$1) nach $prod:$2(\$2) kopiert"
}

ta(){
	tail $2
}

yt(){
	youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(title)s.)s" $1
echo $1 heruntergeladen
}

echo "$0 aktualisiert von $$"
