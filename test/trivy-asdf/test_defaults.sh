#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "trivy --version" trivy --version

reportResults
