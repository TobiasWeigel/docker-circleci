#!/bin/bash
docker build -t dataduke/test-db-migrations .
docker push dataduke/test-db-migrations

ssh deploy@165.227.173.158 << EOF
docker pull dataduke/test-db-migrations
docker run --net web --rm dataduke/test-db-migrations
docker rmi dataduke/sample-node
EOF
