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

#install .net core 3.0 preview 8
RUN curl -SL -o dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/a0e368ac-7161-4bde-a139-1a3ef5a82bbe/439cdbb58950916d3718771c5d986c35/dotnet-sdk-3.0.100-preview8-013656-linux-x64.tar.gz
RUN sudo mkdir -p /usr/share/dotnet && sudo tar -zxf dotnet.tar.gz -C /usr/share/dotnet && sudo ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

#endregion - end customisations

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]