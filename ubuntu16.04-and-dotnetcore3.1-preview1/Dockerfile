#This is a Dockerfile to install .NET Core 3.1 Preview 1 with the absolute minimum of additional components on an ubuntu base image.
#https://dotnet.microsoft.com/download/dotnet-core/3.1
#https://github.com/dotnet/core/blob/master/Documentation/linux-prereqs.md
#https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-3.1.100-preview1-linux-x64-binaries
FROM ubuntu:16.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
    && apt-get install --no-install-recommends \
    curl \
    software-properties-common \
    libicu55

RUN curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/a3cc3d8a-226d-4306-a61b-a5446fdb72ef/604e029047aec0229545e8c397a14ddb/dotnet-sdk-3.1.100-preview1-014459-linux-x64.tar.gz
RUN mkdir -p /usr/share/dotnet \
    && tar -zxf /tmp/dotnet.tar.gz -C /usr/share/dotnet \
    && rm /tmp/dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

RUN dotnet tool install -g dotnet-reportgenerator-globaltool
# Add .NET Core SDK tools
#RUN export PATH="$PATH:/root/.dotnet/tools"
ENV PATH="${PATH}:/root/.dotnet/tools"

ENTRYPOINT ["/bin/bash"]