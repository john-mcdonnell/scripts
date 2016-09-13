#!/bin/bash

# Note: 11 is the id of the wired network card obtained from route print
# 172.20.142.254 is the swisslog gateway on the wired network

# MAC address of the network card to change the routing of.
MAC_ADDRESS="54 ee 75 36 1f f4"

echo MAC_ADDRESS:$MAC_ADDRESS.

echo
echo
echo

# Use the value of the first paramater or, if a parameter is not provided, derive the correct value by interrogating the system.
if [ -z "$1" ]; then
	#  Derive the correct value by interrogating the system.
	NETWORK_ELEMENT=`route print | grep "$MAC_ADDRESS" | cut --delimiter=. --fields 1 | tr --delete ' '`
else
	# Use first parameter
    NETWORK_ELEMENT=$1
fi

echo NETWORK_ELEMENT:$NETWORK_ELEMENT.

echo
echo
echo

route delete 0.0.0.0 if $NETWORK_ELEMENT
route add 172.0.0.0 mask 255.0.0.0 172.20.142.254 if $NETWORK_ELEMENT
route add 10.200.0.0 mask 255.255.0.0 172.20.142.254 if $NETWORK_ELEMENT

echo
echo
echo

read -p "Press <ENTER> to continue..."