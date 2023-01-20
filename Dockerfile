FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
WORKDIR /tmp
RUN apt update && \
        apt install -y wget gnupg git && \
        wget https://github.com/coredns/coredns/releases/download/v1.10.0/coredns_1.10.0_linux_amd64.tgz && \
        tar -xvf coredns_1.10.0_linux_amd64.tgz && \
        mkdir /tmp/zone && \
        apt remove wget git -y && \
        apt autoremove -y && \
        rm -rf coredns_1.10.0_linux_amd64.tgz
EXPOSE 53

CMD ./coredns -conf Corefile
