#!/bin/bash

ALL_HOSTS="172.31.6.112 172.31.7.149 172.31.5.169 172.31.13.104"

for host in $ALL_HOSTS
do

ssh -tt $host "sudo systemctl enable docker; sudo systemctl restart docker; sudo docker info"

done
