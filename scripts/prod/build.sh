#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker build -f $DIR/../../docker/prod.Dockerfile -t django_polls:prod .
