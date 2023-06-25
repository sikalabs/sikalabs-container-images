#!/bin/bash -eu
ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
echo "root:${ROOT_PASSWORD}" | chpasswd
exec "$@"
