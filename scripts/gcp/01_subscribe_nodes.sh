#!/bin/bash

ALL_HOSTS="ocpmaster ocpinfra ocpappnode1 ocpappnode2"

for host in $ALL_HOSTS
do

echo "Registering node $host"
ssh -tt $host "subscription-manager register --username=YOUR_RHN_USERNAME --password=YOUR_RHN_PASSWORD"
ssh -tt $host "subscription-manager attach --pool=YOUR_RHN_POOL_ID"
echo "Enabling repos for $host"
ssh -tt $host "sudo subscription-manager repos --disable=*; sudo subscription-manager repos --enable='rhel-7-server-rpms' --enable='rhel-7-server-extras-rpms' --enable='rhel-7-server-ose-3.6-rpms' --enable='rhel-7-fast-datapath-rpms'"

[ $? -ne 0 ] && echo "** FAIL **"

done