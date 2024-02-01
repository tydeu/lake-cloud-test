#!/usr/bin/env bash
set -euxo pipefail

TAG="$1"

rm -rf .lake
lake update -R -Ktag="$TAG"
lake build @cloud_test:release
lake build CloudTest | diff /dev/null -
lake build
lake exe test
