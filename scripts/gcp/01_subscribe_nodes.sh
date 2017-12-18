#!/bin/bash

ALL_HOSTS="ocpmaster ocpinfra ocpappnode1 ocpappnode2 ocpappnode3"

for host in $ALL_HOSTS
do

echo "Registering node $host"
ssh -tt $host "sudo subscription-manager register --username=agallego2 --password=redhat123"
ssh -tt $host "sudo subscription-manager attach --pool=8a85f98c5f9a9be6015f9ac7fd8b0392"
echo "Enabling repos for $host"
ssh -tt $host "sudo subscription-manager repos --disable=* --enable='rhel-7-server-rpms' --enable='rhel-7-server-extras-rpms' --enable='rhel-7-server-ose-3.7-rpms' --enable='rhel-7-fast-datapath-rpms'"

[ $? -ne 0 ] && echo "** FAIL **"

done
