#!/bin/sh

CNT_NAME=mysql-tmp
IMG_NAME=mysql
CONF_DIR=../../mysql/conf/

docker run -itd --name ${CNT_NAME} ${IMG_NAME} -e MYSQL_ALLOW_EMPTY_PASSWORD=yes

mkdir -p ${CONF_DIR}/etc/

docker cp  ${CNT_NAME}:/etc/mysql ${CONF_DIR}/etc/

docker stop ${CNT_NAME}
docker rm   ${CNT_NAME}

