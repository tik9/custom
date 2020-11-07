
function as(){
	apt show $1
}

function in(){
	apt install $1 -y	
}

function re {
	apt remove $1 -y
}



# Some self-explanatory aliases
alias aar='apt autoremove -y'
alias acs="apt-cache search"
alias aps='aptitude search'
alias as="aptitude -F '* %p -> %d \n(%v/%V)' --no-gui --disable-columns search"

# apt-file
alias afs='apt-file search --regexp'


# These are apt-get only
alias asrc='apt-get source'
alias app='apt-cache policy'

# superuser operations ######################################################
# if [[ $use_sudo -eq 1 ]]; then
# commands using  #######
    alias ac=" apt clean"
    alias ad=" apt update"
    alias adg=" apt update &&  apt upgrade"
    alias adu=" apt update &&  apt dist-upgrade"
    alias afu=" apt-file update"
    alias ali=" apt list --installed"
    alias alu=" apt list --upgradable"
    alias au=" apt upgrade"
    alias ai=" apt install"
    # Install all packages given on the command line while using only the first word of each line:
    # acs ... | ail
    alias ail="sed -e 's/  */ /g' -e 's/ *//' | cut -s -d ' ' -f 1 | xargs  apt install"
    alias ap=" apt purge"
    alias ar=" apt remove"

    # apt-get only
    alias ads=" apt-get dselect-upgrade"

    # Install all .deb files in the current directory.
    # Warning: you will need to put the glob in single quotes if you use:
    # glob_subst
    alias dia=" dpkg -i ./*.deb"
    alias di=" dpkg -i"

    # Remove ALL kernel images and headers EXCEPT the one in use
    alias kclean=' aptitude remove -P ?and(~i~nlinux-(ima|hea) ?not(~n$(uname -r)))'
# fi

# Completion ################################################################

#
# Registers a compdef for $1 that calls apt with the commands $2
# To do that it creates a new completion function called _apt_pref_$2
#
function apt_pref_compdef() {
    local f fb
    f="_apt_pref_${2}"

    eval "function ${f}() {
        shift words;
        service=\"\apt\";
        words=(\"\apt\" '$2' \$words);
        ((CURRENT++))
        test \"\${apt_pref}\" = 'aptitude' && _aptitude || _apt
    }"

    compdef "$f" "$1"
}

apt_pref_compdef aac "autoclean"
apt_pref_compdef abd "build-dep"
apt_pref_compdef ac  "clean"
apt_pref_compdef ad  "update"
apt_pref_compdef afu "update"
apt_pref_compdef au  "upgrade"
apt_pref_compdef ai  "install"
apt_pref_compdef ail "install"
apt_pref_compdef ap  "purge"
apt_pref_compdef ar  "remove"
apt_pref_compdef ads "dselect-upgrade"

# Misc. #####################################################################
# print all installed packages
alias allpkgs='aptitude search -F "%p" --disable-columns ~i'

# Create a basic .deb package
alias mydeb='time dpkg-buildpackage -rfakeroot -us -uc'


# Functions #################################################################
# create a simple script that can be used to 'duplicate' a system
function apt-copy() {
    print '#!/bin/sh'"\n" > apt-copy.sh

    cmd='apt install'

    for p in ${(f)"$(aptitude search -F "%p" --disable-columns \~i)"}; {
        cmd="${cmd} ${p}"
    }

    print $cmd "\n" >> apt-copy.sh

    chmod +x apt-copy.sh
}

# Prints apt history
# Usage:
#   apt-history install
#   apt-history upgrade
#   apt-history remove
#   apt-history rollback
#   apt-history list
# Based On: https://linuxcommando.blogspot.com/2008/08/how-to-show-apt-log-history.html
function apt-history() {
  case "$1" in
    install)
      zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
      ;;
    upgrade|remove)
      zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
      ;;
    rollback)
      zgrep --no-filename upgrade $(ls -rt /var/log/dpkg*) | \
        grep "$2" -A10000000 | \
        grep "$3" -B10000000 | \
        awk '{print $4"="$5}'
      ;;
    list)
      zgrep --no-filename '' $(ls -rt /var/log/dpkg*)
      ;;
    *)
      echo "Parameters:"
      echo " install - Lists all packages that have been installed."
      echo " upgrade - Lists all packages that have been upgraded."
      echo " remove - Lists all packages that have been removed."
      echo " rollback - Lists rollback information."
      echo " list - Lists all contains of dpkg logs."
      ;;
  esac
}

# Kernel-package building shortcut
function kerndeb() {
    # temporarily unset MAKEFLAGS ( '-j3' will fail )
    MAKEFLAGS=$( print - $MAKEFLAGS | perl -pe 's/-j\s*[\d]+//g' )
    print '$MAKEFLAGS set to '"'$MAKEFLAGS'"
    appendage='-custom' # this shows up in $(uname -r )
    revision=$(date +"%Y%m%d") # this shows up in the .deb file name

    make-kpkg clean

    time fakeroot make-kpkg --append-to-version "$appendage" --revision \
        "$revision" kernel_image kernel_headers
}

# List packages by size
function apt-list-packages() {
    dpkg-query -W --showformat='${Installed-Size} ${Package} ${Status}\n' | \
    grep -v deinstall | \
    sort -n | \
    awk '{print $1" "$2}'
}
