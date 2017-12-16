#!/usr/bin/expect

#set prompt "shell@"

if { [lindex $argv 1] eq "" } {
	set port 22
}

#set letzesOktett 111
#set basis "192.168.43."

set basis "178.27.250.8"

spawn ssh root@${basis}

#expect arch {
send "0;cd\r"
#}

interact

