FROM amazonlinux:latest
ENV ANSIBLE_VERSION=2.9.4
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansible/.local/bin/"
RUN yum update -y && \
amazon-linux-extras enable python3.8 ansible2

RUN yum install -y git python38 ansible python3-pip && \
yum clean metadata

RUN adduser ansible
USER ansible

RUN pip3 install --upgrade --user pip
RUN pip3 install --upgrade --user ansible==${ANSIBLE_VERSION}
RUN pip3 install --upgrade --user ansible-lint
RUN pip3 install --upgrade --user pywinrm
RUN pip3 install --upgrade --user pyvmomi

ADD playbook.yml /home/ec2-user/playbook.yml

CMD ansible-playbook /home/ec2-user/playbook.yml