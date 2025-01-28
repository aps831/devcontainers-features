#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "java --version" java --version
check "bashrc contents" grep "set-java-home.bash" /etc/bash.bashrc

reportResults
