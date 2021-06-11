#This is a Dockerfile to install .NET 6.0 Preview 4 with the absolute minimum of additional components on an ubuntu base image.
FROM ubuntu:20.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

#https://docs.microsoft.com/en-us/dotnet/core/install/linux
RUN apt-get update \
    && apt-get install --no-install-recommends \
        curl \
        software-properties-common

#.NET install
#https://github.com/dotnet/core/blob/main/release-notes/6.0/preview/6.0.0-preview.4-install-instructions.md
RUN mkdir $HOME/dotnet_install && cd $HOME/dotnet_install \
    && curl -L https://aka.ms/install-dotnet-preview -o install-dotnet-preview.sh \
    && chmod +x $HOME/dotnet_install/install-dotnet-preview.sh \
    && $HOME/dotnet_install/install-dotnet-preview.sh \
    && rm $HOME/dotnet_install/install-dotnet-preview.sh \
    && dotnet --list-sdks

ENTRYPOINT ["/bin/bash"]