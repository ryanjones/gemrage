#!/usr/bin/env bash

user=rails

if ! grep -q "^${user}:" /etc/group >/dev/null ; then
  groupadd -g 2020 ${user}
fi

if ! grep -q "^${user}:" /etc/passwd >/dev/null ; then
  useradd --comment "Rails Deployment User" --home /home/${user} \
    --gid ${user} --uid 2020 --system --shell /bin/bash ${user}
fi

if ! grep -q "^sudo:.*${user}" /etc/group >/dev/null ; then
  if grep -q "^sudo:.*:$" /etc/group >/dev/null ; then
    perl -pi -e "s|^(sudo:.*):$|\$1:${user}|" /etc/group
  else
    perl -pi -e "s|^(sudo:.*)$|\$1,${user}|" /etc/group
  fi
fi

unset user

