#!/bin/bash -e

# set -x (bash debug) if log level is trace
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/log-helper
log-helper level eq trace && set -x

exec tinc -c ${CONTAINER_SERVICE_DIR}/tinc/data start --no-detach --debug=$TINC_LOG_LEVEL
