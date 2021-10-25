FROM alpine:latest AS builder

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

RUN mkdir -p /etc/ansible \
 && echo 'localhost' > /etc/ansible/hosts

RUN adduser ansible -D
USER ansible
RUN pip install --upgrade --user \
        pip \
        ansible==${ANSIBLE_VERSION} \
        ansible-lint \
        pywinrm \
        pyvmomi

RUN pip install --upgrade -t /home/ansible/project pip
RUN pip install --upgrade -t /home/ansible/project ansible==${ANSIBLE_VERSION}
RUN pip install --upgrade -t /home/ansible/project ansible-lint
RUN pip install --upgrade -t /home/ansible/project pywinrm
RUN pip install --upgrade -t /home/ansible/project pyvmomi

USER root
RUN echo "Removing .build-deps" \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

FROM alpine:latest
# ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansible/.local/bin"
COPY --from=builder /home/ansible/.local/ /home/ansible/.local/
COPY --from=builder /home/ansible/project /home/ansible/project
RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        python3 \
        py3-boto3 \
        py-boto \
        py-botocore \
        py3-cryptography \
        curl