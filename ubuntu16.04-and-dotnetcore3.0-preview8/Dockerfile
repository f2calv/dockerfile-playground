#This is a Dockerfile to install .net core 3.0 with the absolute minimum of additional components.
#https://dotnet.microsoft.com/download/dotnet-core/3.0
#https://github.com/dotnet/core/blob/master/Documentation/linux-prereqs.md
#https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-3.0.100-preview8-linux-x64-binaries
FROM ubuntu:16.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
    && apt-get install --no-install-recommends \
        wget \
        apt-transport-https \
        software-properties-common \
        libicu55

RUN wget -q https://download.visualstudio.microsoft.com/download/pr/a0e368ac-7161-4bde-a139-1a3ef5a82bbe/439cdbb58950916d3718771c5d986c35/dotnet-sdk-3.0.100-preview8-013656-linux-x64.tar.gz -O /tmp/dotnet-sdk-3.0.100-preview8-013656-linux-x64.tar.gz
RUN mkdir -p $HOME/dotnet && tar zxf /tmp/dotnet-sdk-3.0.100-preview8-013656-linux-x64.tar.gz -C $HOME/dotnet
RUN export DOTNET_ROOT=$HOME/dotnet
RUN export PATH=$PATH:$HOME/dotnet

#how to set-up the path correctly, currently have to run '$HOME/dotnet/dotnet'
#RUN source ~/.bashrc
#RUN dotnet --version

ENTRYPOINT ["/bin/bash"]