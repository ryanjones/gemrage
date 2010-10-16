#!/usr/bin/env bash

# install:
#   bash < <(curl -L http://gist.github.com/raw/629402/moonshine_bootstrap.sh)
#

printf "===> Bootstrapping moonshine user: ${user} ...\n"

user=rails

if ! grep -q "^${user}:" /etc/group >/dev/null ; then
  printf "===> Adding group: ${user} ...\n"
  groupadd -g 2020 ${user}
fi

if ! grep -q "^${user}:" /etc/passwd >/dev/null ; then
  printf "===> Adding user: ${user} ...\n"
  useradd --comment "Rails Deployment User" --home /home/${user} \
    --gid ${user} --uid 2020 --system --shell /bin/bash ${user}
fi

printf "===> Creating home directory: /home/${user} ...\n"
mkdir -p /home/${user}
printf "===> Fixing up home directory permissions on: /home/${user} ...\n"
chown -R ${user}:${user} /home/${user}

if ! grep -q "^sudo:.*${user}" /etc/group >/dev/null ; then
  printf "===> Adding user: ${user} to sudo group ...\n"
  if grep -q "^sudo:.*:$" /etc/group >/dev/null ; then
    perl -pi -e "s|^(sudo:.*):$|\$1:${user}|" /etc/group
  else
    perl -pi -e "s|^(sudo:.*)$|\$1,${user}|" /etc/group
  fi
fi

unset user

printf "===> All done. W00t.\n\n"

