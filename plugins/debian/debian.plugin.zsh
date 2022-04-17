
alias ad="sudo apt update"
alias adg="sudo apt update && sudo apt upgrade"
alias ai="apt list --installed | grep"
alias ail="apt list --installed | less"
alias al='apt list --upgradable | less'
alias as='apt show'
alias au="sudo apt upgrade"
alias aar='sudo apt autoremove -y'
alias ar="sudo apt remove"
alias in='sudo apt install -y'
alias iu='sudo dhclient $eth; ifconfig'


# print all installed packages
alias allpkgs='aptitude search -F "%p" --disable-columns ~i'

# Prints apt history
#   apt-history install
#   apt-history upgrade
#   apt-history remove
#   apt-history list
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
      echo " install - Lists all packages that have been installed."
      echo " upgrade - Lists all packages that have been upgraded."
      echo " remove - Lists all packages that have been removed."
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
