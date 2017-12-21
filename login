#!/usr/bin/expect

#set prompt "shell@"

if { [lindex $argv 1] eq "" } {
	set port 22
}

#set letzesOktett 111
#set basis "192.168.43."

spawn ssh root@188.194.163.73

#expect arch {
send "0;cd\r"
#}

interact

