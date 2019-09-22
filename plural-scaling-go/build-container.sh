#!/bin/bash

docker build -f ./Dockerfile-web -t woodenshoe/plural-scale-web .

docker build -f ./Dockerfile-dataservice -t woodenshoe/plural-scale-data .

#docker run --rm woodenshoe/plural-web
#docker run -p 8000:8000 -it woodenshoe/plural-web sh
