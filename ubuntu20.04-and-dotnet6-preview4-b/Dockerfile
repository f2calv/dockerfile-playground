#This is a Dockerfile to install .NET 6.0 Preview 4 with the absolute minimum of additional components on an ubuntu base image.
FROM ubuntu:20.04

# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

#https://github.com/dotnet/core/blob/master/Documentation/linux-prereqs.md
RUN apt-get update \
    && apt-get install --no-install-recommends \
        curl \
        software-properties-common \
        openssl1.1

#.NET install
#https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
RUN curl -sL -o /usr/bin/dotnet-install.sh https://dot.net/v1/dotnet-install.sh \
    && chmod +x /usr/bin/dotnet-install.sh \
    && dotnet-install.sh -c 6.0 -v latest --install-dir /usr/share/dotnet/ \
    && rm /usr/bin/dotnet-install.sh \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && dotnet --list-sdks

ENTRYPOINT ["/bin/bash"]