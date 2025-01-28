#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "doppler --version" doppler --version

reportResults
