#!/bin/bash

home="~/";

echo Skript $0 Start

apt-get install -y ack-grep dict dict-de-en dictd expect ipython3 python3-pip   tree xclip
 

ipython3 python3-pip
# Editoren
#"vim"


# Server
# openssh-server

echo "${0} fertig"

function ss(){
	cat ~/.ssh/id_rsa.pub | ssh root@$sa 'cat >> ~/.ssh/authorized_keys'
	git config --global user.email
	cp /root/.zshrc ~/
}
