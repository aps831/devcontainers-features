#!/usr/bin/env bash

PLUGIN="cosign"
PLUGINREPO="https://gitlab.com/wt0f/asdf-cosign"
PLUGINREF="746596f"

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.4.45"

$nanolayer_location \
  install \
  devcontainer-feature \
  "ghcr.io/aps831/devcontainers-features/asdf-plugin-manager-asdf:1.0.2" \
  --option plugin="$PLUGIN" --option pluginRepo="$PLUGINREPO" --option ref="$PLUGINREF"

su - "$_REMOTE_USER" <<EOF
  source /home/vscode/.asdf/asdf.sh
  asdf install "$PLUGIN" "$VERSION"
  asdf global "$PLUGIN" "$VERSION"
EOF
