#!/bin/bash
set -e

docker ps -a --filter "name=ch-open-workshop_kafka" -q | grep -q . && docker rm -f ch-open-workshop_kafka
docker ps -a --filter "name=ch-open-workshop_kafdrop" -q | grep -q . && docker rm -f ch-open-workshop_kafdrop
docker ps -a --filter "name=ch-open-workshop_schema-registry" -q | grep -q . && docker rm -f ch-open-workshop_schema-registry
