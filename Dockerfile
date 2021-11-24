FROM python:3.9.7-alpine3.14
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ansible/.local/bin:/home/ansible/.local/lib/python3.9/site-packages"
RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        py3-cryptography \
        curl
RUN adduser ansible -D
USER ansible

