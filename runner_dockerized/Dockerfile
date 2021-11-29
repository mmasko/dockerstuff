FROM redhat/ubi8:latest AS preprunner
COPY . token.sh entrypoint.sh /

RUN yum update -y
RUN yum install curl git tar -y
RUN adduser runner
RUN mkdir /opt/actions-runner && \
    chown runner /opt/actions-runner

WORKDIR /opt/actions-runner

RUN curl -L "https://github.com/actions/runner/releases/download/v2.284.0/actions-runner-linux-x64-2.284.0.tar.gz" > actions.tar.gz && \
    tar xzf ./actions.tar.gz && \
    rm -f actions.tar.gz
RUN ./bin/installdependencies.sh
USER runner

FROM preprunner

RUN echo "hi"