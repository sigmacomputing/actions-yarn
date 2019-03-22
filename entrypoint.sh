#!/bin/bash

set -e

if [ -n "$NPM_AUTH_TOKEN" ]; then
  echo "NPM_AUTH_TOKEN is set! length=$(echo -n "$NPM_AUTH_TOKEN" | wc -c)"
  # https://github.com/johno/actions-yarn/blob/4bcd1fdf1590659b08e024e673a67d1cd13a601b/entrypoint.sh#L6
  echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
else
  echo "NPM_AUTH_TOKEN is not set"
fi

sh -c "yarn $*"
