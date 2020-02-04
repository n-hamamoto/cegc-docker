#!/bin/sh

CONFDIR=./sampleconf
DSTDIR=../../proxy/conf

cp -r ${CONFDIR}/vhost ${DSTDIR}/etc/httpd/conf.d

mv    ${DSTDIR}/etc/httpd/conf/httpd.conf ${DSTDIR}/etc/httpd/conf/httpd.conf.dist
mv    ${DSTDIR}/etc/httpd/conf.d/ssl.conf ${DSTDIR}/etc/httpd/conf.d/ssl.conf.dist

cp    ${CONFDIR}/httpd.conf ${DSTDIR}/etc/httpd/conf/
cp    ${CONFDIR}/ssl.conf   ${DSTDIR}/etc/httpd/conf.d/
cp    ${CONFDIR}/shib.conf  ${DSTDIR}/etc/httpd/conf.d/
cp    ${CONFDIR}/proxy.conf ${DSTDIR}/etc/httpd/conf.d/

mv    ${DSTDIR}/etc/shibboleth/shibboleth2.xml   ${DSTDIR}/etc/shibboleth/shibboleth2.xml.dist
mv    ${DSTDIR}/etc/shibboleth/native.logger     ${DSTDIR}/etc/shibboleth/native.logger.dist
mv    ${DSTDIR}/etc/shibboleth/shibd.logger      ${DSTDIR}/etc/shibboleth/shibd.logger.dist
mv    ${DSTDIR}/etc/shibboleth/attribute-map.xml ${DSTDIR}/etc/shibboleth/attribute-map.xml.dist

cp    ${CONFDIR}/shibboleth/shibboleth2.xml    ${DSTDIR}/etc/shibboleth/
cp    ${CONFDIR}/shibboleth/native.logger      ${DSTDIR}/etc/shibboleth/
cp    ${CONFDIR}/shibboleth/shibd.logger       ${DSTDIR}/etc/shibboleth/
cp    ${CONFDIR}/shibboleth/attribute-map.xml  ${DSTDIR}/etc/shibboleth/
cp -r ${CONFDIR}/shibboleth/cert               ${DSTDIR}/etc/shibboleth/
cp -r ${CONFDIR}/shibboleth/metadata           ${DSTDIR}/etc/shibboleth/

cp -r ${CONFDIR}/ssl ${DSTDIR}/etc/pki
cp -r ${CONFDIR}/vhost  ${DSTDIR}/etc/httpd/conf.d/

cp -r ${CONFDIR}/fix-attrs.d  ${DSTDIR}/etc/
cp -r ${CONFDIR}/services.d   ${DSTDIR}/etc/

