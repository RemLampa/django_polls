#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker-compose -f $DIR/../../docker/docker-compose.dev.yml -p django_polls-dev down
