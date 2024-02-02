#!/usr/bin/env bash
set -euxo pipefail

TAG="${1:-}"
LAKE="${LAKE:-lake}"

if [ -n "$TAG" ]; then
  if [ "${2:-}" = "!" ]; then
    if git rev-parse "$TAG" >/dev/null 2>&1; then
      gh release delete "$TAG" --cleanup-tag -y
    fi
  fi

  if ! gh release list | grep "$TAG"; then
    git tag "$TAG"
    git push origin "$TAG"
    gh release create "$TAG" --generate-notes --verify-tag --prerelease
  fi

  $LAKE clean
  $LAKE build
  $LAKE upload "$TAG"
fi

rm -rf .lake
$LAKE build :release
$LAKE build | diff /dev/null -
$LAKE exe cloud_test

if [ -n "$TAG" ]; then
  pushd test
  LAKE="$LAKE" ./test.sh "$TAG"
  popd
fi
