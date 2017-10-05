#!/bin/bash
docker build -t dataduke/sample-node .
docker push dataduke/sample-node

ssh deploy@165.227.173.158 << EOF
docker pull dataduke/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi dataduke/sample-node:current || true
docker tag dataduke/sample-node:latest dataduke/sample-node:current
docker run -d --restart always --name web -p 3000:3000 dataduke/sample-node:current
EOF
