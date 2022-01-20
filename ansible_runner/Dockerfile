FROM redhat/ubi8:latest

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansible/.local/bin:/home/ansible/.local/lib/python3.6/site-packages"

RUN yum -y install python3-pip && yum clean all
RUN adduser ansible && echo "ansible:ansible" | chpasswd

USER ansible

RUN python3 -m pip install --user --upgrade --force-reinstall pip \
    && python3 -m pip install setuptools_rust wheel --user --upgrade \
    && pip3 install ansible==2.9.7 --user --upgrade

COPY test.yml /home/ansible

WORKDIR /home/ansible
# CMD ["ansible-playbook", "test.yml"]
CMD ["sh", "-c", "ansible-playbook ${role}/tests/test.yml --extra-vars usecase=${usecase}"]
# CMD [ "sh", "-c", "echo ${arg}" ]