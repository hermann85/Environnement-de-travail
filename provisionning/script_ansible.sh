### Ansible repository configuration
apt-get update
apt-get install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible

### Ansible installation
apt-get install -y ansible
