#!/bin/bash
sudo subscription-manager register --username=RHN_USER --password=RHN_PWD
sudo subscription-manager attach --pool=POOL_ID
sudo yum -y update
sudo yum install -y atomic-openshift-utils atomic-openshift-clients wget git screen bash-completion nfs-utils
