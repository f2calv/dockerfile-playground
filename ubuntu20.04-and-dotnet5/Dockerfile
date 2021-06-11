#This is a Dockerfile to install .NET 5.0 with the absolute minimum of additional components on an ubuntu base image.
FROM ubuntu:20.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

#https://docs.microsoft.com/en-us/dotnet/core/install/linux
RUN apt-get update \
    && apt-get install \
        apt-transport-https \
        curl

#https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#1804-
RUN curl -SL -o packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y dotnet-sdk-5.0 \
    && rm packages-microsoft-prod.deb \
    && dotnet --list-sdks

ENTRYPOINT ["/bin/bash"]