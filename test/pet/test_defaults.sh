#!/bin/bash

set -e

source dev-container-features-test-lib

# The 'check' command comes from the dev-container-features-test-lib.
check "pet version" pet version

reportResults
