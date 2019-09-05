#This is a Dockerfile to install .NET Core 3.0 Preview 9 with the absolute minimum of additional components on an ubuntu base image.
#https://dotnet.microsoft.com/download/dotnet-core/3.0
#https://github.com/dotnet/core/blob/master/Documentation/linux-prereqs.md
#https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-3.0.100-preview9-linux-x64-binaries
FROM ubuntu:18.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
    && apt-get install --no-install-recommends \
        curl \
        software-properties-common \
        sudo \
        libicu60 \
        openssl1.0

RUN curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/498b8b41-7626-435e-bea8-878c39ccbbf3/c8df08e881d1bcf9a49a9ff5367090cc/dotnet-sdk-3.0.100-preview9-014004-linux-x64.tar.gz
RUN sudo mkdir -p /usr/share/dotnet && sudo tar -zxf /tmp/dotnet.tar.gz -C /usr/share/dotnet && sudo ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

ENTRYPOINT ["/bin/bash"]