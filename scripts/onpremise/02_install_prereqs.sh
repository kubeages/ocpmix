#!/bin/bash

ALL_HOSTS="master infranode appnode1 appnode2 appnode3 appnode4"

for host in $ALL_HOSTS
do

ssh -tt $host "yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct nfs-utils httpd-utils cri-o -y; yum update -y; yum install atomic-openshift-utils atomic-openshift-clients glusterfs-fuse docker-1.13.1 -y"

[ $? -ne 0 ] && echo "** FAIL **"

done
