#This is a Dockerfile to install .NET 6.0 Preview 4 with the absolute minimum of additional components on an ubuntu base image.
FROM ubuntu:20.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

#https://docs.microsoft.com/en-us/dotnet/core/install/linux
RUN apt-get update \
    && apt-get install --no-install-recommends \
        curl \
        software-properties-common \
        openssl1.1

#https://dotnet.microsoft.com/download/dotnet/6.0
RUN curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/f5c00d7a-e1c8-494a-a88b-9ed1dc62249e/8438122af4fd928900a0ebf129c6c1d6/dotnet-sdk-6.0.100-preview.4.21255.9-linux-x64.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf /tmp/dotnet.tar.gz -C /usr/share/dotnet \
    && rm /tmp/dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && dotnet --list-sdks

ENTRYPOINT ["/bin/bash"]