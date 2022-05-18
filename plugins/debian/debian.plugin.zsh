
alias di=dict
alias iu='sudo dhclient $eth; ifconfig'
alias pm='sudo pm-suspend'

# apt
alias aar='sudo apt autoremove -y'
alias ad="sudo apt-get update"
alias ai="apt list --installed | grep"
alias ail="apt list --installed | less"
alias al='apt list --upgradable'
alias ar="sudo apt remove"
alias as='apt show'
alias au="sudo apt upgrade"
alias in='sudo apt install -y'

function de {
  apt-get show "$@" | grep -E 'Description|^'
}

function cb { echo "$@"|xclip -selection clipboard }
function cc { echo `$@`|xclip -selection clipboard }


function apt-hi() {
  case "$1" in
    upgrade|remove|install)
      grep $1 /var/log/dpkg.log
      ;;
    list)
      grep '' /var/log/dpkg.log
      ;;
    *)
      echo "Parameters:"
      echo " install - Lists all installed packages."
      echo " upgrade - Lists all upgraded packages."
      echo " remove - Lists all removed packages."
      echo " list - Lists all contains of dpkg logs."
      ;;
  esac
}

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
