#!/bin/bash

terraform init
time terraform apply -auto-approve
sleep 90

cat inventory.ini
ansible-playbook disable_selinux.yml
ansible-galaxy install andrewrothstein.etcd-cluster
ansible-playbook etcd_cluster.yml

# Zookeeper
# ansible-galaxy install andrewrothstein.zookeeper-cluster
# # https://github.com/andrewrothstein/ansible-zookeeper-cluster/issues/9
# ansible-galaxy install andrewrothstein.zookeeper --force
# ansible-playbook install_zookeeper_cluster.yml
