#!/bin/sh
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker-compose -f $DIR/../../docker/docker-compose.prod.yml -p django_polls-prod exec django_polls python manage.py makemigrations

docker-compose -f $DIR/../../docker/docker-compose.prod.yml -p django_polls-prod exec django_polls python manage.py migrate --noinput
