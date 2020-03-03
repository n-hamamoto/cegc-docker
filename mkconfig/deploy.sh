#!/bin/sh

dst=..

cp docker-compose.yml     $dst
cp shibboleth2.xml        $dst/proxy/conf/etc/shibboleth
#cp -r metadata            $dst/proxy/conf/etc/shibboleth
cp -r cert                $dst/proxy/conf/etc/shibboleth
mkdir -p                  $dst/proxy/conf/etc/pki/ssl
cp -r cert/*              $dst/proxy/conf/etc/pki/ssl/
cp proxy.conf             $dst/proxy/conf/etc/httpd/conf.d/
cp shib.conf              $dst/proxy/conf/etc/httpd/conf.d/
cp config.php             $dst/php/html/conf/

