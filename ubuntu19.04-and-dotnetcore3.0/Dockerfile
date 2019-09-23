#This is a Dockerfile to install .NET Core 3.0 Preview 9 with the absolute minimum of additional components on an ubuntu base image.
#https://dotnet.microsoft.com/download/dotnet-core/3.0
#https://github.com/dotnet/core/blob/master/Documentation/linux-prereqs.md
#https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-3.0.100-preview9-linux-x64-binaries
FROM ubuntu:19.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
    && apt-get install --no-install-recommends \
    curl \
    software-properties-common \
    libicu63 \
    openssl1.1

RUN curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/886b4a4c-30af-454b-8bec-81c72b7b4e1f/d1a0c8de9abb36d8535363ede4a15de6/dotnet-sdk-3.0.100-linux-x64.tar.gz
RUN mkdir -p /usr/share/dotnet \
    && tar -zxf /tmp/dotnet.tar.gz -C /usr/share/dotnet \
    && rm /tmp/dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

ENTRYPOINT ["/bin/bash"]