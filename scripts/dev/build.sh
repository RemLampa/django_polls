#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker build -f $DIR/../../docker/dev.Dockerfile -t django_polls:dev .
