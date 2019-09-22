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
    i add tcp port [port]
    i rm tcp port [port]
    i add udp port [port]
    i rm udp port [port]
    i list port
    i list all
   
EOF
fi
