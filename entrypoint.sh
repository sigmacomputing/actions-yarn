#!/bin/bash

set -e

if [ -n "$NPM_AUTH_TOKEN" ]; then
  echo "NPM_AUTH_TOKEN is set! length=$(echo -n "$NPM_AUTH_TOKEN" | wc -c)"
  # Respect NPM_CONFIG_USERCONFIG if it is provided, default to $HOME/.npmrc
  NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG-"$HOME/.npmrc"}"
  NPM_REGISTRY_URL="${NPM_REGISTRY_URL-registry.npmjs.org}"

  # Allow registry.npmjs.org to be overridden with an environment variable
  printf "//%s/:_authToken=%s\\nregistry=%s" "$NPM_REGISTRY_URL" "$NPM_AUTH_TOKEN" "$NPM_REGISTRY_URL" > "$NPM_CONFIG_USERCONFIG"
  chmod 0600 "$NPM_CONFIG_USERCONFIG"
else
  echo "NPM_AUTH_TOKEN is not set"
fi

sh -c "yarn $*"
