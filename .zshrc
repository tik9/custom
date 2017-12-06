#root

# Pfad zur oh-my-zsh installation.
  export ZSH=/usr/share/oh-my-zsh

zstyle ':completion:*' special-dirs true

HOSTNAME=$(hostname)

fpath=($ZSH/custom/functions $fpath)

#ZSH_THEME="robbyrussell"
ZSH_THEME="test"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

autoload _git2
autoload _rest
_git2
_rest 

# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13


# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(common-aliases django git git-prompt python ubuntu zsh-autosuggestions)


export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/custom/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# bei 'ls' kein grüner Hintergrund: Anstatt Farbcode 34;42(blau,grün) wird 30;41 (schwarz,rot) bei OTHER_WRITABLE verwandt.

eval "$(dircolors ~/.dircolors)";
