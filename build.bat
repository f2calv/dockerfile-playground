::docker build -t f2calvdev:latest -f ubuntu16.04-and-dotnetcore2.2/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu18.04-and-dotnetcore2.2/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu19.04-and-dotnetcore2.2/Dockerfile .

::docker build -t f2calvdev:latest -f ubuntu16.04-and-dotnetcore3.0-preview8/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu18.04-and-dotnetcore3.0-preview8/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu19.04-and-dotnetcore3.0-preview8/Dockerfile .

::docker build -t f2calvdev:latest -f ubuntu16.04-and-dotnetcore3.0-preview9/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu18.04-and-dotnetcore3.0-preview9/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu19.04-and-dotnetcore3.0-preview9/Dockerfile .

::docker build -t f2calvdev:latest -f ubuntu16.04-and-dotnetcore3.1-preview1/Dockerfile .

::cd azdo-linux-agent
::docker build -t f2calvdev:latest .

::cd azdo-linux-agent-dotnetcore3.0-preview8
::docker build -t f2calvdev:latest .

::cd azdo-linux-agent-dotnetcore3.0-preview9
::docker build -t f2calvdev:latest .

::docker build -t f2calvdev:latest -f ubuntu16.04-and-dotnetcore3.1-preview1/Dockerfile .

docker build -t f2calvdev:latest -f ubuntu16.04-and-dotnetcore3.1/Dockerfile .


docker run --name f2calvdev --rm -it -v /var/run/docker.sock:/var/run/docker.sock f2calvdev:latest

::dive f2calvdev:latest
::docker image rm f2calvdev:latest

::docker exec -it

pause