function gtbare {
	ip=192.168.178.36
 	 ssh git@$ip \
	 "
	 mkdir /gt/bewerbung.git 
	 cd /gt/bewerbung.git
	 echo ###Bewerbungen### > description
	 git init --bare
	 "
}

gtbare
