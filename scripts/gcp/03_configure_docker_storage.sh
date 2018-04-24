ansible all -m copy -a "src=03_docker_storage_setup dest=/var/lib/docker/docker-storage-setup"
ansible all -a "docker-storage-setup"
