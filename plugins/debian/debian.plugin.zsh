
alias aar='sudo apt autoremove -y'
alias ad="sudo apt update"
alias adg="sudo apt update && sudo apt upgrade"
alias ai="apt list --installed | grep"
alias ail="apt list --installed | less"
alias al='apt list --upgradable'
alias ar="sudo apt remove"
alias as='apt show'
alias au="sudo apt upgrade"
alias di=dict
alias in='sudo apt install -y'
alias iu='sudo dhclient $eth; ifconfig'
alias pm='sudo pm-suspend'

function cb { echo "$@"|xclip -selection clipboard }
function cc { echo `$@`|xclip -selection clipboard }


function apt-history() {
  case "$1" in
    install)
      zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
      ;;
    upgrade|remove)
      zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
      ;;
    list)
      zgrep --no-filename '' $(ls -rt /var/log/dpkg*)
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
