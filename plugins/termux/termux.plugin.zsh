
# apt
alias aar='apt autoremove -y'
alias ad="apt update"
alias ai="apt list --installed | grep"
alias al='apt list --upgradable'
alias ar="apt remove"
alias as='apt show'
alias au="apt upgrade -y"
alias in='apt install -y'


b=$0
a=(${(s|custom/plugins/macos/|)b})
echo $a[2] loaded

