FROM osixia/experimental-light-baseimage:0.1.0
MAINTAINER Bertrand Gouny <bertrand.gouny@osixia.net>

# Use baseimage's init system.
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/run
CMD ["/container/tool/run"]

# Install OpenLDAP, ldap-utils and ssl-helper from baseimage and remove default ldap db
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/install-service-available
RUN echo "deb http://http.debian.net/debian experimental main" >> /etc/apt/sources.list && apt-get -y update \
	  && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	     -t experimental tinc

# Add service directory to /container/service
ADD service /container/service

# Use baseimage install-service script and clean all
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/install-service
RUN /container/tool/install-service \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add default env variables
ADD env.yaml /container/environment/env.yaml

# Set tinc config directory in a data volume
VOLUME ["/etc/tinc"]

EXPOSE 655/tcp 655/udp
