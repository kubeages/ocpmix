#!/bin/bash

ALL_HOSTS="master appnode1 appnode2 appnode3"

for host in $ALL_HOSTS
do

ssh -tt $host "systemctl enable docker --now; docker info"

done
