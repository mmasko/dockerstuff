FROM alpine:latest

ARG TESTVAR

RUN echo ${TESTVAR}