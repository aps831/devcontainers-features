#!/usr/bin/env bash

PLUGIN_MANAGER="asdf-plugin-manager"
PLUGIN_MANAGER_REPO="https://github.com/asdf-community/asdf-plugin-manager.git"
PLUGIN_MANAGER_REF="0ef4f9e"
PLUGIN_MANAGER_VERSION="1.4.0"

PLUGIN_VERSIONS_FILENAME="/home/vscode/.plugin-versions"

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.4.45"

$nanolayer_location \
  install \
  devcontainer-feature \
  "ghcr.io/devcontainers-extra/features/asdf-package:1.0.10" \
  --option plugin="$PLUGIN_MANAGER" --option pluginRepo="$PLUGIN_MANAGER_REPO" --option ref="$PLUGIN_MANAGER_REF"

touch "$PLUGIN_VERSIONS_FILENAME"

if [[ $(grep "asdf-plugin-manager" "$PLUGIN_VERSIONS_FILENAME") -ne 0 ]]; then
  echo "asdf-plugin-manager  https://github.com/asdf-community/asdf-plugin-manager.git  $PLUGIN_MANAGER_REF" >>"$PLUGIN_VERSIONS_FILENAME"
fi

cat <<EOF >>"$PLUGIN_VERSIONS_FILENAME"
$PLUGIN              $PLUGINREPO                                                $REF
EOF

su - "$_REMOTE_USER" <<EOF
  source /home/vscode/.asdf/asdf.sh
  asdf plugin update asdf-plugin-manager $PLUGIN_MANAGER_REF
  asdf-plugin-manager add $PLUGIN
EOF
