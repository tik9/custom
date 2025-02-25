
alias pm='sudo pm-suspend'

# apt
alias aar='sudo apt autoremove -y'
alias ad="sudo apt update"
alias ai="apt list --installed | grep"
alias al='apt list --upgradable'
alias ar="sudo apt remove"
alias as='apt show'
alias au="sudo apt upgrade -y"
alias in='sudo apt install -y'

function de {  apt show "$@" | grep -E 'Description|^' }

function cb { echo "$@"|xclip -selection clipboard }
function cc { echo `$@`|xclip -selection clipboard }


# List packages by size
function apt-list-packages() {
    dpkg-query -W --showformat='${Installed-Size} ${Package} ${Status}\n' | \
    grep -v deinstall | \
    sort -n | \
    awk '{print $1" "$2}'
}

b=$0
a=(${(s|custom/plugins/debian/|)b})
echo $a[2] loaded
