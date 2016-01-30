#!/bin/bash

set -e

# first check if we're passing flags, if so
# prepend with sentry
if [ "${1:0:1}" = '-' ]; then
	set -- sentry "$@"
fi

case "$1" in
	celery|cleanup|config|createuser|devserver|django|export|help|import|init|plugins|repair|shell|start|upgrade)
		set -- sentry "$@"
	;;
	generate-secret-key)
		exec python -c 'from sentry.runner.settings import generate_secret_key; print(generate_secret_key())'
	;;
esac

exec "$@"
