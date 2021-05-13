

function ak {
	ssh $@ 'cat .ssh/authorized_keys'
}	

function cp_key {
	
	source_ip=$root_ip.$termux_ip
	id_rsa=/root/id_rsa.pub
	id_rsa_src=.ssh/id_rsa.pub
	ssh $source_ip $termux_port "./exp p scp -o 'StrictHostKeyChecking no' $id_rsa_src $rasp_ip:$id_rsa" 
	ssh $rasp_ip "rm $id_rsa"
	ssh $rasp_ip 'cat /root/id_rsa.pub >> .ssh/authorized_keys'
	ss_ak $rasp_ip
}


function ic {
	geraet=$wlan
	geraet=$eth

	ipa=$(ip addr show $geraet)
	 ipa=$(echo $ipa | sed -nr 's/\s+inet\s([0-9]{3}\.[0-9]+\.[0-9]+\.[0-9]+).*/\1/p')
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
