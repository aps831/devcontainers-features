#!/usr/bin/env bash

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.5.5"

$nanolayer_location \
  install \
  devcontainer-feature \
  "ghcr.io/devcontainers-extra/features/gh-release:1.0.25" \
  --option repo="dandavison/delta" --option binaryNames="delta" --option version="$VERSION"
