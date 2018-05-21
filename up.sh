#!/bin/sh

docker-compose -f monitoring/docker-compose.yml up -d
docker-compose -f applications/docker-compose.yml up -d
