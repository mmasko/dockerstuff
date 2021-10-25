FROM amazonlinux:latest

RUN yum update -y && \
amazon-linux-extras enable python3.8 ansible2

RUN yum install -y git python38 ansible && \
yum clean metadata

ADD playbook.yml /home/ec2-user/playbook.yml

CMD ansible-playbook /home/ec2-user/playbook.yml