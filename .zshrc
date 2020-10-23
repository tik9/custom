# echo 'start zshrc'		
plugins=(common-aliases debian git zsh-autosuggestions zsh-syntax-highlighting)

# export ZSH=/usr/share/oh-my-zsh
export ZSH="/home/tk/.oh-my-zsh"

# zstyle ':completion:*' special-dirs true

ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

# PROMPT='%{$fg[cyan]%}%n@%m %{$fg[yellow]%} %(4~|./%2~|%~) %{$fg[cyan]%}$(get_ssid)%{$reset_color%} → '
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# get_ssid(){
# 	sed -e 's/^"//' -e 's/"$//' <<< `iwgetid | awk '{print }'|cut -f2 -d:`
# }

# nur windows wsl2
# echo 'vor Pfad'
export PATH=C:\Python39\Scripts\;C:\Python39\;C:\Program Files (x86)\Intel\TXE Components\iCLS\;C:\Program Files\Intel\TXE Components\iCLS\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\Intel\TXE Components\DAL\;C:\Program Files (x86)\Intel\TXE Components\DAL\;C:\Program Files\Intel\TXE Components\IPT\;C:\Program Files (x86)\Intel\TXE Components\IPT\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\ProgramData\chocolatey\bin;C:\Users\User\AppData\Local\Microsoft\WindowsApps;C:\git/cmd;C:\Program Files\Microsoft VS Code;C:\Users\User\AppData\Local\SumatraPDF;C:\Program Files\Docker\Docker\resources\bin;C:\ProgramData\DockerDesktop\version-bin;;;c:\notepad++;;C:\Program Files\Microsoft VS Code\bin;C:\Users\User\AppData\Local\Microsoft\WindowsApps;C:\Users\User\AppData\Local\Pandoc\;C:\Program Files\Oracle\VirtualBox;
# echo 'nach Pfad'
