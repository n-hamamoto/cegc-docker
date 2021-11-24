#FROM centos:7.5.1804
FROM almalinux:8

RUN dnf -y install epel-release
RUN dnf -y install supervisor.noarch

RUN dnf -y update
RUN dnf -y install logrotate

RUN dnf -y install httpd mod_ssl

RUN yum -y install wget && wget 'https://shibboleth.net/cgi-bin/sp_repo.cgi?platform=CentOS_8'
RUN cp sp_repo.cgi\?platform=* /etc/yum.repos.d/shibboleth.repo
RUN dnf -y install shibboleth

#RUN cd /tmp && \
##curl -L -O https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz && \
#    curl -L -O https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz && \
#    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
#    rm /tmp/s6-overlay-amd64.tar.gz && \
#    ln -sf /usr/bin/sh /bin/sh && \
#    ln -sf /usr/bin/bash /bin/bash

#RUN yum -y update 
#RUN yum -y install httpd mod_ssl yum-utils

#RUN yum-config-manager --add-repo \
#      http://download.opensuse.org/repositories/security://shibboleth/CentOS_7/security:shibboleth.repo && \
#    yum -y install shibboleth && \
#    chmod a+x /etc/shibboleth/shibd-redhat

#COPY httpd.conf /etc/httpd/conf/
#COPY ssl.conf shib.conf /etc/httpd/conf.d/

#COPY etc /etc/

EXPOSE 443

ENTRYPOINT ["/init"]
