#!/bin/bash
docker push dataduke/sample-node:qa

ssh deploy@$QA_IP << EOF
docker pull dataduke/sample-node:qa
docker stop web || true
docker rm web || true
docker rmi dataduke/sample-node:current || true
docker tag dataduke/sample-node:qa willrstern/sample-node:current
docker run -d --net app --restart always --name web -p 3000:3000 dataduke/sample-node:current
EOF
