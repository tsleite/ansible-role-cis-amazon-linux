#!/bin/bash
# Data: 02-04-2020

yum update -y ; yum install git -y
amazon-linux-extras install ansible2
ansible --version
yum install libselinux-python -y
getenforce

#Run only Level 1 tasks:
# ansible-playbook playbook.yml -t level-1

#Run only Section 3:
# ansible-playbook playbook.yml -t section-3

# Run tasks 1.3.1 and 2.2.10
# ansible-playbook playbook.yml -t 1.3.1,2.2.10

#Run scored tasks only:
#  ansible-playbook playbook.yml -t scored


# Run only Level 1 tasks
echo -e "\n\n 
===================== HOW TO RUN WITH ANSIBLE RULES ===============================\n
\n- Run only Level 1 tasks:  < ansible-playbook playbook.yml -t level-1 >

\n- Run only Section 3 tasks: <  ansible-playbook playbook.yml -t section-3 >

\n- Run tasks 1.3.1 and 2.2.10 only:  < ansible-playbook playbook.yml -t 1.3.1,2.2.10 >

\n- Run scored tasks only:  < ansible-playbook playbook.yml -t scored > \n\n

===================== HOW TO RUN WITH ANSIBLE RULES ===============================\n\n
"
echo -e " Yaml Ansible rules \n
- hosts: localhost
  connection: local
  gather_facts: true
  become: yes

  vars:
    cis_level_1_exclusions:
      - 1.1.11
      - 1.1.12
      - 1.1.13
      - 3.4.3
    cis_pass_max_days: 45
    cis_umask_default: 027
 
  roles:
    - ansible-role-cis-amazon-linux
    \n\n"
