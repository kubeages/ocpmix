#!/bin/bash

ALL_HOSTS="master appnode1 appnode2 appnode3"

for host in $ALL_HOSTS
do

ssh -tt $host "yum install wget git net-tools bind-utils yum-utils tcpdump iptables-services bridge-utils bash-completion kexec-tools sos psacct nfs-utils -y; yum update -y; yum install glusterfs-fuse docker-1.13.1 -y"

[ $? -ne 0 ] && echo "** FAIL **"

done
