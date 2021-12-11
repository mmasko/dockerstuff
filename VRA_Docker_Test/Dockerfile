FROM redhat/ubi8:latest
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansibleoss/.local/bin:/home/ansibleoss/.local/lib/python3.6/site-packages"

RUN yum update -y
# RUN mkdir /var/run/sshd
RUN yum -y install openssh-server ed openssh-clients ed python3 ed python3-pip && yum clean all \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd \
  && sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config \
  && /usr/bin/ssh-keygen -A \
  && ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_key

RUN adduser ansibleoss && echo "ansibleoss:ansibleoss" | chpasswd

USER ansibleoss

RUN python3 -m pip install --user --upgrade --force-reinstall pip
RUN python3 -m pip install setuptools_rust wheel --user --upgrade
RUN pip3 install ansible==2.9.7 --user --upgrade
COPY ansiblesetup.yml /home/ansibleoss/ansible/ansiblesetup.yml
RUN ansible-playbook /home/ansibleoss/ansible/ansiblesetup.yml -vvvv
USER root
# lsof is installed for testing purposes. Not to be included in prod
RUN yum install lsof -y
CMD ["/usr/sbin/sshd","-D"]