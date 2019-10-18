#!/bin/bash

rpm -q $1 &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package installed"
    exit 0;        
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
