plugins=(common-aliases git git-prompt zsh-autosuggestions )

# Pfad zur oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh
  #export ZSH=/usr/share/oh-my-zsh

zstyle ':completion:*' special-dirs true

HOSTNAME=$(hostname)

fpath=($ZSH/custom/functions $fpath)

#ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/custom/oh-my-zsh.sh
