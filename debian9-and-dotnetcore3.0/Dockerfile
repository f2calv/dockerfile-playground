#This is a Dockerfile to install .NET Core 3.0 Preview 9 with the absolute minimum of additional components on a debian base image.
#https://dotnet.microsoft.com/download/dotnet-core/3.0
#https://github.com/dotnet/core/blob/master/Documentation/linux-prereqs.md
#https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-3.0.100-preview9-linux-x64-binaries
#https://andrewlock.net/exploring-the-net-core-mcr-docker-files-runtime-vs-aspnet-vs-sdk/
FROM buildpack-deps:stretch-scm

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
    && apt-get install --no-install-recommends \
    curl \
    software-properties-common \
    # Install .NET CLI dependencies
    \
    libicu57 \
    libssl1.0.2 \
    && rm -rf /var/lib/apt/lists/*

# Install .NET Core SDK
ENV DOTNET_SDK_VERSION 3.0.100

RUN curl -SL -o /tmp/dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/release/3.0.1xx/dotnet-sdk-latest-linux-x64.tar.gz
RUN mkdir -p /usr/share/dotnet \
    && tar -zxf /tmp/dotnet.tar.gz -C /usr/share/dotnet \
    && rm /tmp/dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 \
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps performance
    NUGET_XMLDOC_MODE=skip \
    # Add .NET Core SDK tools
    PATH="${PATH}:/root/.dotnet/tools"

#add extra tools - see https://github.com/natemcmaster/dotnet-tools
RUN dotnet tool install -g dotnet-reportgenerator-globaltool \
    && dotnet tool install -g coverlet.console \
    && dotnet tool install -g GitVersion.Tool

# Trigger first run experience by running arbitrary cmd to populate local package cache
RUN dotnet help

ENTRYPOINT ["/bin/bash"]