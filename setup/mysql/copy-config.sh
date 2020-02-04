#!/bin/sh

CONFDIR=./sampleconf
DSTDIR=../../mysql/conf/

mv    ${DSTDIR}/etc/mysql/conf.d/mysql.cnf ${DSTDIR}/etc/mysql/conf.d/mysql.cnf.dist

cp    ${CONFDIR}/mysql.cnf    ${DSTDIR}/etc/mysql/conf.d/


