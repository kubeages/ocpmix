#!/bin/bash

ALL_HOSTS="master infranode appnode1 appnode2 appnode3"

for host in $ALL_HOSTS
do

echo "Registering node $host"
ssh -tt $host "subscription-manager register --username=RHN_USER --password=RHN_PWD"
ssh -tt $host "subscription-manager attach --pool=RHN_POOLID"
echo "Enabling repos for $host"
ssh -tt $host "subscription-manager repos --disable=* --enable='rhel-7-server-rpms' --enable='rhel-7-server-extras-rpms' --enable='rhel-7-server-ose-3.9-rpms' --enable='rhel-7-fast-datapath-rpms' --enable='rhel-7-server-ansible-2.4-rpms' --enable='rh-gluster-3-client-for-rhel-7-server-rpms'"

[ $? -ne 0 ] && echo "** FAIL **"

done
