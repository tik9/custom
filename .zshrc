
plugins=( common-aliases git zsh-autosuggestions)

export ZSH=~/.oh-my-zsh

ZSH_THEME="random"

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

HOMEBREW_NO_INSTALL_CLEANUP=TRUE

zstyle ':completion:*' special-dirs true
# zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'