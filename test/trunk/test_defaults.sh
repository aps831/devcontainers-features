#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "git init && trunk --version" git init && trunk --version

reportResults
