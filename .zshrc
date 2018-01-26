
plugins=(common-aliases git git-prompt ubuntu zsh-autosuggestions python django)

# Pfad zur oh-my-zsh installation.
  export ZSH=/usr/share/oh-my-zsh

zstyle ':completion:*' special-dirs true

HOSTNAME=$(hostname)

fpath=($ZSH/custom/functions $fpath)

#ZSH_THEME="robbyrussell"
ZSH_THEME="test"

#autoload _git2
#autoload _rest
#_git2
#_rest 


DISABLE_AUTO_UPDATE="true"


export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

source $ZSH/custom/oh-my-zsh.sh

PROMPT='%{$fg[cyan]%}%m %{$fg[yellow]%} %(4~|./%2~|%~) %{$fg[cyan]%}%{$reset_color%} → '
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
