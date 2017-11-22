#!/bin/sh

# Inspired by https://github.com/dochang/docker-shadowsocks-go

conf_dir=/etc/shadowsocks
conf=${conf_dir}/config.json
default_conf=config.default.json


# Copy default config if config not exists
false | cp -i ${default_conf} ${conf} 2>/dev/null

set -e

[ $# -gt 0 ] || {
	set +e
	cat <<EOF >&2
Usage: shadowsocks-[local|server]
---------------------------------
EOF
	shadowsocks-local --help
	echo >&2
	shadowsocks-server --help
	echo >&2
	exit 0
}

cmd=$1
shift

case $(basename "${cmd}") in
shadowsocks-local|shadowsocks-server)
	[ ! -e "${conf}" ] || exec "${cmd}" -c "${conf}" "$@"
	;;
esac
exec "${cmd}" "$@"