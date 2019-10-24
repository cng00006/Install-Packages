#!/bin/bash

rpm -q $1 &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package installed"        
else
    while true; do
        read -p "$1 not installed. Do you want to install this package?" yn
        case $yn in
            [Yn]* ) yum -y install $1; break;;
            [Nn]* ) exit;;
            *)echo "Please answer Y or N"
        esac
     done

     while true; do
        read -p "Service inactive. Do you want to start this service?" yn
        case $yn in
            [Yn]* ) systemctl start $1; break;;
            [Nn]* ) exit;;
            *)echo "Please answer Y or N"
        esac
     done     
fi
