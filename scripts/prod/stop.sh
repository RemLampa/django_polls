#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker-compose -f $DIR/../../docker/docker-compose.prod.yml -p django_polls-prod down
