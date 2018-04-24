#!/bin/bash

ALL_HOSTS="master infranode appnode1 appnode2"

for host in $ALL_HOSTS
do

echo "Registering node $host"
ssh -tt $host "sudo subscription-manager register --username=RHN_USER --password=RHN_PWD"
ssh -tt $host "sudo subscription-manager refresh"
ssh -tt $host "sudo subscription-manager attach --pool=POOL_ID"
echo "Enabling repos for $host"
ssh -tt $host "sudo subscription-manager repos --disable=* --enable='rhel-7-server-rpms' --enable='rhel-7-server-extras-rpms' --enable='rhel-7-server-ose-3.9-rpms' --enable='rhel-7-fast-datapath-rpms' --enable='rhel-7-server-ansible-2.4-rpms'"

[ $? -ne 0 ] && echo "** FAIL **"

done
