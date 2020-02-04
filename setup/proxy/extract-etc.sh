#!/bin/sh

CNT_NAME=proxy-tmp
IMG_NAME=local/shibboleth
CONF_DIR=../../proxy/conf/

docker run -itd --name ${CNT_NAME} ${IMG_NAME}

mkdir -p ${CONF_DIR}/etc/pki ${CONF_DIR}/etc/httpd

docker cp  ${CNT_NAME}:/etc/httpd/conf ${CONF_DIR}/etc/httpd/conf
docker cp  ${CNT_NAME}:/etc/httpd/conf.d ${CONF_DIR}/etc/httpd/conf.d
docker cp  ${CNT_NAME}:/etc/httpd/conf.modules.d ${CONF_DIR}/etc/httpd/conf.modules.d

docker cp  ${CNT_NAME}:/etc/shibboleth ${CONF_DIR}/etc/shibboleth

docker stop ${CNT_NAME}
docker rm   ${CNT_NAME}
