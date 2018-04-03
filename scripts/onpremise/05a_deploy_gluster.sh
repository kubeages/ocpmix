ansible nodes -a "subscription-manager repos --enable=rh-gluster-3-for-rhel-7-server-rpms"
ansible-playbook prepare_gluster_block.yml
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-glusterfs/config.yml
