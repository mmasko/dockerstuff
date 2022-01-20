FROM redhat/ubi8:latest

# enable PowerShell repo
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo

RUN yum update -y
RUN yum install -y \
    curl \
    git \
    tar \
    jq \
    powershell \
    docker

RUN adduser runner
RUN mkdir /opt/actions-runner \
    && chown runner /opt/actions-runner

ADD entrypoint.sh /opt/actions-runner/entrypoint.sh
RUN chown runner /opt/actions-runner/entrypoint.sh

WORKDIR /opt/actions-runner

RUN curl -L "https://github.com/actions/runner/releases/download/v2.284.0/actions-runner-linux-x64-2.284.0.tar.gz" > actions.tar.gz \
    && tar xzf ./actions.tar.gz \
    && rm -f actions.tar.gz \
    && ./bin/installdependencies.sh

# USER runner

# Below: Future addition to run a script that will auto configure and run the actions runner.
# ENTRYPOINT [ "/home/runner/entrypoint.sh" ]