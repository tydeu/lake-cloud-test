#!/usr/bin/env bash
set -euxo pipefail

TAG="$1"
LAKE="${LAKE:-lake}"

rm -rf .lake
$LAKE update -R -Ktag="$TAG"
$LAKE build @cloud_test:release
$LAKE build CloudTest | diff /dev/null -
$LAKE build
$LAKE exe test
