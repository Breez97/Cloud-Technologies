#!/bin/bash

CONTAINER_NAME="app_postgresql_redis_web"
CONTAINER_ID=$(docker ps -qf "name=${CONTAINER_NAME}")

if [ -z "$CONTAINER_ID" ]; then
  exit 1
fi

docker exec -it "$CONTAINER_ID" flask db init
docker exec -it "$CONTAINER_ID" flask db migrate -m "Initial migration"
docker exec -it "$CONTAINER_ID" flask db upgrade
