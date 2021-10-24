FROM alpine:latest
ENV ANSIBLE_VERSION=2.9
ENV PATH="/root/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        python3 \
        py3-pip \
        py3-boto3 \
        py-boto \
        py-botocore \
        py3-cryptography \
        curl

RUN apk add --update --virtual .build-deps \
        python3-dev \
        libffi-dev \
        gcc \
        py3-cffi \
        openssl-dev \
        build-base \
        py3-wheel

#RUN adduser ansible -D
RUN pip install --upgrade --user \
        pip \
        ansible==${ANSIBLE_VERSION} \
        ansible-lint \
        pywinrm \
        pyvmomi

RUN echo "Removing .build-deps" \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /etc/ansible \
 && echo 'localhost' > /etc/ansible/hosts

ARG GIT_CREDENTIAL
ADD entrypoint.sh /

#ENTRYPOINT [ "sh", "/entrypoint.sh" ]