# Devcontainers Features

## Background

This repository is based on `https://github.com/devcontainers-contrib/features`.  It defines features for a variety of tools.

## Create

To create a feature from a feature definition use:

```bash
poetry run devcontainer-contrib features generate "feature_definitions/<feature_name>/feature-definition.json" "." --output-type=feature_dir
```

## Test

Before any tests, ensure that the latest base devcontainers image is pulled: `docker pull mcr.microsoft.com/vscode/devcontainers/base:debian-11`.

To test an individual feature use:

```bash
npx -y -p @devcontainers/cli@latest devcontainer features test -f <feature_name> -i "mcr.microsoft.com/vscode/devcontainers/base:debian-11"
```
