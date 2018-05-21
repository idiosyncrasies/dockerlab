#!/bin/sh

docker-compose -f applications/docker-compose.yml down
docker-compose -f monitoring/docker-compose.yml down
