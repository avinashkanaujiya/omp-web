#!/usr/bin/env bash
set -euo pipefail

cd /opt/homelab/builds/omp-web
exec nsenter -t 1 -m -u -i -p -- \
  /root/.bun/bin/bun --bun node_modules/next/dist/bin/next \
  start -H "${OMP_WEB_HOSTNAME:?OMP_WEB_HOSTNAME is required}" -p "${PORT:-30141}"
