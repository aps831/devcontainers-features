#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "asdf-plugin-manager version" asdf-plugin-manager version
check "asdf plugin list" asdf plugin list | grep -Pzo "asdf-plugin-manager\nmaven"

reportResults
