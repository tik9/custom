		
plugins=(common-aliases git git-prompt zsh-autosuggestions )

export ZSH=/usr/share/oh-my-zsh

zstyle ':completion:*' special-dirs true

fpath=($ZSH/custom/functions $fpath)

#autoload _rest
#_rest 

DISABLE_AUTO_UPDATE="true"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

source $ZSH/custom/oh-my-zsh.sh

PROMPT='%{$fg[cyan]%}%n@%m %{$fg[yellow]%} %(4~|./%2~|%~) %{$fg[cyan]%}$(get_ssid)%{$reset_color%} → '

get_ssid(){
	sed -e 's/^"//' -e 's/"$//' <<< `iwgetid | awk '{print }'|cut -f2 -d:`
}
