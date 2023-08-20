#!/bin/bash

set -e

source dev-container-features-test-lib

# git-mkver requires a git repository
git config --global init.defaultBranch master
git config --global user.email "a@name.com"
git config --global user.name "A Name"

TMP_DIR=$(mktemp -d)
cd "${TMP_DIR}"
git init
touch .gitignore
git add .gitignore
git commit -m "Initial commit"

# The 'check' command comes from the dev-container-features-test-lib.
check "git-mkver info" git-mkver info

reportResults
