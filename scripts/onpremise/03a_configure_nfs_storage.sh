#!/bin/bash

ALL_HOSTS="master infranode appnode1 appnode2 appnode3 appnode4"

for host in $ALL_HOSTS
do

echo "Configuring NFS for node $host"
ssh -tt $host "sudo setsebool -P virt_use_nfs 1"
ssh -tt $host "sudo iptables -I INPUT 1 -p tcp --dport 2049 -j ACCEPT; sudo iptables -I INPUT 1 -p tcp --dport 20048 -j ACCEPT; sudo iptables -I INPUT 1 -p tcp --dport 111 -j ACCEPT"

[ $? -ne 0 ] && echo "** FAIL **"

done
