#!/bin/bash

command=${@:1:3}
protocol=$2
port=$4

if [[ $command == "add $protocol port" ]] ; then
    firewall-cmd --zone=public --add-port=${port}/${protocol} --permanent
    systemctl restart firewalld
    firewall-cmd --list-ports
fi

if [[ $command == "rm $protocol port" ]] ; then
    firewall-cmd --zone=public --remove-port=${port}/${protocol} --permanent
    systemctl restart firewalld
    firewall-cmd --list-ports
fi

if [[ $command == "list port" ]] ; then
    firewall-cmd --list-ports
fi

if [[ $command == "list all" ]] ; then
    firewall-cmd --list-all
fi

if [[ $command == "help" ||  $command == "-h" || $command == "--help" ]] ; then 
    cat <<-'EOF'

Use Age:
    l add tcp port [port]
    l rm tcp port [port]
    l add udp port [port]
    l rm udp port [port]
    l list port
    l list all
   
EOF
fi
