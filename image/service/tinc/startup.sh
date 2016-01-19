#!/bin/bash -e

# set -x (bash debug) if log level is trace
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/log-helper
log-helper level eq trace && set -x

FIRST_START_DONE="${CONTAINER_STATE_DIR}/docker-tinc-first-start-done"
# container first start
if [ ! -e "$FIRST_START_DONE" ]; then

  mkdir -p ${CONTAINER_STATE_DIR}/tinc/data

  TINC_HOSTNAME=$(echo $HOSTNAME | sed -e 's/[^a-zA-Z0-9\-]/_/g')
  tinc -c ${CONTAINER_STATE_DIR}/tinc/data init $TINC_HOSTNAME

  # add root user on specified networks
  for command in $(complex-bash-env iterate "${TINC_RUN_BEFORE_START_COMMANDS}")
  do
    log-helper info "Run tinc command: ${command}"
    tinc -c ${CONTAINER_STATE_DIR}/tinc/data ${command}
  done

fi

exit 0
