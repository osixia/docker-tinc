FROM osixia/experimental-light-baseimage:0.1.4
MAINTAINER Bertrand Gouny <bertrand.gouny@osixia.net>

# Install OpenLDAP, ldap-utils and ssl-helper from baseimage and remove default ldap db
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/install-service-available
RUN echo "deb http://http.debian.net/debian experimental main" >> /etc/apt/sources.list && apt-get -y update \
	  && LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	     -t experimental tinc  \
		&& apt-get clean \
		&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add service directory to /container/service
ADD service /container/service

# Use baseimage install-service script
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/install-service
RUN /container/tool/install-service

# Add default env variables
ADD environment /container/environment/99-default

EXPOSE 655/tcp 655/udp
