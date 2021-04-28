function gtbare {
	ip=192.168.178.36
 	 ssh git@$ip \
	 "
	 mkdir /gt/.git 
	 cd /gt/.git
	 echo ###### > description
	 git init --bare
	 "
}

echo $0 loaded