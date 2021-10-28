FROM alpine:latest
ENV ANSIBLE_VERSION=2.9.4
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansible/.local/bin"

RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        python3 \
        py3-boto3 \
        py-boto \
        py-botocore \
        py3-cryptography \
        py3-pip \
        curl

RUN apk add --update --virtual .build-deps \
        python3-dev \
        libffi-dev \
        gcc \
        py3-cffi \
        openssl-dev \
        build-base \
        py3-wheel

RUN adduser ansible -D
USER ansible
RUN pip install --upgrade --user \
        ansible==${ANSIBLE_VERSION} \
        ansible-lint \
        pywinrm \
        pyvmomi

USER root
RUN apk add --update util-linux
RUN echo "Removing .build-deps" \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*