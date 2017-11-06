#!/bin/bash

ALL_HOSTS="ocpmaster ocpinfra ocpappnode1 ocpappnode2"

for host in $ALL_HOSTS
do

ssh -tt $host "sudo systemctl enable docker; sudo systemctl restart docker; sudo docker info"

done