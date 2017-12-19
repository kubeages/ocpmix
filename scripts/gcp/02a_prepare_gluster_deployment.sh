#!/bin/bash

ansible glusterfs -a "subscription-manager repos --enable=rh-gluster-3-client-for-rhel-7-server-rpms"
ansible nodes -a "yum install glusterfs-fuse -y"
