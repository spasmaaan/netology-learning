#!/bin/bash

git clone https://github.com/spasmaaan/shvirtd-example-python.git

SHVIRTD_FOLDER=shvirtd-example-python
APP_PATH=/opt/${SHVIRTD_FOLDER}

sudo mv $SHVIRTD_FOLDER $APP_PATH

cd $APP_PATH
docker compose up -d
