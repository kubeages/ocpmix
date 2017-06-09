#!/bin/bash

ALL_HOSTS="ip-172-31-7-149.ec2.internal ip-172-31-5-169.ec2.internal ip-172-31-13-104.ec2.internal ip-172-31-6-112.ec2.internal"

for host in $ALL_HOSTS
do

echo "Registrando nodo $host"
ssh -tt $host "subscription-manager register --username=YOUR_RHN_USERNAME --password=YOUR_RHN_PASSWORD"
ssh -tt $host "subscription-manager attach --pool=YOUR_RHN_POOL_ID"

echo "Habilitando repos en $host"
ssh -tt $host "subscription-manager repos --disable=*; sudo subscription-manager repos --enable='rhel-7-server-rpms' --enable='rhel-7-server-extras-rpms' --enable='rhel-7-server-ose-3.5-rpms' --enable='rhel-7-fast-datapath-rpms'"

[ $? -ne 0 ] && echo "** FAIL **"

done
