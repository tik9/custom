		
plugins=(common-aliases debian git zsh-autosuggestions zsh-syntax-highlighting)

# export ZSH=/usr/share/oh-my-zsh
export ZSH="/home/tk/.oh-my-zsh"

# zstyle ':completion:*' special-dirs true

ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

source $ZSH/custom/oh-my-zsh.sh

PROMPT='%{$fg[cyan]%}%n@%m %{$fg[yellow]%} %(4~|./%2~|%~) %{$fg[cyan]%}$(get_ssid)%{$reset_color%} → '

get_ssid(){
	sed -e 's/^"//' -e 's/"$//' <<< `iwgetid | awk '{print }'|cut -f2 -d:`
}

# nur windows wsl2
#export PATH=/mnt/c/notepad++:/mnt/c/git/cmd:$PATH
#  /mnt/c/Programme/Docker/Docker/resources/bin
# /mnt/C/ProgramData\DockerDesktop\version-binalias git=git.exe
