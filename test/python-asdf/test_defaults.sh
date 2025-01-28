#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "python3 --version" python3 --version

reportResults
