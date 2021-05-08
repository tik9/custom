

function ak {
	ssh $@ 'cat .ssh/authorized_keys'
}	

function cp_key {
	root_ip=192.168.178
	final_ip=root@$root_ip.36
	source_ip=$root_ip.38
	id_rsa=/root/id_rsa.pub
	id_rsa_src=.ssh/id_rsa.pub
	ssh $source_ip -p8022 "./exp p scp -o 'StrictHostKeyChecking no' $id_rsa_src $final_ip:$id_rsa" 
	ssh $final_ip "rm $id_rsa"
	ssh $final_ip 'cat /root/id_rsa.pub >> .ssh/authorized_keys'
	ss_ak $final_ip
}


function ic {
	geraet=wlp2s0
	geraet=enx00e04c680015

	ipa=$(ip addr show $geraet)
	 ipa=$(echo $ipa | sed -nr 's/\s+inet\s([0-9]{3}\.[0-9]{3}\.[0-9]+\.[0-9]+).*/\1/p')
	 echo "$ipa \n$geraet"
}

function ic2 {
	ipa=$(ifconfig | sed -nr 's/\s+inet\s([0-9]{3}\.[0-9]{3}\.[0-9]+\.[0-9]+).*/\1/p')
	echo $ipa
}

function plu_f {
	sed -i 's/.*plugins=(.*/plugins=(common-aliases debian git zsh-autosuggestions)/' ~/.zshrc
}


function visud { 
	us=git
	sed '$a'$us' ALL=(ALL) NOPASSWD:ALL' /etc/sudoers 
}

function wlans {
	if=wlp2s0
	iwlist $if scan | $(sed -n 's/ESSID:"\(.*\)"/\1/p;s/Quality=\([0-9][0-9]\/[0-9][0-9]\).*/\1/p')
}

b=$0
a=("${(s|custom/|)b}")

echo $a[2] loaded
