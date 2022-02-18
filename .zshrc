plugins=(common-aliases debian git pip zsh-autosuggestions )

export ZSH=~/.oh-my-zsh

zstyle ':completion:*' special-dirs true

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

PROMPT='%{$fg[cyan]%}%n@%m %{$fg[yellow]%} %(4~|./%2~|%~) %{$fg[cyan]%}$(get_ssid)%{$reset_color%} → '

get_ssid(){
	sed -e 's/^"//' -e 's/"$//' <<< `iwgetid | awk '{print }'|cut -f2 -d:`
}
