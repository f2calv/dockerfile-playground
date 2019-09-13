#try install and run docker in docker
#https://docs.docker.com/install/linux/docker-ce/ubuntu/
FROM ubuntu:16.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common


#setup the repository
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo apt-key fingerprint 0EBFCD88
RUN sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
#install latest version
RUN sudo apt-get update \
    && apt-get install docker-ce docker-ce-cli containerd.io

ENTRYPOINT ["/bin/bash"]