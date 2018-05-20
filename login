#!/usr/bin/expect


#set letzesOktett 111
#set basis "192.168.43."

spawn ssh root@188.194.163.73
#python3 soup.py

expect rasp {
#	send ";\r"
}

interact

