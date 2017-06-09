#!/bin/bash

ALL_HOSTS="172.31.6.112 172.31.7.149 172.31.5.169 172.31.13.104"

DEV=/dev/xvdb

for host in $ALL_HOSTS
do

## enable lvm services
ssh -tt $host "sudo systemctl enable lvm2-lvmetad.service;sudo systemctl start lvm2-lvmetad.service;
sudo systemctl enable lvm2-lvmpolld.service; sudo systemctl start lvm2-lvmpolld.service"

# create a VG from the above device and create a vg for /var/lib/docker
ssh -tt $host "sudo pvcreate $DEV; sudo vgcreate ocp $DEV"

# configure Docker Storage Setup to use this VG
ssh -tt $host "sudo bash -c \"echo \"VG=ocp\" > /etc/sysconfig/docker-storage-setup\" ; sudo docker-storage-setup "

done
