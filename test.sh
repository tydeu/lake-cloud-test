#!/usr/bin/env bash
set -euxo pipefail

TAG="${1:-}"

if [ -n "$TAG" ]; then
  if git rev-parse "$TAG" >/dev/null 2>&1; then
    gh release delete "$TAG" --cleanup-tag -y
  fi

  git tag "$TAG"
  git push origin "$TAG"
  gh release create "$TAG" --generate-notes --verify-tag --prerelease

  lake build
  lake upload "$TAG"
fi

lake clean
lake build :release
lake build | diff /dev/null -
lake exe cloud_test
