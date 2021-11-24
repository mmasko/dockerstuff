#!/bin/bash
# ansible -m debug -a var=ansible_host localhost
# ansible-playbook playbook.yml

pip install --upgrade --user \
    ansible==2.9.7 \
    ansible-lint \
    pywinrm \
    pyvmomi