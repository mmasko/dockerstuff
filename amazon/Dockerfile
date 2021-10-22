FROM amazonlinux:latest

RUN yum update -y && \
amazon-linux-extras enable python3.8 ansible2

RUN yum install -y git python38 ansible openssh-server && \
yum clean metadata

RUN useradd ansible && \
ssh-keygen -A
RUN git clone https://github.com/mmasko/dockerstuff.git && \
ansible-playbook dockerstuff/ansiblesetup.yml -vvvv