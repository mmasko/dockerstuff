FROM alpine:latest AS builder
ENV ANSIBLE_VERSION=2.9
ENV PATH="/root/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansible/.local/bin"

FROM builder AS build1
RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        python3 \
        py3-boto3 \
        py-boto \
        py-botocore \
        py3-cryptography \
        curl

FROM build1 AS build2
RUN apk add --update --virtual .build-deps \
        python3-dev \
        libffi-dev \
        py3-pip \
        gcc \
        py3-cffi \
        openssl-dev \
        build-base \
        py3-wheel

FROM build2
# RUN mkdir -p /etc/ansible \
#  && echo 'localhost' > /etc/ansible/hosts

# RUN adduser ansible -D
# USER ansible
# RUN pip install --upgrade --user \
#         ansible==${ANSIBLE_VERSION} \
#         ansible-lint \
#         pywinrm \
#         pyvmomi

# ADD entrypoint.sh /

USER root
RUN echo "Removing .build-deps" \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

# USER ansible
# CMD ansible -m debug -a var=ansible_host localhost
# #ENTRYPOINT [ "ansible", "/entrypoint.sh" ]