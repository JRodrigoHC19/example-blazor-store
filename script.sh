#!bin/bash

# Variables
IMG_ID="img-blazor-store"
ID="app-blazor-store"

# GitHub
git clone https://github.com/MicrosoftDocs/mslearn-interact-with-data-blazor-web-apps.git BlazingPizza

# Steps
docker build -t $IMG_ID .
docker run -d --rm -p 8085:80 --name $ID $IMG_ID


# sleep 20
# docker stop $ID
# docker rmi $IMG_ID
