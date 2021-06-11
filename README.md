# Dockerfile Playground

Different Dockerfiles with different installation scenarios of the .NET SDK.

Examples include;

- installing .NET Core X.X via packages.
- installing .NET Core X.X binaries.
- installing .NET X.X binaries.
- installing .NET X.X using .

```pwsh
#build Ubuntu 20.04 w/.NET 6.0 SDK Preview 4
docker build -t dotnetimage -f .\ubuntu20.04-and-dotnet6-preview4-b\Dockerfile .

#launch the container
docker run --rm -it --name testcontainer dotnetimage

#list installed SDKs
dotnet --list-sdks

#output should look similar to;
# root@2a83fee5ad06:/# dotnet --list-sdks
# 6.0.100-preview.4.21255.9 [/usr/share/dotnet/sdk]
```
