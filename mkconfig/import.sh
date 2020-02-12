#!/bin/sh

dst=..

cp $dst/docker-compose.yml     docker-compose.yml.skel
cp $dst/proxy/conf/etc/shibboleth/shibboleth2.xml        shibboleth2.xml.skel
#cp -r metadata            $dst/proxy/conf/etc/shibboleth
#cp -r cert                $dst/proxy/conf/etc/shibboleth
#cp -r cert/*              $dst/proxy/conf/etc/pki/ssl/
cp $dst/proxy/conf/etc/httpd/conf.d/proxy.conf             proxy.conf.skel
cp $dst/proxy/conf/etc/httpd/conf.d/shib.conf              shib.conf.skel
cp $dst/php/html/conf/config.php             .

