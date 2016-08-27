#!/bin/bash -e

# set -x (bash debug) if log level is trace
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/log-helper
log-helper level eq trace && set -x

exec tincd --config ${CONTAINER_SERVICE_DIR}/tinc/data --no-detach $TINC_CMD_ARGS
