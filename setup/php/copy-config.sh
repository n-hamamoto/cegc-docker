#!/bin/sh

CONFDIR=./sampleconf
DSTDIR=../../php/conf/

mv    ${DSTDIR}/etc/apache2/apache2.conf ${DSTDIR}/etc/apache2/apache2.conf.dist

cp    ${CONFDIR}/apache2.conf    ${DSTDIR}/etc/apache2/
cp    ${CONFDIR}/remoteip.conf   ${DSTDIR}/etc/apache2/conf-enabled/
cp    ${CONFDIR}/php.ini         ${DSTDIR}/usr/local/etc/php

