FROM python:3.9.7-alpine3.14 AS builder

ENV ANSIBLE_VERSION=2.9.4
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansible/.local/bin"
RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        python3 \
        py3-cryptography \
        curl

RUN apk add --update --virtual .build-deps \
        python3-dev \
        libffi-dev \
        py3-pip \
        gcc \
        py3-cffi \
        openssl-dev \
        build-base \
        py3-wheel

RUN adduser ansible -D
USER ansible
RUN pip install --upgrade --user \
        pip \
        ansible==${ANSIBLE_VERSION} \
        ansible-lint \
        pywinrm \
        pyvmomi
USER ansible
# RUN pip install --upgrade -t /home/ansible/project ansible==${ANSIBLE_VERSION}
# RUN pip install --upgrade -t /home/ansible/project ansible-lint
# RUN pip install --upgrade -t /home/ansible/project pywinrm
# RUN pip install --upgrade -t /home/ansible/project pyvmomi
# RUN pip install --upgrade -t /home/ansible/project botocore
# RUN pip install --upgrade -t /home/ansible/project boto
# RUN pip install --upgrade -t /home/ansible/project boto3

# USER root

# FROM python:3.9.7-alpine3.14

# RUN apk add --update --no-cache --virtual .fetch-deps \
#         tar \
#         xz \
#         py3-cryptography \
#         curl

# COPY --from=builder /home/ansible/.local/bin /home/ansible/.local/bin
# # COPY --from=builder /home/ansible/.local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
# ADD playbook.yml /home/ansible/playbook.yml
# ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansible/.local/bin:/home/ansible/.local/:/usr/local/lib/python3.9/site-packages"
# # WORKDIR /home/ansible
# CMD ansible-playbook /home/ansible/playbook.yml -vvvv