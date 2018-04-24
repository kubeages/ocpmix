#!/bin/bash
sudo subscription-manager register --username=RHN_USER --password=RHN_PWD
sudo subscription-manager refresh
sudo subscription-manager attach --pool=POOL_ID
sudo subscription-manager repos --disable=* --enable='rhel-7-server-rpms' --enable='rhel-7-server-extras-rpms' --enable='rhel-7-server-ose-3.9-rpms' --enable='rhel-7-fast-datapath-rpms' --enable='rhel-7-server-ansible-2.4-rpms'
sudo yum -y update
sudo yum install -y atomic-openshift-utils atomic-openshift-clients wget git screen bash-completion tmux bind-utils net-tools