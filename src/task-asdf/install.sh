#!/usr/bin/env bash

PLUGIN="task"
PLUGINREPO="https://github.com/particledecay/asdf-task.git"
PLUGINREF="0831b3c"

set -e

source ./library_scripts.sh

ensure_nanolayer nanolayer_location "v0.5.6"

${nanolayer_location} \
  install \
  devcontainer-feature \
  "ghcr.io/aps831/devcontainers-features/asdf-plugin-manager-asdf:1.0.2" \
  --option plugin="${PLUGIN}" --option pluginRepo="${PLUGINREPO}" --option ref="${PLUGINREF}"

su - "${_REMOTE_USER}" <<EOF
  source /home/vscode/.asdf/asdf.sh
  asdf install "${PLUGIN}" "${VERSION}"
  asdf global "${PLUGIN}" "${VERSION}"
EOF

curl https://raw.githubusercontent.com/go-task/task/main/completion/bash/task.bash >/etc/bash_completion.d/task.bash
