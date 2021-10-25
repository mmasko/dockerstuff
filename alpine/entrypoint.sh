#!/bin/bash
ansible -m debug -a var=ansible_host localhost
ansible-playbook playbook.yml