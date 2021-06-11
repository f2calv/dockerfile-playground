# Dockerfile Playground

Different Dockerfiles with different installation scenarios of the .NET SDK.

Various examples include;

- installing .NET Core X.X via packages.
- installing .NET Core X.X binaries.
- installing .NET X.X binaries.
- installing .NET X.X using .

Most recent addition for .NET 6.0;

```pwsh
#build Ubuntu 20.04 w/.NET 6.0 SDK Preview 4

#installing the binary into a ubuntu20.04 base image, with manually added dependencies
docker build -t dotnet6a -f .\ubuntu20.04-and-dotnet6-preview4-a\Dockerfile .

#installing using the official dotnet-install-script for CI scenarios, with manually added dependencies
docker build -t dotnet6a -f .\ubuntu20.04-and-dotnet6-preview4-b\Dockerfile .

#installing using the official dotnet-install-script for CI scenarios, with manually added dependencies
docker build -t dotnet6a -f .\ubuntu20.04-and-dotnet6-preview4-b\Dockerfile .

#launch one of the images as a container
docker run --rm -it --name testa dotnet6a
#docker run --rm -it --name testb dotnet6b
#docker run --rm -it --name testb dotnet6c

#list installed SDKs
dotnet --list-sdks

#output should look similar to;
# root@2a83fee5ad06:/# dotnet --list-sdks
# 6.0.100-preview.4.21255.9 [/usr/share/dotnet/sdk]
```
