#termux-setup-storage

apt install curl expect jq python vim wget zsh -y

pip install ipython pipdeptree

 apt update
 apt upgrade -y

# oh-my-zsh install. für termux:
# https://github.com/termux/termux-packages/issues/37
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh --depth 1

chsh -s zsh

cp .zshrc_an $HOME/.zshrc
cd $HOME/.oh-my-zsh
rm -rf custom

git clone https://github.com/tik9/custom
#git config --global user.email smart@and
#git config --global user.name us_and
#git submodule update

#exec zsh
