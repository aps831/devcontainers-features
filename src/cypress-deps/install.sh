#!/usr/bin/env bash

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.5.6"

${nanolayer_location} \
  install \
  devcontainer-feature \
  "ghcr.io/devcontainers-extra/features/apt-get-packages:1.0.6" \
  --option packages="libgtk-3-0t64,libgbm-dev,libnotify-dev,libnss3,libxss1,libasound2t64,libxtst6,xauth,xvfb"
