#!/bin/bash

ALL_HOSTS="master1 infranode1 appnode1 appnode2 appnode3"

for host in $ALL_HOSTS
do

ssh -tt $host "sudo systemctl enable docker; sudo systemctl restart docker; sudo docker info"

done
