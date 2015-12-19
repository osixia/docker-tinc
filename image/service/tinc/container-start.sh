#!/bin/bash -e

FIRST_START_DONE="/etc/docker-tinc-first-start-done"

# container first start
if [ ! -e "$FIRST_START_DONE" ]; then

  TINC_HOSTNAME=$(echo $HOSTNAME | sed -e 's/[^a-zA-Z0-9\-]/_/g')
  /usr/sbin/tinc init $TINC_HOSTNAME

  # add root user on specified networks
  TINC_RUN_BEFORE_START_COMMANDS=($TINC_RUN_BEFORE_START_COMMANDS)
  for command in "${TINC_RUN_BEFORE_START_COMMANDS[@]}"
  do
    echo "Run tinc command: ${!command}"
    /usr/sbin/tinc ${!command}
  done

fi

exit 0
