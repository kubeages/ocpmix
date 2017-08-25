#!/bin/bash
# bastion tasks
subscription-manager repos --disable="rhel-7-server-ose-3.5-rpms" --enable="rhel-7-server-ose-3.6-rpms"
yum clean all
yum update -y atomic-openshift-utils

# nodes tasks
ansible all -a "subscription-manager repos --disable=\"rhel-7-server-ose-3.5-rpms\" --enable=\"rhel-7-server-ose-3.6-rpms\""
ansible all -a "yum clean all"
ansible all -a "yum update -y atomic-openshift-utils"

# run update playbook
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/upgrades/v3_6/upgrade.yml
