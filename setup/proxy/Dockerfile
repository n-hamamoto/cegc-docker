FROM centos:7.5.1804

RUN cd /tmp && \
#curl -L -O https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz && \
    curl -L -O https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    rm /tmp/s6-overlay-amd64.tar.gz && \
    ln -sf /usr/bin/sh /bin/sh && \
    ln -sf /usr/bin/bash /bin/bash

RUN yum -y update 
RUN yum -y install httpd mod_ssl yum-utils

RUN yum-config-manager --add-repo \
      http://download.opensuse.org/repositories/security://shibboleth/CentOS_7/security:shibboleth.repo && \
    yum -y install shibboleth && \
    chmod a+x /etc/shibboleth/shibd-redhat

#COPY httpd.conf /etc/httpd/conf/
#COPY ssl.conf shib.conf /etc/httpd/conf.d/

#COPY etc /etc/

EXPOSE 443

ENTRYPOINT ["/init"]
