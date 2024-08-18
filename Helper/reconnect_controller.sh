#!/run/current-system/sw/bin/expect -f

set MAC "70:F0:88:C1:E9:AB"
set timeout 30

spawn bluetoothctl

expect "Agent registered" {
    send "remove $MAC\n"
}

expect -re "Device has been removed|Device $MAC not available" {
    send "scan on\n"
}

expect -re ".*NEW.* Device $MAC " {
    send "pair $MAC\n"
}

expect "Paired: yes" {
    send "connect $MAC\n"
}

expect "Connection successful" {
    send "quit\n"
}
