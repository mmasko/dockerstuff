FROM python:3.9.7-alpine3.14

RUN useradd ansible

RUN apk add --update --no-cache --virtual .fetch-deps \
        tar \
        xz \
        py3-cryptography \
        curl