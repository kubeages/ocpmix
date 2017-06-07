#!/bin/bash

ALL_HOSTS="master1 infranode1 appnode1 appnode2 appnode3"

for host in $ALL_HOSTS
do

echo "Registering and attaching node $host"
ssh -tt $host "sudo subscription-manager register --username='RHN_USERNAME' --password='RHN_PASSWORD'"
ssh -tt $host "sudo subscription-manager attach --pool=RHN_SUBS_POOLID"

echo "Habilitando repos en $host"
ssh -tt $host "sudo subscription-manager repos --disable=*; sudo subscription-manager repos --enable='rhel-7-server-rpms' --enable='rhel-7-server-extras-rpms' --enable='rhel-7-server-ose-3.5-rpms' --enable='rhel-7-fast-datapath-rpms'"

[ $? -ne 0 ] && echo "** FAIL **"

done
