FROM amazonlinux:latest

RUN yum update -y && \
amazon-linux-extras enable python3.8 ansible2

RUN yum install -y git python38 ansible && \
yum clean metadata

# RUN useradd ansible && \
# ssh-keygen -A
RUN git clone https://github.com/mmasko/dockerstuff.git && \
ansible-playbook dockerstuff/ansiblesetup.yml -v
RUN rm /dockerstuff -R && \
git clone https://github.com/mmasko/dockerstuff.git
ENTRYPOINT ["/bin/bash", "/dockerstuff/entrypoint.sh"]
# CMD ["echo", "Hello from CMD"]