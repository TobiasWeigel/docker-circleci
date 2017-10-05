#!/bin/bash

# build image with your DockerHub repo as name from Dockerfile

# push your image to DockerHub

# log into your machine as deploy user
ssh deploy@$VM_IP << EOF

# pull image from docker hub

# stop container if running but always send back true (no exit)

# remove container afterwards but always send back true (no exit)

# remove image of your file tagged with current

# tag the pulled latest image with tag current

# run image tagged with current in background with always restart flag and port 3000 mapped

EOF
