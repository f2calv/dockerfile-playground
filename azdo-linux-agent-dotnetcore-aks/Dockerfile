#customised image for a self-hosted AzDO build agent tailored to build .NET Core applications and deploy to ACR/AKS w/Helm charts.
#all versions -> latest
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
        sudo \
        apt-transport-https \
        gnupg-agent \
		unzip \
		lsb-release \
		gnupg

#region - start customisations

#install helm
#https://helm.sh/docs/using_helm/#installing-helm
#https://www.digitalocean.com/community/tutorials/how-to-install-software-on-kubernetes-clusters-with-the-helm-package-manager
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > /tmp/install-helm.sh
RUN sudo chmod u+x /tmp/install-helm.sh
RUN sudo /tmp/install-helm.sh

#install kubectl
#https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN sudo apt-get update \
    && sudo apt-get install kubectl

#install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo apt-key fingerprint 0EBFCD88
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN sudo apt-get update \
    && sudo apt-get install docker-ce docker-ce-cli containerd.io

#install az cli
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list
RUN sudo apt-get update \
	&& sudo apt-get install azure-cli nuget

#install .net core sdk
ENV DOTNET_SDK_VERSION 3.0.100-preview9-014004
RUN curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/498b8b41-7626-435e-bea8-878c39ccbbf3/c8df08e881d1bcf9a49a9ff5367090cc/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz
RUN sudo mkdir -p /usr/share/dotnet \
	&& sudo tar -zxf /tmp/dotnet.tar.gz -C /usr/share/dotnet \
    && sudo rm /tmp/dotnet.tar.gz \
    && sudo ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

#set .net core env variables
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
    && dotnet tool install -g GitVersion.Tool \
	&& dotnet tool install -g dotnet-sonarscanner

# Trigger first run experience by running arbitrary cmd to populate local package cache
RUN dotnet help

##populate all relevant nugets - disabled because on my own agents these packages now get cached after the first run
#WORKDIR /src
#COPY . .
#RUN for f in /src/*/*.csproj; do dotnet restore $f --packages /src/packages --configfile /src/NuGet.config; done
#RUN mv /src/packages/ /tmp/packages/; rm -rf /src/*; mv /tmp/packages/ /src/packages/

#endregion - end customisations

WORKDIR /azp

#COPY ./start.sh .
COPY AzurePipelines/CASBuildAgent/start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]