#!/usr/bin/env bash

PLUGIN="maven"
PLUGINREPO="https://github.com/proemion/asdf-maven.git"
PLUGINREF="e325ff9"

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.4.45"

${nanolayer_location} \
  install \
  devcontainer-feature \
  "ghcr.io/aps831/devcontainers-features/java-asdf:1.0.3"

${nanolayer_location} \
  install \
  devcontainer-feature \
  "ghcr.io/aps831/devcontainers-features/asdf-plugin-manager-asdf:1.0.1" \
  --option plugin="${PLUGIN}" --option pluginRepo="${PLUGINREPO}" --option ref="${PLUGINREF}"

su - "${_REMOTE_USER}" <<EOF
  source /home/vscode/.asdf/asdf.sh
  asdf install "${PLUGIN}" "${VERSION}"
  asdf global "${PLUGIN}" "${VERSION}"
EOF
