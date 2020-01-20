FROM python:3.8.1-alpine

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1 \
  PYTHONPATH=/app \
  DJANGO_SETTINGS_MODULE=config.settings.production \
  PORT=8000 \
  WEB_CONCURRENCY=3 \
  PYTHONUNBUFFERED 1 \
  DEBUG 0

COPY . .

RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && find /usr/local \
        \( -type d -a -name test -o -name tests \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' + \
    && runDeps="$( \
        scanelf --needed --nobanner --recursive /usr/local \
                | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
                | sort -u \
                | xargs -r apk info --installed \
                | sort -u \
    )" \
    && apk add --virtual .rundeps $runDeps \
    && apk del .build-deps


RUN adduser -D myuser
USER myuser

ENTRYPOINT ["/app/docker/entrypoint.dev.sh"]
