#!/usr/bin/env bash

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.5.5"

${nanolayer_location} \
  install \
  devcontainer-feature \
  "ghcr.io/devcontainers-extra/features/apt-get-packages:1.0.6" \
  --option packages="libgtk2.0-0,libgtk-3-0,libgbm-dev,libnotify-dev,libgconf-2-4,libnss3,libxss1,libasound2,libxtst6,xauth,xvfb"
