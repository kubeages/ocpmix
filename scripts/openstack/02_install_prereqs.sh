#!/bin/bash

ALL_HOSTS="master1 infranode1 appnode1 appnode2 appnode3"

for host in $ALL_HOSTS
do

ssh -tt $host "sudo yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct -y; sudo yum update -y; sudo yum install atomic-openshift-utils -y; sudo yum install docker-1.12.6 -y"

[ $? -ne 0 ] && echo "** FAIL **"

done
