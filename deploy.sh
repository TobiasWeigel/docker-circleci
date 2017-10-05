#!/bin/bash

# build image with your DockerHub repo as name from Dockerfile
docker build -t dataduke/sample-node .

# push your image to DockerHub
docker push dataduke/sample-node

# log into your machine as deploy user
ssh deploy@165.227.173.158 << EOF

# pull image from docker hub
docker pull dataduke/sample-node:latest

# stop container if running but always send back true (no exit)
docker stop web || true

# remove container afterwards but always send back true (no exit)
docker rm web || true

# remove image of your file tagged with current
docker rmi dataduke/sample-node:current || true

# tag the pulled latest image with tag current
docker tag dataduke/sample-node:latest dataduke/sample-node:current

# run image tagged with current in background with always restart flag and port 3000 mapped
docker run -d --restart always --name web -p 3000:3000 dataduke/sample-node:current

EOF
