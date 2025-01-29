#!/usr/bin/env bash

set -e

. ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.5.5"

$nanolayer_location \
  install \
  devcontainer-feature \
  "ghcr.io/devcontainers-extra/features/pipx-package:1.1.8" \
  --option package="semgrep" --option version="$VERSION"
