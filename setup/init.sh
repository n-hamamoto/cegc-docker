#!/bin/sh

# create docker-compose.yml and Dockerfiles.
cp ./docker-compose.yml.skel ../docker-compose.yml
mkdir ../mysql
mkdir ../php;   cp php/Dockerfile   ../php
mkdir ../proxy; cp proxy/Dockerfile ../proxy

# create container images.
docker-compose build

# extract config files from containers.
cd mysql; ./extract-etc.sh; cd ..
cd php;   ./extract-etc.sh; cd ..
cd proxy; ./extract-etc.sh; cd ..

# copy sample config to volumes.
cd mysql; ./copy-config.sh; cd ..
cd php;   ./copy-config.sh; cd ..
cd proxy; ./copy-config.sh; cd ..

# create initial log files and directories.
mkdir -p ../mysql/log
touch ../mysql/log/slow.log;     chmod 777 ../mysql/log/slow.log
touch ../mysql/log/general.log;  chmod 777 ../mysql/log/general.log

mkdir -p ../proxy/log/httpd
mkdir -p ../proxy/log/shibboleth
mkdir -p ../proxy/log/shibboleth-www

# download cegc source
git clone https://github.com/n-hamamoto/cegc.git

# copy source to php container volume.
mkdir -p ../php/html
cp -r ./cegc/* ../php/html/
