#!/bin/bash

IMAGE="`curl https://raw.githubusercontent.com/Mailu/Mailu/master/core/postfix/Dockerfile| grep DISTRO= |cut -d= -f2`"

mkdir -p wheels

docker run --rm -v $PWD/wheels:/wheels -it "$IMAGE" sh -c "cd /wheels && wget -O /tmp/requirements.txt https://raw.githubusercontent.com/Mailu/Mailu/master/core/admin/requirements-prod.txt && echo postfix-mta-sts-resolver==1.0.1 >> /tmp/requirements.txt && apk add python3 py3-pip git bash py3-multidict py3-yarl tzdata gcc musl-dev python3-dev py3-wheel libffi-dev build-base postgresql-dev mariadb-connector-c-dev cargo && pip install --upgrade pip && pip3 wheel -r /tmp/requirements.txt"
