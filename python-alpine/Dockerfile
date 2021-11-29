FROM python:3.9.7-alpine3.14 AS builder

ENV ANSIBLE_VERSION=2.9.7
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/lib/python3.9/site-packages"
RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        py3-cryptography \
        curl \
        python3-dev \
        libffi-dev \
        py3-pip \
        gcc \
        py3-cffi \
        openssl-dev \
        build-base \
        py3-wheel

RUN pip install --upgrade \
        pip \
        ansible==${ANSIBLE_VERSION} \
        ansible-lint \
        pywinrm \
        pyvmomi

FROM python:3.9.7-alpine3.14
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/lib/python3.9/site-packages"
RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        curl \
        git \
        docker

COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

ADD playbook.yml .