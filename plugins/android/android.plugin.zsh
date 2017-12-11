

function q(){
	# zeige WLAN ssid (iwget)?

	datei=test100.zip

	trap int_trap INT
	echo Ctrl-C zum Beenden des downloads $datei

	wget http://speedtest.wdc01.softlayer.com/downloads/$datei 
	
	if [ -f $datei ];then ; rm $datei; echo "$datei wird gelöscht"; fi	
	echo Ende
}


alias inst='apt list --installed'
alias lo="logcat -s 'syslog:*'"
alias b="vi"
