#!/bin/sh

CNT_NAME=php-tmp
IMG_NAME=local/php
CONF_DIR=../../php/conf/

docker run -itd --name ${CNT_NAME} ${IMG_NAME}

mkdir -p ${CONF_DIR}/usr/local ${CONF_DIR}/etc

docker cp  ${CNT_NAME}:/etc/apache2 ${CONF_DIR}/etc/
docker cp  ${CNT_NAME}:/usr/local/etc ${CONF_DIR}/usr/local/

docker stop ${CNT_NAME}
docker rm   ${CNT_NAME}

