#https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#linux
FROM ubuntu:16.04

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl3 \
        libicu55 \
        libunwind8 \
        netcat \
        software-properties-common \
        sudo

#region - start customisations

#install .NET Core 3.0
RUN curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/886b4a4c-30af-454b-8bec-81c72b7b4e1f/d1a0c8de9abb36d8535363ede4a15de6/dotnet-sdk-3.0.100-linux-x64.tar.gz
RUN mkdir -p /usr/share/dotnet \
        && tar -zxf /tmp/dotnet.tar.gz -C /usr/share/dotnet \
        && rm /tmp/dotnet.tar.gz \
        && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

# Add .NET Core SDK tools
RUN export PATH="$PATH:/root/.dotnet/tools"

#endregion - end customisations

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]