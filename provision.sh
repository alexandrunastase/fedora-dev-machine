#!/bin/sh

#Install ansible in order to be able to run the playbook
sudo dnf install ansible

# Run the playbook
ansible-playbook playbook.yml --ask-become-pass