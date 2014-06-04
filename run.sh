#!/bin/bash
if [ "$NERVE_APP" == "" ];then
  echo "NERVE_APP environment variable must be set" >&2
  exit 1
fi
if [ "$NERVE_INSTANCE" == "" ];then
  echo "NERVE_INSTANCE environment variable must be set" >&2
  exit 1
fi
PINGOUT=$(ping -c 1 -i 0 etcd 2>&1);
if [ $? != 0 ];then
  echo "WARNING: Cannot find host named 'etcd', you need to link an etcd container to this container!" >&2
  echo "$PINGOUT" >&2
#  exit 2
fi

sed -i -e"s/%%NERVE_INSTANCE%%/${NERVE_INSTANCE}/" /nerve.conf.json

# Default argument
if [ "$1" == "run" ];then
  exec /usr/local/bin/nerve -c /nerve.conf.json
fi

# Anything else :)
eval "$*"

