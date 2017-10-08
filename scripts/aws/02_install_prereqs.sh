#!/bin/bash

ALL_HOSTS="localhost ip-172-31-4-76.ec2.internal ip-172-31-11-202.ec2.internal ip-172-31-8-217.ec2.internal ip-172-31-0-92.ec2.internal"

for host in $ALL_HOSTS
do

ssh -tt $host "yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct -y; yum update -y; yum install atomic-openshift-utils -y; yum install docker -y"

[ $? -ne 0 ] && echo "** FAIL **"

done
