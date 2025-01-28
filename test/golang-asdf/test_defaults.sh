#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "go version" go version

reportResults
