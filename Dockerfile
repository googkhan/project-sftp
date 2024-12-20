FROM debian:bookworm

RUN apt-get update -y && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY conf/sshd_config /etc/ssh/sshd_config
COPY conf/create-sftp-user /usr/local/bin/
COPY conf/entrypoint /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
