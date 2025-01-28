#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "safety --version" safety --version

reportResults
