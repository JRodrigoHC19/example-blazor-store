#!bin/bash

# Variables
IMG_ID="img-blazor-store"
ID="app-blazor-store"

# GitHub
git clone https://github.com/JRodrigoHC19/example-blazor-store.git
cd example-blazor-store
git clone https://github.com/MicrosoftDocs/mslearn-interact-with-data-blazor-web-apps.git BlazingPizza

# Steps
docker build -t $IMG_ID .
docker run -d --rm -p 8085:8080 --name $ID $IMG_ID


# sleep 20
# docker stop $ID
# docker rmi $IMG_ID
