#!/bin/bash

ALL_HOSTS="master infranode appnode1 appnode2"

for host in $ALL_HOSTS
do

ssh -tt $host "sudo systemctl enable docker; sudo systemctl restart docker; sudo docker info"

done
