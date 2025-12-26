#!/usr/bin/env bash

set -e

. ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.5.6"

$nanolayer_location \
  install \
  devcontainer-feature \
  "ghcr.io/devcontainers-extra/features/npm-package:1.0.3" \
  --option package="@trunkio/launcher" --option version="$VERSION"
