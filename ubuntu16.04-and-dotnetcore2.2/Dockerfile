#This is a Dockerfile to install .net core 2.2 with the absolute minimum of additional components.
#https://dotnet.microsoft.com/download/linux-package-manager/ubuntu16-04/sdk-2.2.401
FROM ubuntu:16.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
        apt-transport-https \
        software-properties-common

RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
RUN dpkg -i /tmp/packages-microsoft-prod.deb
RUN apt-get update
#these variables don't work, but still interesting!
#ENV DOTNET_SKIP_FIRST_TIME_EXPERIENCE 1
#RUN setx /M DOTNET_SKIP_FIRST_TIME_EXPERIENCE 1
RUN apt-get install dotnet-sdk-2.2

ENTRYPOINT ["/bin/bash"]