

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

function gh {
	sed 's/\(\s*url.*\)\(gith.*$\)/\1@'$1'\2/' .git/config
}

function gtbare {
	ip=192.168.178.36
	repo=vsform.git
	# ssh $ip \
	# 'mkdir /gt/vsform.git
	# cd /gt/vsform.git
	# touch /gt/vsform.git/t      
	# echo Repo für das Konfig. von VSCode > description   
	# git init --bare'

	# git remote add origin git@$ip:/gt/$repo
	# git remote -v
}

function ic {
	geraet=wlp2s0
	geraet=eth0

	ipa=$(ip addr show $geraet)
	 ipa=$(echo $ipa | sed -n 's/\s\{4\}inet\s\([0-9]\{3\}\.[0-9]\{3\}\.[0-9]\+\.[0-9]\+\).*/\1/p')
	 #~ inet \(192\.168\.178\.[0-9]*\).*/\1/p
	# fst3=${ipa:0:-3}.$1
	 echo ipa,geraet $ipa $geraet
	#  ssh $fst3 -p$2
}


function plu_f {
	sed -i 's/.*plugins=(.*/plugins=(common-aliases debian git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
}


function visud { 
	us=git
	sed '$a'$us' ALL=(ALL) NOPASSWD:ALL' /etc/sudoers 
}

function wlans {
	iwlist wlan0 scan | $(sed -n 's/ESSID:"\(.*\)"/\1/p;s/Quality=\([0-9][0-9]\/[0-9][0-9]\).*/\1/p')
}
