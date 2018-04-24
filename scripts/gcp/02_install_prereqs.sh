#!/bin/bash

ALL_HOSTS="master infranode appnode1 appnode2"

for host in $ALL_HOSTS
do

ssh -tt $host "sudo yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct -y; sudo yum update -y; sudo yum install atomic-openshift-utils atomic-openshift-clients docker-1.13.1 -y"

[ $? -ne 0 ] && echo "** FAIL **"

done
