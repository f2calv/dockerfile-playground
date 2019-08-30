::docker build -t f2calvdev:latest -f ubuntu16.04-and-dotnetcore2.2/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu18.04-and-dotnetcore2.2/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu19.04-and-dotnetcore2.2/Dockerfile .

::docker build -t f2calvdev:latest -f ubuntu16.04-and-dotnetcore3.0-preview8/Dockerfile .
::docker build -t f2calvdev:latest -f ubuntu18.04-and-dotnetcore3.0-preview8/Dockerfile .
docker build -t f2calvdev:latest -f ubuntu19.04-and-dotnetcore3.0-preview8/Dockerfile .

docker run --name f2calvdev --rm -it f2calvdev:latest

::docker exec -it

pause