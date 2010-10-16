#!/usr/bin/env bash

host="$1"

ssh root@${host} '(\
  mkdir -p ~rails/.ssh && \
  chown -R rails:rails ~rails && \
  chmod 0700 ~rails/.ssh \
  )'

scp id_dsa id_dsa.pub root@${host}:/home/rails/.ssh/

ssh root@${host} '(\
  chown rails:rails ~rails/.ssh/{id_dsa,id_dsa.pub} && \
  chmod 0600 ~rails/.ssh/id_dsa && \
  chmod 0644 ~rails/.ssh/id_dsa.pub
  )'

authme() {
	[[ -z "$1" ]] && printf "Usage: authme <ssh_host> <user> [<pub_key>]\n" && return 10

	local host="$1"
	shift
  local user="$1"
  shift
  if [[ -z "$1" ]] ; then
    local key="${HOME}/.ssh/id_dsa.pub"
  else
    local key="$1"
  fi
  shift

	[[ ! -f "$key" ]] && echo "SSH key: $key does not exist." && return 11

	if echo "$host" | grep -q ':' ; then
		local ssh_cmd="$(echo $host | awk -F':' '{print \"ssh -p \" $2 \" \" $1}')"
	else
  	local ssh_cmd="ssh $host"
	fi

	$ssh_cmd '(if [ ! -d "~'${user}'/.ssh" ]; then \
		mkdir -m 0700 -p ~'${user}'/.ssh; fi; \
		cat - >> ~'${user}'/.ssh/authorized_keys)' < $key
}

for key in $(ls -1 keys/*.pub) ; do
  authme root@$host rails $key
done

