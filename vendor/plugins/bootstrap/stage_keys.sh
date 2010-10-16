#!/usr/bin/env bash

host="$1"

ssh rails@${host} '(\
  mkdir -p ~/.ssh && \
  chmod 0700 ~/.ssh \
  )'

scp id_dsa id_dsa.pub rails@${host}:.ssh/

ssh rails@${host} '(\
  chown rails:rails ~/.ssh/{id_dsa,id_dsa.pub} && \
  chmod 0600 ~/.ssh/id_dsa && \
  chmod 0644 ~/.ssh/id_dsa.pub
  )'

