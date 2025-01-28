#!/usr/bin/env bash

PLUGIN="python"
PLUGINREPO="https://github.com/danhper/asdf-python.git"
PLUGINREF="a3a0185"

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.4.45"

$nanolayer_location \
  install \
  devcontainer-feature \
  "ghcr.io/devcontainers-extra/features/apt-get-packages:1.0.6" \
  --option packages="curl,make,build-essential,libssl-dev,zlib1g-dev,libbz2-dev,libreadline-dev,libsqlite3-dev,llvm,libncursesw5-dev,xz-utils,tk-dev,libxml2-dev,libxmlsec1-dev,libffi-dev,liblzma-dev"

$nanolayer_location \
  install \
  devcontainer-feature \
  "ghcr.io/aps831/devcontainers-features/asdf-plugin-manager-asdf:1.0.1" \
  --option plugin="$PLUGIN" --option pluginRepo="$PLUGINREPO" --option ref="$PLUGINREF"

su - "$_REMOTE_USER" <<EOF
  source /home/vscode/.asdf/asdf.sh
  asdf install "$PLUGIN" "$VERSION"
  asdf global "$PLUGIN" "$VERSION"
EOF
