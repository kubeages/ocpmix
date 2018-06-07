ansible all -a "mkdir -p /usr/lib/docker-storage-setup"
ansible all -m copy -a "src=03_docker_storage_setup dest=/usr/lib/docker-storage-setup/docker-storage-setup"

