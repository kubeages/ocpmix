#!/bin/bash

ALL_HOSTS="localhost ip-172-31-7-149.ec2.internal ip-172-31-5-169.ec2.internal ip-172-31-13-104.ec2.internal ip-172-31-6-112.ec2.internal"

for host in $ALL_HOSTS
do

ssh -tt $host "yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion -y; yum update -y; yum install atomic-openshift-utils -y; yum install atomic-openshift-excluder atomic-openshift-docker-excluder -y; atomic-openshift-excluder unexclude; atomic-openshift-docker-excluder unexclude; yum install docker -y"

[ $? -ne 0 ] && echo "** FAIL **"

done
