#!/bin/bash

rpm -q $1 &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package installed"        
else
    while true; do
        read -p "Do you want to install this package?" yn
        case $yn in
            [Yn]* ) yum -y install $1; break;;
            [Nn]* ) exit;;
            *)echo "Please answer Y or N"
        esac
     done
fi

varnames=$(systemctl status $1 | grep Active | awk ‘{print$2}’)
varnames2=“inactive”

If [ $varname == $varname2 ]; then
	while true; do
        read -p "Service inactive. Do you want to start this service?" yn
        case $yn in
            [Yn]* ) systemctl start $1; break;;
            [Nn]* ) exit;;
            *)echo "Please answer Y or N"
fi            
