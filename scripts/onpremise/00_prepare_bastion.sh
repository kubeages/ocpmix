#!/bin/bash
#sudo subscription-manager register --username=RHN_USER --password=RHN_PWD
#sudo subscription-manager attach --pool=POOL_ID
subscription-manager repos --disable=* --enable='rhel-7-server-rpms' --enable='rhel-7-server-extras-rpms' --enable='rhel-7-server-ose-3.9-rpms' --enable='rhel-7-fast-datapath-rpms' --enable='rhel-7-server-ansible-2.4-rpms' --enable='rh-gluster-3-client-for-rhel-7-server-rpms'
yum -y update
yum install -y atomic-openshift-utils atomic-openshift-clients wget git screen bash-completion nfs-utils
