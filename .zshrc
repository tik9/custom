
plugins=(common-aliases git ubuntu zsh-autosuggestions python)

export ZSH=/usr/share/oh-my-zsh

zstyle ':completion:*' special-dirs true

HOSTNAME=$(hostname)

fpath=($ZSH/custom/functions $fpath)

DISABLE_AUTO_UPDATE="true"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

source $ZSH/custom/oh-my-zsh.sh

PROMPT='%{$fg[cyan]%}%n@%m %{$fg[yellow]%} %(4~|./%2~|%~) %{$fg[cyan]%}%{$reset_color%} → '
