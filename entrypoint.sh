#!/bin/sh
set -eo pipefail

static \
  -p "${NODE_STATIC_PORT}" \
  -a "${NODE_STATIC_ADDRESS}" \
  "${NODE_STATIC_DIR}"